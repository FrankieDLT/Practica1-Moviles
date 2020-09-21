import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

import 'product_dessert.dart';
import 'product_grains.dart';
import 'product_hot_drinks.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;

  final String productImage; // url de imagen del producto
  final bool liked;

  ProductSize productSize; // tamano del producto
  ProductWeight productWeight; // tamano del producto
  ProductPortion productPortion; // porcion del producto

  ProductItemCart({
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.typeOfProduct,
    @required this.productImage,
    @required this.liked,
    @required this.productSize,
    @required this.productWeight,
    @required this.productPortion
    
  });
}
