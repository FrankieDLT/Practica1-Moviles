// DONE: Crear producto "ProductCup" siguiendo la logica de Drinks y Grains
// DONE: Agregar al ProductRepository una lista de estos productos.
import 'dart:math';
import 'package:flutter/foundation.dart';

enum ProductPortion { MEDIA, ENTERA }

class ProductDesserts {
  final String productTitle; // nombre del producto
  final String productDescription; // descripcion del producto
  final String productImage; // url de imagen del producto
  ProductPortion productPortion; // porcion del producto
  double productPrice; // precio del producto autocalculado
  final int productAmount; // cantidad de producto por comprar
  final bool liked;

  ProductDesserts({
    @required this.productTitle,
    @required this.productDescription,
    @required this.productImage,
    @required this.productPortion,
    @required this.productAmount,
    this.liked = false,
  }) {
    // inicializa el precio de acuerdo al portion del producto
    productPrice = productPriceCalculator();
  }

  double productPriceCalculator() {
    if (this.productPortion == ProductPortion.MEDIA)
      return (20 + Random().nextInt(40)).toDouble();
    if (this.productPortion == ProductPortion.ENTERA)
      return (40 + Random().nextInt(60)).toDouble();
    return 9999.0;
  }
}
