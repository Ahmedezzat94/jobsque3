import '../../../domin/entities/auth/login_entity.dart';

class LoginModel extends LoginEntity{
  LoginModel({
    User? user,
    String? token,
    bool? status
  }) : super(
    user:  user,
    status: status,
    token: token
  );


  LoginModel.fromJson(Map<String, dynamic> json) {
    user = json['\$user'] != null ? new User.fromJson(json['\$user']) : null;
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['\$user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    data['status'] = this.status;
    return data;
  }
}