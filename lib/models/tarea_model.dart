class Tarea {
  static int cantidadTareas = 0;//para saber cuantos Tarea he instanciado
  static List staticTareas = [];//en vez de pasarlo como parametros me parece mas comodo hacerlo como una varible estatica

  String? _titulo;
  String? _descripcion;
  bool? _check;

  Tarea({String? titulo, String? descripcion, bool? check}) {
    if (titulo != null) {
      this._titulo = titulo;
    }
    if (descripcion != null) {
      this._descripcion = descripcion;
    }
    if (check != null) {
      this._check = check;
    }
  }

  String? get titulo => _titulo;
  set titulo(String? titulo) => _titulo = titulo;
  String? get descripcion => _descripcion;
  set descripcion(String? descripcion) => _descripcion = descripcion;
  bool? get check => _check;
  set check(bool? check) => _check = check;

  Tarea.fromJson(Map<String, dynamic> json) {
    _titulo = json['Titulo'];
    _descripcion = json['Descripcion'];
    _check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Titulo'] = this._titulo;
    data['Descripcion'] = this._descripcion;
    data['check'] = this._check;
    return data;
  }
}
