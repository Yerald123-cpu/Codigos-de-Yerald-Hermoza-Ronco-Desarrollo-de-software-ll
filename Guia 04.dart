// ============================================================
// GUIA 04 - APLICACION FLUTTER
// Autor: Estudiante
// Descripción:
// Este proyecto contiene las 3 actividades solicitadas:
//
// ACTIVIDAD 1
// Mostrar dos imágenes:
// - una desde internet
// - una desde assets del proyecto
//
// ACTIVIDAD 2
// Leer un archivo de texto del proyecto y mostrarlo en pantalla
//
// ACTIVIDAD 3
// Galería de imágenes usando GridView y animación Hero
// ============================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

// ============================================================
// APLICACION PRINCIPAL
// ============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuPrincipal(),
    );
  }
}

// ============================================================
// MENU PRINCIPAL PARA ACCEDER A LAS ACTIVIDADES
// ============================================================

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guía 04 Flutter"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // BOTON ACTIVIDAD 1
            ElevatedButton(
              child: const Text("Actividad 1 - Imágenes"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Actividad1()),
                );
              },
            ),

            // BOTON ACTIVIDAD 2
            ElevatedButton(
              child: const Text("Actividad 2 - Leer Archivo"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Actividad2()),
                );
              },
            ),

            // BOTON ACTIVIDAD 3
            ElevatedButton(
              child: const Text("Actividad 3 - Galería"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GaleriaPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//
// ============================================================
// ACTIVIDAD 1
// Mostrar una imagen de internet y una imagen local
// ============================================================
//

class Actividad1 extends StatelessWidget {
  const Actividad1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actividad 1 - Imágenes"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Imagen desde Internet",
              style: TextStyle(fontSize: 18),
            ),

            // Imagen cargada desde una URL
            Image.network(
              "https://picsum.photos/250",
            ),

            const SizedBox(height: 20),

            const Text(
              "Imagen desde el proyecto",
              style: TextStyle(fontSize: 18),
            ),

            // Imagen cargada desde assets
            Image.asset(
              "assets/images/imagen.png",
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}

//
// ============================================================
// ACTIVIDAD 2
// Leer un archivo de texto desde el proyecto
// ============================================================
//

class Actividad2 extends StatefulWidget {
  const Actividad2({super.key});

  @override
  State<Actividad2> createState() => _Actividad2State();
}

class _Actividad2State extends State<Actividad2> {

  // Variable que almacenará el texto leído
  String texto = "Presione el botón para cargar el archivo";

  // ------------------------------------------------
  // Función que lee el archivo de texto
  // ------------------------------------------------
  getData() async {

    String response =
        await rootBundle.loadString('archivos_texto/mis_apuntes.txt');

    setState(() {
      texto = response;
    });
  }

  // ------------------------------------------------
  // Limpia el texto
  // ------------------------------------------------
  clearData() {
    setState(() {
      texto = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actividad 2 - Leer Archivo"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Text(texto),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: getData,
              child: const Text("Get Data"),
            ),

            ElevatedButton(
              onPressed: clearData,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }
}

//
// ============================================================
// ACTIVIDAD 3
// Galería de imágenes con GridView y Hero
// ============================================================
//

class GaleriaPage extends StatelessWidget {
  const GaleriaPage({super.key});

  final List<String> images = const [

    "https://picsum.photos/300?1",
    "https://picsum.photos/300?2",
    "https://picsum.photos/300?3",
    "https://picsum.photos/300?4",
    "https://picsum.photos/300?5",
    "https://picsum.photos/300?6",

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galería de Imágenes"),
      ),

      body: GridView.builder(

        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),

        itemCount: images.length,

        itemBuilder: (context, index) {

          return GestureDetector(

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailPage(image: images[index]),
                ),
              );
            },

            child: Hero(

              tag: images[index],

              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// Pantalla que muestra la imagen ampliada
// ============================================================

class DetailPage extends StatelessWidget {

  final String image;

  const DetailPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Hero(
          tag: image,
          child: Image.network(image),
        ),
      ),
    );
  }
}
