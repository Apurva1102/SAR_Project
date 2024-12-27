class TeacherProfileModel {
  bool? status;
  List<Results>? results;

  TeacherProfileModel({this.status, this.results});

  TeacherProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? userName;
  String? userEmail;
  String? userNumber;
  String? userPhoto;

  Results(
      {this.name,
        this.userName,
        this.userEmail,
        this.userNumber,
        this.userPhoto});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    userNumber = json['userNumber'];
    userPhoto = json['userPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['userNumber'] = this.userNumber;
    data['userPhoto'] = this.userPhoto;
    return data;
  }
}
