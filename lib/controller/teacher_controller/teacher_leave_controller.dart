import 'package:get/get.dart';
import '../../model/teacher_model/teacher_leave_model.dart';
import '../../services/teacher_api_service/teacher_leave.dart';

class TeacherLeaveController extends GetxController {
  var isLoading = true.obs;
  var leaveData = <Data>[].obs;
  var errorMessage = ''.obs;

  final LeaveService leaveService = LeaveService();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchLeaveData() async {
    print("Fetching leave data for the logged-in user.");
    isLoading(true);

    try {
      var leaveTeacherModel = await leaveService.fetchLeaves();
      print("Received response from service");

      if (leaveTeacherModel != null && leaveTeacherModel.data != null) {
        print("Leave data found: ${leaveTeacherModel.data}");
        leaveData.assignAll(leaveTeacherModel.data!);
      } else {
        print("No leave data found");
        errorMessage('No data found');
      }
    } catch (e) {
      print("Error occurred: $e");
      errorMessage('Failed to fetch leave data: ${e.toString()}');
    } finally {
      isLoading(false);
      print("Loading state set to false");
    }
  }
}
