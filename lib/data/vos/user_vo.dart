class UserVO {
  int? id;
  String? name;
  String? email;
  int? workSiteId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  UserVO(
      {this.id,
      this.name,
      this.email,
      this.workSiteId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  UserVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    workSiteId = json['work_site_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['work_site_id'] = this.workSiteId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
