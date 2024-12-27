import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/teacher_model/teacher_timetable_model.dart';
import '../../services/teacher_api_service/teacher_api_services.dart';

class DaysOfWeekController extends GetxController {
  var selectedDay = ''.obs;
  var timetableData = <TeachertimetableData>[].obs;
  var timetableIndex = <String, List<TeachertimetableData>>{}.obs;
  var isLoading = true.obs;
  int userId = 0;

  final TeacherApiService apiService = TeacherApiService();

  @override
  void onInit() {
    super.onInit();
    fetchTimetableData().then((_) {
      selectDay('Monday');
    });
  }

  void selectDay(String day) {
    selectedDay.value = day;
  }

  // Helper function to format time
  String formatTime(String? timeString) {
    if (timeString == null) {
      return 'N/A';
    }

    try {
      final DateTime time = DateFormat("HH:mm:ss").parse(timeString);
      final formattedTime = DateFormat("hh:mm a").format(time);
      return formattedTime;
    } catch (e) {
      return 'N/A';
    }
  }

  Future<void> fetchTimetableData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('userId') ?? 0;
    print("Fetching timetable data... $userId");
    isLoading.value = true;

    final timetableModel = await apiService.fetchTeacherTimetable(userId);

    if (timetableModel != null) {
      timetableData.value = timetableModel.data ?? [];

      for (var data in timetableData) {
        data.ttStartTime = formatTime(data.ttStartTime);
        data.ttEndTime = formatTime(data.ttEndTime);
      }

      timetableIndex.value = timetableData
          .fold<Map<String, List<TeachertimetableData>>>({}, (index, data) {
        final day = data.ttDay;
        if (day != null) {
          (index[day] ??= []).add(data);
        }
        return index;
      });

      print("Timetable index: $timetableIndex");
    }

    isLoading.value = false;
  }

  List<TeachertimetableData> getSelectedDayData() {
    final selectedData = timetableIndex[selectedDay.value] ?? [];
    print(
        "Getting data for selected day: ${selectedDay.value}, Data: $selectedData");
    return selectedData;
  }
}
