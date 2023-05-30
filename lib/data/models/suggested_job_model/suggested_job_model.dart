
import '../../../domin/entities/suggested_job/suggested_job_entity.dart';

class SuggestedJobModel extends SuggestedJobEntity{
  SuggestedJobModel({
    bool? status,
    List<SuggestedJob>? data
  }) : super(
    status: status,
    data: data
  );

  SuggestedJobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SuggestedJob>[];
      json['data'].forEach((v) {
        data!.add(new SuggestedJob.fromJson(v));
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