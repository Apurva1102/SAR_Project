class TeacherModel {
  bool? status;
  String? message;
  Data? data;

  TeacherModel({this.status, this.message, this.data});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? userRole;
  String? token;
  int? teacherId;
  int? teacherSchoolId;
  String? teacherEmpId;
  String? teacherEmail;
  String? schoolName;
  String? name;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userNumber;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? updatedBy;
  String? userPhoto;

  Data(
      {this.userId,
        this.userRole,
        this.token,
        this.teacherId,
        this.teacherSchoolId,
        this.teacherEmpId,
        this.teacherEmail,
        this.schoolName,
        this.name,
        this.userName,
        this.userEmail,
        this.userPassword,
        this.userNumber,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.userPhoto});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userRole = json['userRole'];
    token = json['token'];
    teacherId = json['teacher_id'];
    teacherSchoolId = json['teacher_school_id'];
    teacherEmpId = json['teacher_emp_id'];
    teacherEmail = json['teacher_email'];
    schoolName = json['school_name'];
    name = json['name'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userPassword = json['userPassword'];
    userNumber = json['userNumber'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    userPhoto = json['userPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userRole'] = this.userRole;
    data['token'] = this.token;
    data['teacher_id'] = this.teacherId;
    data['teacher_school_id'] = this.teacherSchoolId;
    data['teacher_emp_id'] = this.teacherEmpId;
    data['teacher_email'] = this.teacherEmail;
    data['school_name'] = this.schoolName;
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['userPassword'] = this.userPassword;
    data['userNumber'] = this.userNumber;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['userPhoto'] = this.userPhoto;
    return data;
  }
}
