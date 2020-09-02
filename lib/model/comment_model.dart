// import 'dart:html';

class Comment {
String name;
String email;
String body;

Comment.fromJson(Map<String,dynamic> json){
  name = json['name'];
  email = json['email'];
  body = json['body'];
}

}