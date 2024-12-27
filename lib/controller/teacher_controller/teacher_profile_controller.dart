import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/teacher_model/teacher_profile_model.dart';

class TeacherProfileController extends GetxController {
  var isLoading = true.obs;
  var isUploading = false.obs;
  int userId = 0;
  var teacherProfile = Rxn<Results>();
  var userName = ''.obs;
  var userNumber = 0.obs;
  var name = ''.obs;
  var className = ''.obs;
  var sectionName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeacherProfile();
    loadUserInfo();
  }

  Future<void> fetchTeacherProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;

    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('http://20.235.242.228:5006/getProfileDetails/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        print(response.body);
        final jsonData = jsonDecode(response.body);
        final results = jsonData['results'] as List;
        if (results.isNotEmpty) {
          teacherProfile(Results.fromJson(results[0]));
        } else {
          print('Results list is empty');
        }
      } else {
        print('Error fetching profile: ${response.statusCode}');
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? '';
    userNumber.value = prefs.getInt('userNumber') ?? 0;
    name.value = prefs.getString('name') ?? '';
    className.value = prefs.getString('class_name') ?? '';
    sectionName.value = prefs.getString('section_name') ?? '';
  }

  Future<void> uploadProfileTeacher() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      isUploading.value = true;

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://20.235.242.228:5006/updatePhoto/$userId'),
      );

      var stream = http.ByteStream(file.openRead());
      var length = await file.length();

      // Change the key to 'profileTeacher'
      var multipartFile = http.MultipartFile(
        'profilePicture', // Use the correct key here
        stream,
        length,
        filename: file.path.split('/').last,
      );

      request.files.add(multipartFile);

      try {
        print("Uploading file: ${file.path}");
        var response = await request.send();

        print("Response status: ${response.statusCode}");

        if (response.statusCode == 200) {
          print("Photo uploaded successfully");
          await fetchTeacherProfile();
        } else {
          final responseBody = await response.stream.bytesToString();
          print(
              "Failed to upload photo: ${response.statusCode}, Response: $responseBody");
        }
      } catch (e) {
        print("Error: $e");
      } finally {
        isUploading.value = false;
      }
    } else {
      print("No image selected");
    }
  }
}
