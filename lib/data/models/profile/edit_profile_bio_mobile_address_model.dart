import '../../../domin/entities/profile/edit_profile_bio_mobile_address.dart';

class EditProfileBioMobileAddressModel extends EditProfileBioMobileAddressEntity{

  EditProfileBioMobileAddressModel({
    bool? status,
    Data? data
  }) : super (
    status: status,
    data: data
  );

  EditProfileBioMobileAddressModel.fromJson(Map<String, dynamic> json) {
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