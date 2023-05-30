import '../../../domin/entities/profile/update_profile_entity.dart';

class UpdateProfileModel extends UpdateProfileEntity{
  UpdateProfileModel({
    bool? status,
    Profile? data
  }) : super (
    status: status,
    data: data
  );

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Profile.fromJson(json['data']) : null;
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