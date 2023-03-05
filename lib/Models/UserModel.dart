class UserModel {

  String ? name ;
  String ? image ;
  String ? token  ;
  String ? phone ;
  int ? id ;
  String ? email ;

UserModel({required this.image , required this.phone,required this.name,required this.token,required this.email,required this.id});

UserModel.fromJson(Map<String,dynamic> returnedData ){
  name = returnedData['name'];
  image = returnedData['image'];
  token = returnedData['token'];
  phone = returnedData['phone'];
  id = returnedData['id'];
  email= returnedData['email'];

}

}