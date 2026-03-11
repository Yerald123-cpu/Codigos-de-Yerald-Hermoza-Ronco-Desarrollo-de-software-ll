// Importa Flutter Material
import 'package:flutter/material.dart';

// Importa la página 2
import 'package:flutter_application_1/pages/pagina02.dart';

// Función principal
void main() {
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      // Oculta la etiqueta DEBUG
      debugShowCheckedModeBanner: false,

      // Ruta inicial
      initialRoute: '/',

      // Definición de rutas
      routes: {

        // Ruta principal
        '/': (context) => const Pagina01(),

        // Ruta de la página 2
        '/pagina02': (context) => const Pagina02(),

      },

    );
  }
}

// ---------------------
// PAGINA 01
// ---------------------

class Pagina01 extends StatelessWidget {

  const Pagina01({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Página 01"),
      ),

      body: Center(

        child: ElevatedButton(

          child: const Text("Ir a la página 02"),

          onPressed: () {

            // Navegación usando nombre de ruta
            Navigator.pushNamed(context, '/pagina02');

          },

        ),

      ),

    );
  }
}