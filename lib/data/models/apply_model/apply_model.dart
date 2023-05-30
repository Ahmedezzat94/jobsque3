import '../../../domin/entities/apply_entity/apply_entity.dart';

class ApplyJobModel extends ApplyEntity{
  ApplyJobModel({
    bool? status,
    ApplyJob? data
  }) : super(
    status: status,
    data: data
  );

  ApplyJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ApplyJob.fromJson(json['data']) : null;
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