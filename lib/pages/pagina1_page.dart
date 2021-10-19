import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estadosapp/models/usuario.dart';
import 'package:estadosapp/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => usuarioService.eliminarUsuario(),
        ),
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : const Center(child: Text('No existe usuario')),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.pages),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${user.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.profesiones!
              .map(
                (profesion) => ListTile(
                  title: Text(profesion),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
