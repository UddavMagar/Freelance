
import 'package:image_picker/image_picker.dart';

class Users {
  String name;
  String password;
  String email;
  PickedFile userImg;
  String cpassowrd;
  String id;


  Users({this.name,
    this.email,
    this.password,
    this.userImg,
    this.cpassowrd});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": this.name,
      "email": this.email,
      "userImg": this.userImg.path.toString(),
      "id": this.id,
    };

    return map;
  }

}