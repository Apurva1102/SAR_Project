import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/student_model/student_model.dart';
import '../../services/student_api_service/student_api_service.dart';

class StudentDaysOfWeekController extends GetxController {
  var selectedDay = 'Monday'.obs;
  var timetableData = <StudentData>[].obs;
  var timetableIndex = <String, List<StudentData>>{}.obs;
  var isLoading = true.obs;

  final StudentApiService apiService = StudentApiService();

  @override
  void onInit() {
    super.onInit();
    fetchTimetableStudentData();
  }

  void selectDay(String day) {
    selectedDay.value = day;
  }

  String formatTime(String? timeString) {
    if (timeString == null) return 'N/A';

    try {
      final DateTime time = DateFormat("HH:mm:ss").parse(timeString);
      return DateFormat("hh:mm a").format(time);
    } catch (e) {
      return 'N/A';
    }
  }

  // Fetch the timetable data for the student
  Future<void> fetchTimetableStudentData() async {
    print("Fetching student timetable data...");
    isLoading.value = true;

    final timetableModel = await apiService.fetchStudentTimetable();

    if (timetableModel != null && timetableModel.data != null) {
      timetableData.value = timetableModel.data!;

      for (var data in timetableData) {
        data.ttStartTime = formatTime(data.ttStartTime);
        data.ttEndTime = formatTime(data.ttEndTime);
      }

      timetableIndex.value =
          timetableData.fold<Map<String, List<StudentData>>>({}, (index, data) {
        final day = data.ttDay;
        if (day != null) {
          (index[day] ??= []).add(data);
        }
        return index;
      });

      print("Student timetable index: $timetableIndex");
    } else {
      Get.snackbar('Error', 'Failed to fetch timetable data');
    }

    isLoading.value = false;
  }

  List<StudentData> getSelectedDayData() {
    final selectedData = timetableIndex[selectedDay.value] ?? [];

    selectedData.sort((a, b) {
      final startTimeA = a.ttStartTime != null
          ? DateFormat("hh:mm a").parse(a.ttStartTime!)
          : DateTime.now();
      final startTimeB = b.ttStartTime != null
          ? DateFormat("hh:mm a").parse(b.ttStartTime!)
          : DateTime.now();
      return startTimeA.compareTo(startTimeB);
    });

    print(
        "Sorted data for selected day: ${selectedDay.value}, Data: $selectedData");
    return selectedData;
  }
}
