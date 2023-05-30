import 'package:hive/hive.dart';

class ApplyEntity {
  bool? status;
  ApplyJob? data;

  ApplyEntity({this.status, this.data});
}

@HiveType(typeId: 0)
class ApplyJob extends HiveObject{

  @HiveField(0)
  String? name;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? mobile;
  @HiveField(3)
  String? workType;
  @HiveField(4)
  String? otherFile;
  @HiveField(5)
  String? jobsId;
  @HiveField(6)
  String? userId;
  @HiveField(7)
  bool? reviewed;
  @HiveField(8)
  String? updatedAt;
  @HiveField(9)
  String? createdAt;
  @HiveField(10)
  int? id;

  ApplyJob(
      {this.name,
        this.email,
        this.mobile,
        this.workType,
        this.otherFile,
        this.jobsId,
        this.userId,
        this.reviewed,
        this.updatedAt,
        this.createdAt,
        this.id});

  ApplyJob.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    otherFile = json['other_file'];
    jobsId = json['jobs_id'];
    userId = json['user_id'];
    reviewed = json['reviewed'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['work_type'] = this.workType;
    data['other_file'] = this.otherFile;
    data['jobs_id'] = this.jobsId;
    data['user_id'] = this.userId;
    data['reviewed'] = this.reviewed;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}