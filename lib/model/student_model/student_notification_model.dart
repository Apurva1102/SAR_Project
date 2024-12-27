class StudentNotificationModel {
  bool? status;
  Messages? messages;

  StudentNotificationModel({this.status, this.messages});

  StudentNotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messages = json['messages'] != null
        ? new Messages.fromJson(json['messages'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.messages != null) {
      data['messages'] = this.messages!.toJson();
    }
    return data;
  }
}

class Messages {
  String? classMessage;
  String? sectionMessage;
  String? reassignMessage;
  String? teacherMessage;

  Messages(
      {this.classMessage,
        this.sectionMessage,
        this.reassignMessage,
        this.teacherMessage});

  Messages.fromJson(Map<String, dynamic> json) {
    classMessage = json['classMessage'];
    sectionMessage = json['sectionMessage'];
    reassignMessage = json['reassignMessage'];
    teacherMessage = json['TeacherMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classMessage'] = this.classMessage;
    data['sectionMessage'] = this.sectionMessage;
    data['reassignMessage'] = this.reassignMessage;
    data['TeacherMessage'] = this.teacherMessage;
    return data;
  }
}
