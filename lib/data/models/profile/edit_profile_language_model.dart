import '../../../domin/entities/profile/edit_profile_language_endtity.dart';

class EditProfileLanguageModel extends EditProfileLanguageEntity{
  EditProfileLanguageModel({
    bool? status,
    Data? data
  }) : super (
    status: status,
    data: data
  );

  EditProfileLanguageModel.fromJson(Map<String, dynamic> json) {
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