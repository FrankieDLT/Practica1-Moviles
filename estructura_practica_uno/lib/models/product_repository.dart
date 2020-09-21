import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

enum ProductType { BEBIDAS, GRANO, POSTRES }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------              ----------------------------//
    // ----------------------       Tazas      ----------------------------//
    // ----------------------              ----------------------------//

    //if (prodType == ProductType.POSTRES) {
    // DONE: Agregar al menos 5 productos "postres"
    //}

    // ----------------------              ----------------------------//
    // ----------------------       Granos      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.GRANO)
      return <ProductGrains>[
        ProductGrains(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Guilis",
          productDescription: "La mezcla de cinco orígenes diferentes.",
          productImage:
              "https://www.cafesguilis.com/wp-content/uploads/2018/08/mezcla_especial_1Kg.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Illy",
          productDescription:
              "Con toque de chocolate, miel, caramelo y un cierto amargor. ",
          productImage:
              "https://http2.mlstatic.com/illy-cafe-en-grano-etiopia-arabica-seleccion-de-un-solo-or-D_NQ_NP_987783-MLM31233980209_062019-F.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Sanani",
          productDescription:
              "Tiene un muy buen sabor intenso y con fuerte acidez.",
          productImage:
              "https://http2.mlstatic.com/cafe-tostado-en-granos-1kg-origen-colombia-maquinas-express-D_NQ_NP_947249-MLA31115265526_062019-Q.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "La Mexicana",
          productDescription:
              "Es un café único por la manera en la que están tostados sus granos.",
          productImage:
              "https://www.lamexicana.es/404-large_default/cafe-1890-mezcla-suave.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
      ];
    // ----------------------              ----------------------------//
    // ----------------------       Bebida caliente      ----------------------------//
    // ----------------------              ----------------------------//
    if (prodType == ProductType.BEBIDAS)
      return <ProductHotDrinks>[
        ProductHotDrinks(
          productTitle: "Ristretto",
          productDescription: "Expresso con una proporción menor de agua.",
          productImage:
              "https://ineedcoffee.com/wp-content/uploads/2007/09/IMG_9259.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Americano",
          productDescription:
              "Derivado del espresso, con mayor cantidad de agua.",
          productImage:
              "https://cafe.omcns.com/wp-content/uploads/2018/08/Americano-2.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Expresso",
          productDescription:
              "Uno de los tipos de café más básicos y sencillos.",
          productImage:
              "https://cdn.cnn.com/cnnnext/dam/assets/200120171537-espresso-machine-stock-large-169.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Lungo",
          productDescription:
              "Aquí es directamente la infusión la que se produce en mayor cantidad.",
          productImage:
              "https://coffeegearx.com/wp-content/uploads/2019/08/What-Does-a-Lungo-Taste-Like.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café bombón",
          productDescription:
              "Se sustituye la leche normal por la leche condensada.",
          productImage: "https://ua.all.biz/img/ua/catalog/4944889.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Mocca",
          productDescription:
              "Además de leche y café se emplea Mocolate o cacao.",
          productImage:
              "https://www.juanvaldezcafe.com/sites/default/files/mocca_grande.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café con leche",
          productDescription: "Incorporación de leche al café.",
          productImage:
              "https://www.goodfood.com.au/content/dam/images/3/f/6/p/i/image.related.articleLeadwide.620x349.3f2ru.png/1411331099390.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Café vienés",
          productDescription: "Se acompaña en vez de leche con crema o nata.",
          productImage:
              "https://www.hogarmania.com/archivos/201105/vienes-xl-668x400x80xX.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Macchiato",
          productDescription: "Expresso con una ligera cantidad de leche.",
          productImage:
              "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Macchiato.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Cappuccino",
          productDescription: "Un tercio de café y el resto leche.",
          productImage:
              "https://www.perfectdailygrind.com/wp-content/uploads/2019/02/cappuccino-1.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductHotDrinks(
          productTitle: "Azteca",
          productDescription:
              "Además de café, hielo y leche una o más bolas de helado.",
          productImage:
              "https://www.gastronomiavasca.net/uploads/image/file/6838/w700_caf__azteca.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
      ];
      // ----------------------              ----------------------------//
    // ----------------------       Postres      ----------------------------//
    // ----------------------              ----------------------------//
    if(prodType == ProductType.POSTRES)
    return <ProductDesserts>[
      ProductDesserts(
          productTitle: "Pastel de Fresa",
          productDescription: "Una nueva forma de disfrutar el clasico postre de fresas con crema para compartir con la familia.",
          productImage:
              "https://www.tasteofhome.com/wp-content/uploads/2020/03/Berry-Cool-Cream-and-Pretzel-Pie_EXPS_TOHJJ20_242812_E02_05_6b-696x696.jpg",
          productPortion: ProductPortion.MEDIA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Oreo Deluxe",
          productDescription: "Galleta oreo rellena con mantequilla de maní y bañada en chocolate adornada con chispas azucaradas.",
          productImage:
              "https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vd3d3LmJyaXQuY28vbWVkaWEtbGlicmFyeS9leUpoYkdjaU9pSklVekkxTmlJc0luUjVjQ0k2SWtwWFZDSjkuZXlKcGJXRm5aU0k2SW1oMGRIQnpPaTh2WVhOelpYUnpMbkppYkM1dGN5OHlNVGc1TXpFeU5TOXZjbWxuYVc0dWFuQm5JaXdpWlhod2FYSmxjMTloZENJNk1UWXhNVGszTVRreU1uMC50cVlGZ1lJejByWkdXZ3ZFVnZTQVhHOUYzNXk5eGRwRjNLczhUUTdmc1NNL2ltYWdlLmpwZz93aWR0aD05ODAiLCJleHBpcmVzX2F0IjoxNjIxODgyODQyfQ.6bpg6imzKIsZYWKcUcJ0BR41xWr6I9KcnYrbb-qkogU/img.jpg?width=2000&height=2000",
          productPortion: ProductPortion.ENTERA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "MC Cheesecake",
          productDescription: "Mezcla de pie de queso infundida con un toque de menta y chocolate sobre pequeños brownies de chocolate.",
          productImage:
              "https://i0.wp.com/www.missinthekitchen.com/wp-content/uploads/2019/02/Mint-Chocolate-Chip-Cheesecake-Recipe-Image.jpg?fit=650%2C433&ssl=1",
          productPortion: ProductPortion.ENTERA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Ginger Pie",
          productDescription: "Pie de gengibre con un toque de limón cubierto con galleta molida",
          productImage:
              "https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/53/2011/09/Lemon-and-lime-ginger-crunch-1-scaled.jpg",
          productPortion: ProductPortion.MEDIA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Pie de Queso M",
          productDescription: "Pastel cremoso de queso con mermelada de moras y pedacitos de moras añadidos.",
          productImage:
              "https://assets.rebelmouse.io/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpbWFnZSI6Imh0dHBzOi8vd3d3LmJyaXQuY28vbWVkaWEtbGlicmFyeS9leUpoYkdjaU9pSklVekkxTmlJc0luUjVjQ0k2SWtwWFZDSjkuZXlKcGJXRm5aU0k2SW1oMGRIQnpPaTh2WVhOelpYUnpMbkppYkM1dGN5OHlNVFUzTVRZNU5pOXZjbWxuYVc0dWFuQm5JaXdpWlhod2FYSmxjMTloZENJNk1UWTBOVE13T1RreU9YMC5KQkgybEY4ZkZwTkZwVnlIZlJOSTdpWHlKODczQnJwdHhRc09DUWZWOHRZL2ltYWdlLmpwZz93aWR0aD05ODAiLCJleHBpcmVzX2F0IjoxNjA1NjkwMDgwfQ.FAu_bHmYtI955bzpYOdCNkkIspyxWIwjruej_-S5pbQ/img.jpg?width=2000&height=2000",
          productPortion: ProductPortion.MEDIA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Dona de Chocolate",
          productDescription: "Dona estilo clasico cubierta de chocolate de lecho con chispas de chocolate negro.",
          productImage:
              "https://i1.wp.com/www.eatthis.com/wp-content/uploads//media/images/ext/216809149/vegan-desserts-recipes.jpg?resize=640%2C360&ssl=1",
          productPortion: ProductPortion.ENTERA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Bolsa de Churros",
          productDescription: "Bolsita de 10 churros hechos con receta casera.",
          productImage:
              "https://www.happyfoodstube.com/wp-content/uploads/2015/09/homemade-churros-image.jpg",
          productPortion: ProductPortion.ENTERA,
          productAmount: 0,
        ),
        ProductDesserts(
          productTitle: "Pastel Red Velved",
          productDescription: "Esponjoso pastel de chocolate Red Velved tradicional americana.",
          productImage:
              "https://www.recetassinlactosa.com/wp-content/uploads/2019/02/Tarta-red-velvet-2.jpg",
          productPortion: ProductPortion.MEDIA,
          productAmount: 0,
        ),

    ];
    return List(); // otherwise empty list
  }
}
