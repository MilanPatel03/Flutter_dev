class CartsMainModel{

  List<CartsModel>?carts;
  int?limit;
  int?skip;
  int?total;

  CartsMainModel({this.carts,this.limit,this.skip,this.total});

  factory CartsMainModel.fromjson(Map<String,dynamic> json){

    List<CartsModel> totalCarts=[];

    for(Map<String,dynamic> eachCart in json['carts']){
      totalCarts.add(CartsModel.fromjson(eachCart));
    }

    return CartsMainModel(
      carts: totalCarts,
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
    );
  }
}

class CartsModel{
  num?discountedTotal;
  int?id;
  List<ProductsModel>?products;
  num?total;
  int?totalProducts;
  int?totalQuantity;
  int?userId;

  CartsModel({this.discountedTotal,this.id,this.products,this.total,this.totalProducts,this.totalQuantity,this.userId});

  factory CartsModel.fromjson(Map<String,dynamic> json){

    List<ProductsModel> cartTotalProducts=[];

    for(Map<String,dynamic> eachProduct in json['products']){
      cartTotalProducts.add(ProductsModel.fromjson(eachProduct));
    }

    return CartsModel(
      discountedTotal: json['discountedTotal'],
      id: json['id'],
      products: cartTotalProducts,
      total: json['total'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
      userId: json['userId'],
    );
  }
}

class ProductsModel{
  num?discountedTotal;
  num?discountPercentage;
  int?id;
  num?price;
  int?quantity;
  dynamic thumbnail;
  String?title;
  num? total;

  ProductsModel({this.discountedTotal,this.discountPercentage,this.id,this.price,this.quantity,this.thumbnail,this.title,this.total});

  factory ProductsModel.fromjson(Map<String,dynamic> json){
    return ProductsModel(
      title: json['title'],
      discountedTotal: json['discountedTotal'],
      discountPercentage: json['discountPercentage'],
      id: json['id'],
      price: json['price'],
      quantity: json['quantity'],
      thumbnail: json['thumbnail'],
    );
  }
}