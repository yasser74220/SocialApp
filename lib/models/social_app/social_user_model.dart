class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? image;
  String? bio;
  String? uId;
  bool? isEmailVerified;

  SocialUserModel({
    this.email,
    this.name,
    this.phone,
    this.image,
    this.bio,
    this.uId,
    this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json)
  {
    email = json['email'];
    name = json['name'];
    image = json['image'];
    phone = json['phone'];
    bio = json['bio'];

    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'email':email,
      'image':image,
      'bio':bio,
      'phone':phone,
      'isEmailVerified':isEmailVerified,
    };
  }
}