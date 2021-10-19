import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario => _usuario!;
  bool get existeUsuario => _usuario != null ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void eliminarUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    _usuario!.profesiones!.add(profesion);
    notifyListeners();
  }
}
