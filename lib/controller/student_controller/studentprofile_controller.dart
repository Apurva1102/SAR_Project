import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/student_model/student_profile_model.dart';

class StudentProfileController extends GetxController {
  var isLoading = true.obs;
  var isUploading = false.obs;
  int userId = 0;
  var className = ''.obs;
  var sectionName = ''.obs;
  var studentProfile = Rxn<StudentResults>();

  @override
  void onInit() {
    super.onInit();
    fetchStudentProfile();
    _loadUserData();
  }

  Future<void> fetchStudentProfile() async {
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
        print('UserId:$userId');
        print(response.body);
        final jsonData = jsonDecode(response.body);
        final results = jsonData['results'] as List;
        if (results.isNotEmpty) {
          studentProfile(StudentResults.fromJson(results[0]));
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

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;
    className.value = prefs.getString('class_name') ?? '';
    sectionName.value = prefs.getString('section_name') ?? '';
    print('Class Name: ${className.value}, Section Name: ${sectionName.value}');
  }

  Future<void> uploadProfilePhoto() async {
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

      var multipartFile = http.MultipartFile(
        'profilePicture',
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

          // Fetch updated profile data
          await fetchStudentProfile();
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
