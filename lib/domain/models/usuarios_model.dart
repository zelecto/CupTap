class Usuario {
    final String cedula;
    final String nombre;
    final String apellidos;
    final String telefono;
    final String username;
    final String? password;

    Usuario({
        required this.cedula,
        required this.nombre,
        required this.apellidos,
        required this.telefono,
        required this.username,
        this.password,
    });

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        cedula: json["cedula"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        telefono: json["telefono"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "cedula": cedula,
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "username": username,
        "password": password,
    };

    @override
    String toString() {
      return '$cedula, $nombre, $apellidos, $telefono';
    }
}