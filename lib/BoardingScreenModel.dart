class BoardingScreenModel{
  late String title ;
  late String image ;
  late String desc ;
  BoardingScreenModel(this.title,this.desc,this.image);
}
List<BoardingScreenModel> bsmItems = [
  BoardingScreenModel("ORDER ONLINE","Make your order sitting on a sofa , play and choose online", "assets/images/onboarding1blue.png"),
  BoardingScreenModel("M-COMMERCE", "Download your application and buy using your phone or laptop", "assets/images/onboarding2blue.png"),
  BoardingScreenModel("DELIVERY SERVICES", "Modern delivering technologies . Shipping to the porch of your apartment", "assets/images/onboarding3blue.png")

];

