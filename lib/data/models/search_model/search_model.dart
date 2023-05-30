import '../../../domin/entities/recent_job/recent_job_entity.dart';
import '../../../domin/entities/search/search_entity.dart';

class SearchModel extends SearchEntity{

  SearchModel({
    bool? status,
    List<RecentJob>? data
  }): super(
    status: status,
    data: data
  );

  SearchModel.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <RecentJob>[];
      json['data'].forEach((v) {
        data!.add(new RecentJob.fromJson(v));
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