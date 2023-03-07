class CategoryModel{
  int? id ;
  String? image ;
  CategoryModel.fromJson({required Map<String,dynamic>CategorydatafromAPI }){
    id = CategorydatafromAPI['id'];
    image = CategorydatafromAPI['image'];
  }


}