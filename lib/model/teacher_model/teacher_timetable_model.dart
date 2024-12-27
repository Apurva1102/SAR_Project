class TeacherTimetableModel {
  bool? status;
  List<TeachertimetableData>? data;

  TeacherTimetableModel({this.status, this.data});

  TeacherTimetableModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TeachertimetableData>[];
      json['data'].forEach((v) {
        data!.add(new TeachertimetableData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeachertimetableData {
  int? timeTableId;
  int? ttUserId;
  int? ttSchoolId;
  String? ttClassSection;
  String? ttDay;
  String? ttLecture;
  String? ttTeacher;
  String? ttSubject;
  int? ttStatus;
  String? ttStartTime;
  String? ttEndTime;
  String? ttDate;
  String? createdAt;

  TeachertimetableData(
      {this.timeTableId,
        this.ttUserId,
        this.ttSchoolId,
        this.ttClassSection,
        this.ttDay,
        this.ttLecture,
        this.ttTeacher,
        this.ttSubject,
        this.ttStatus,
        this.ttStartTime,
        this.ttEndTime,
        this.ttDate,
        this.createdAt});

  TeachertimetableData.fromJson(Map<String, dynamic> json) {
    timeTableId = json['time_table_id'];
    ttUserId = json['tt_userId'];
    ttSchoolId = json['tt_schoolId'];
    ttClassSection = json['tt_class_section'];
    ttDay = json['tt_day'];
    ttLecture = json['tt_lecture'];
    ttTeacher = json['tt_teacher'];
    ttSubject = json['tt_subject'];
    ttStatus = json['tt_status'];
    ttStartTime = json['tt_start_time'];
    ttEndTime = json['tt_end_time'];
    ttDate = json['tt_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_table_id'] = this.timeTableId;
    data['tt_userId'] = this.ttUserId;
    data['tt_schoolId'] = this.ttSchoolId;
    data['tt_class_section'] = this.ttClassSection;
    data['tt_day'] = this.ttDay;
    data['tt_lecture'] = this.ttLecture;
    data['tt_teacher'] = this.ttTeacher;
    data['tt_subject'] = this.ttSubject;
    data['tt_status'] = this.ttStatus;
    data['tt_start_time'] = this.ttStartTime;
    data['tt_end_time'] = this.ttEndTime;
    data['tt_date'] = this.ttDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
