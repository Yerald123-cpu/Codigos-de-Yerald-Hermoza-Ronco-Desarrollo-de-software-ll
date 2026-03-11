import 'package:flutter/material.dart';

// Clase que define la pantalla con el TabBar
class TabsScreen extends StatelessWidget {

  // Constructor
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Controlador de pestañas
    return DefaultTabController(

      // Número total de pestañas
      length: 10,

      child: Scaffold(

        // SafeArea evita que el contenido choque con bordes del sistema
        body: SafeArea(

          child: Column(

            children: const [

              // TABBAR
              TabBar(

                // Permite desplazamiento horizontal
                isScrollable: true, 

                // Color del texto seleccionado
                labelColor: Colors.black,

                // Color del texto no seleccionado
                unselectedLabelColor: Colors.grey,

                // Lista de pestañas
                tabs: [

                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                  Tab(text: 'Tab 4'),
                  Tab(text: 'Tab 5'),
                  Tab(text: 'Tab 6'),
                  Tab(text: 'Tab 7'),
                  Tab(text: 'Tab 8'),
                  Tab(text: 'Tab 9'),
                  Tab(text: 'Tab 10'),

                ],
              ),

              // CONTENIDO DE LAS PESTAÑAS
              Expanded(

                child: TabBarView(

                  children: [

                    Icon(Icons.train),
                    Icon(
  Icons.directions_car,
  size: 120,
),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                    Icon(Icons.flight),
                    Icon(Icons.directions_boat),
                    Icon(Icons.directions_bus),
                    Icon(Icons.directions_walk),
                    Icon(Icons.motorcycle),
                    Icon(Icons.subway),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}