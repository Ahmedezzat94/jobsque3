import '../../../domin/entities/auth/my_user_entity.dart';

class MyUserModel extends MyUserEntity{

  MyUserModel({
    bool? status,
    Data? data
  }):super(
    status: status,
    data: data
  );

  MyUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}