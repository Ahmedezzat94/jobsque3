class FavoriteEntity {
  bool? status;
  Data? data;

  FavoriteEntity({this.status, this.data});

}


class Data {
  String? userId;
  String? jobId;
  bool? like;
  String? image;
  String? name;
  String? location;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
        this.jobId,
        this.like,
        this.image,
        this.name,
        this.location,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    jobId = json['job_id'];
    like = json['like'];
    image = json['image'];
    name = json['name'];
    location = json['location'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['job_id'] = this.jobId;
    data['like'] = this.like;
    data['image'] = this.image;
    data['name'] = this.name;
    data['location'] = this.location;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}