class ProfileEntity {
  Data? data;
  bool? status;

  ProfileEntity({this.data, this.status});


}

class Data {
  int? id;
  String? name;
  String? otp;
  String? towStep;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.otp,
        this.towStep,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    towStep = json['tow_step'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['otp'] = this.otp;
    data['tow_step'] = this.towStep;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}