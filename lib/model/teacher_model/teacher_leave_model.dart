class LeaveTeacherModel {
  bool? status;
  List<Data>? data;

  LeaveTeacherModel({this.status, this.data});

  LeaveTeacherModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
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

class Data {
  int? leaveSectionId;
  String? leaveType;
  int? leaveSchoolId;
  int? leaveUserId;
  String? dateFrom;
  String? fromDayType;
  String? dateTo;
  String? toDayType;
  String? reason;
  int? leaveStatus;

  Data(
      {this.leaveSectionId,
        this.leaveType,
        this.leaveSchoolId,
        this.leaveUserId,
        this.dateFrom,
        this.fromDayType,
        this.dateTo,
        this.toDayType,
        this.reason,
        this.leaveStatus});

  Data.fromJson(Map<String, dynamic> json) {
    leaveSectionId = json['leaveSectionId'];
    leaveType = json['leaveType'];
    leaveSchoolId = json['leave_schoolId'];
    leaveUserId = json['leave_userId'];
    dateFrom = json['dateFrom'];
    fromDayType = json['fromDayType'];
    dateTo = json['dateTo'];
    toDayType = json['toDayType'];
    reason = json['Reason'];
    leaveStatus = json['leave_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveSectionId'] = this.leaveSectionId;
    data['leaveType'] = this.leaveType;
    data['leave_schoolId'] = this.leaveSchoolId;
    data['leave_userId'] = this.leaveUserId;
    data['dateFrom'] = this.dateFrom;
    data['fromDayType'] = this.fromDayType;
    data['dateTo'] = this.dateTo;
    data['toDayType'] = this.toDayType;
    data['Reason'] = this.reason;
    data['leave_status'] = this.leaveStatus;
    return data;
  }
}
