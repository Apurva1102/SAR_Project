class StudentModel {
  bool? status;
  List<StudentData>? data;

  StudentModel({this.status, this.data});

  StudentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <StudentData>[];
      json['data'].forEach((v) {
        data!.add(new StudentData.fromJson(v));
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

class StudentData {
  String? ttClassSectionId;
  String? ttClassSection;
  String? ttDay;
  String? ttLecture;
  String? ttTeacherId;
  String? ttTeacher;
  String? ttSubjectId;
  String? ttSubject;
  String? ttStartTime;
  String? ttEndTime;
  String? ttDate;

  StudentData(
      {this.ttClassSectionId,
        this.ttClassSection,
        this.ttDay,
        this.ttLecture,
        this.ttTeacherId,
        this.ttTeacher,
        this.ttSubjectId,
        this.ttSubject,
        this.ttStartTime,
        this.ttEndTime,
        this.ttDate});

  StudentData.fromJson(Map<String, dynamic> json) {
    ttClassSectionId = json['tt_class_section_id'];
    ttClassSection = json['tt_class_section'];
    ttDay = json['tt_day'];
    ttLecture = json['tt_lecture'];
    ttTeacherId = json['tt_teacher_id'];
    ttTeacher = json['tt_teacher'];
    ttSubjectId = json['tt_subject_id'];
    ttSubject = json['tt_subject'];
    ttStartTime = json['tt_start_time'];
    ttEndTime = json['tt_end_time'];
    ttDate = json['tt_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tt_class_section_id'] = this.ttClassSectionId;
    data['tt_class_section'] = this.ttClassSection;
    data['tt_day'] = this.ttDay;
    data['tt_lecture'] = this.ttLecture;
    data['tt_teacher_id'] = this.ttTeacherId;
    data['tt_teacher'] = this.ttTeacher;
    data['tt_subject_id'] = this.ttSubjectId;
    data['tt_subject'] = this.ttSubject;
    data['tt_start_time'] = this.ttStartTime;
    data['tt_end_time'] = this.ttEndTime;
    data['tt_date'] = this.ttDate;
    return data;
  }
}
