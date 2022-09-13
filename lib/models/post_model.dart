class PostModel {
  String? name;
    String? image;
   String? uId;
   String? dateTime;
  String? text;
  String? postImage;



  PostModel({
     this.name,
     this.image,
    this.dateTime,
    this.text,
    this.uId,
    this.postImage,
  });

  PostModel.fromJson(Map<String, dynamic> json)
  {
    dateTime = json['dateTime'];
    name = json['name'];
    image = json['image'];
    postImage = json['postImage'];
    text = json['text'];
    uId = json['uId'];
   }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'uId':uId,
      'image':image,
      'dateTime':dateTime,
      'postImage':postImage,
      'text':text,
     };
  }
}