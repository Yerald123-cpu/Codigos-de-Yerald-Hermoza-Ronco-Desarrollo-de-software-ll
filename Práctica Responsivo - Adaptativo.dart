import 'package:flutter/material.dart';

void main() {
  runApp(const AdaptableDashboardApp());
}

class AdaptableDashboardApp extends StatelessWidget {
  const AdaptableDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practica Responsive',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: LayoutBuilder(

        builder: (context, constraints) {

          if (constraints.maxWidth > 600) {

            return Row(

              children: const [

                Expanded(child: MobileLayout()),

                Expanded(child: MobileLayout())

              ],

            );

          } else {

            return const MobileLayout();

          }

        },

      ),

    );

  }

}

class MobileLayout extends StatelessWidget {

  const MobileLayout({super.key});

  @override

  Widget build(BuildContext context) {

    return SingleChildScrollView(

      padding: const EdgeInsets.all(20),

      child: Column(

        children: [

          Container(
            height: 100,
            color: Colors.deepPurple,
            child: const Center(
              child: Text(
                "HEADER",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "BALANCE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            height: 100,
            color: Colors.green,
            child: const Center(
              child: Text(
                "ACCIONES",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

        ],

      ),

    );

  }

}
