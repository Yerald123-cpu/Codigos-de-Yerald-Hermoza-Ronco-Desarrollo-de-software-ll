/*
---------------------------------------------------------
GUÍA DE APLICACIÓN N°03 – TABBAR Y NAVEGACIÓN
Curso: Desarrollo de Software II
Autor: Yerald Hermoza Ronco

En esta guía se implementa:

1. Uso del widget TabBar para navegar entre diferentes
   pestañas dentro de la aplicación.

2. Uso del widget TabBarView para mostrar el contenido
   correspondiente a cada pestaña.

3. Uso del widget Navigator para navegar entre
   diferentes pantallas dentro de la aplicación.
---------------------------------------------------------
*/

// Importamos la librería principal de Flutter
// Esta librería permite usar los componentes visuales
// como botones, textos, AppBar, Scaffold, etc.
import 'package:flutter/material.dart';


// ----------------------------------------------------
// FUNCIÓN PRINCIPAL DE LA APLICACIÓN
// ----------------------------------------------------
void main() {

  // runApp inicia la ejecución de la aplicación
  // y recibe como parámetro el widget principal
  runApp(const MyApp());

}


// ----------------------------------------------------
// CLASE PRINCIPAL DE LA APLICACIÓN
// ----------------------------------------------------
class MyApp extends StatelessWidget {

  // Constructor de la clase
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // MaterialApp es el contenedor principal
    // de una aplicación Flutter
    return MaterialApp(

      // Oculta la etiqueta DEBUG que aparece
      // en la esquina superior derecha
      debugShowCheckedModeBanner: false,

      // Título de la aplicación
      title: 'Guía 03 Flutter',

      // Tema visual de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Pantalla inicial de la aplicación
      home: const TabsScreen(),

    );
  }
}


// ----------------------------------------------------
// PANTALLA QUE CONTIENE EL TABBAR
// ----------------------------------------------------
class TabsScreen extends StatelessWidget {

  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // DefaultTabController permite controlar
    // el comportamiento del TabBar
    return DefaultTabController(

      // Número total de pestañas
      length: 10,

      child: Scaffold(

        // Barra superior de la aplicación
        appBar: AppBar(

          // Título que aparece en la barra superior
          title: const Text("TabBar en Flutter"),

          // TabBar se coloca dentro del AppBar
          bottom: const TabBar(

            // Permite que las pestañas se puedan
            // desplazar horizontalmente
            isScrollable: true,

            // Lista de pestañas
            tabs: [

              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
              Tab(text: "Tab 4"),
              Tab(text: "Tab 5"),
              Tab(text: "Tab 6"),
              Tab(text: "Tab 7"),
              Tab(text: "Tab 8"),
              Tab(text: "Tab 9"),
              Tab(text: "Tab 10"),

            ],
          ),
        ),

        // TabBarView muestra el contenido
        // correspondiente a cada pestaña
        body: TabBarView(

          children: [

            pantalla("Contenido de Tab 1"),
            pantalla("Contenido de Tab 2"),
            pantalla("Contenido de Tab 3"),
            pantalla("Contenido de Tab 4"),
            pantalla("Contenido de Tab 5"),
            pantalla("Contenido de Tab 6"),
            pantalla("Contenido de Tab 7"),
            pantalla("Contenido de Tab 8"),
            pantalla("Contenido de Tab 9"),
            pantalla("Contenido de Tab 10"),

          ],
        ),

      ),
    );
  }
}


// ----------------------------------------------------
// WIDGET QUE MUESTRA EL CONTENIDO DE CADA TAB
// ----------------------------------------------------
Widget pantalla(String texto){

  return Center(

    child: Column(

      // Centra los elementos verticalmente
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        // Texto que muestra el contenido
        Text(
          texto,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        // Botón para navegar a la segunda página
        ElevatedButton(

          child: const Text("Ir a Página 02"),

          onPressed: (){

            // Navigator permite cambiar de pantalla
            Navigator.push(

              // Contexto actual
              navigatorKey.currentContext!,

              // Ruta hacia la nueva pantalla
              MaterialPageRoute(

                builder: (context) => const Pagina02(),

              ),
            );

          },

        )

      ],

    ),

  );
}


// ----------------------------------------------------
// CLAVE GLOBAL PARA CONTROLAR EL NAVIGATOR
// ----------------------------------------------------
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


// ----------------------------------------------------
// SEGUNDA PÁGINA DE LA APLICACIÓN
// ----------------------------------------------------
class Pagina02 extends StatelessWidget {

  const Pagina02({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Barra superior de la segunda pantalla
      appBar: AppBar(
        title: const Text("Página 02"),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Título principal
            const Text(
              "FIREBASE",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Descripción de Firebase
            const Padding(

              padding: EdgeInsets.all(20),

              child: Text(
                "Firebase es una plataforma de desarrollo de aplicaciones que proporciona herramientas para crear aplicaciones móviles y web.",
                textAlign: TextAlign.center,
              ),

            ),

            const SizedBox(height: 20),

            // Botón para regresar a la pantalla anterior
            ElevatedButton(

              child: const Text("Regresar"),

              onPressed: (){

                // Navigator.pop vuelve a la pantalla anterior
                Navigator.pop(context);

              },

            )

          ],

        ),

      ),

    );
  }
}
