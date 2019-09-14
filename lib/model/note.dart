
class Note {
  String codigo;
  String title;
  String descripcion;
  String precio;

  Note({
    this.codigo,
    this.title,
    this.descripcion,
    this.precio,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    codigo: json["Codigo"],
    title: json["Title"],
    descripcion: json["Descripcion"],
    precio: json["Precio"],
  );
  }