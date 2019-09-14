import 'dart:convert';

Productos productosFromJson(String str) => Productos.fromJson(json.decode(str));

String productosToJson(Productos data) => json.encode(data.toJson());

class Productos {
  String nombreApp;
  List<Product> product;

  Productos({
    this.nombreApp,
    this.product,
  });

  factory Productos.fromJson(Map<String, dynamic> json) => Productos(
    nombreApp: json["nombreApp"],
    product: List<Product>.from(json["Product"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nombreApp": nombreApp,
    "Product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class Product {
  String codigo;
  String title;
  String descripcion;
  String precio;

  Product({
    this.codigo,
    this.title,
    this.descripcion,
    this.precio,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    codigo: json["Codigo"],
    title: json["Title"],
    descripcion: json["Descripcion"],
    precio: json["Precio"],
  );

  Map<String, dynamic> toJson() => {
    "Codigo": codigo,
    "Title": title,
    "Descripcion": descripcion,
    "Precio": precio,
  };
}
