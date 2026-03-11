import 'package:flutter/material.dart';

class Pagina02 extends StatelessWidget {

  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Página 02"),
      ),

      body: Center(

        child: ElevatedButton(

          child: const Text("Regresar"),

          onPressed: () {

            // Regresa a la pantalla anterior
            Navigator.pop(context);

          },

        ),

      ),

    );
  }
}