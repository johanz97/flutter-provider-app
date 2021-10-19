import 'package:estadosapp/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estadosapp/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text(
                  'Establecer usuario',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () => usuarioService.usuario = Usuario(
                    nombre: 'Johan',
                    edad: 24,
                    profesiones: ['FullStack Developer', 'Architect'])),
            MaterialButton(
                child: const Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: usuarioService.existeUsuario
                    ? () => usuarioService.cambiarEdad(20)
                    : null),
            MaterialButton(
                child: const Text(
                  'Añadir Profesión',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () =>
                    usuarioService.agregarProfesion('Soccer Player'))
          ],
        ),
      ),
    );
  }
}
