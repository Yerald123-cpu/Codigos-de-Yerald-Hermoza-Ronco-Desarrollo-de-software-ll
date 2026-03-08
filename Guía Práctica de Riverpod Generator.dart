/* =========================================================
CONFIGURACIÓN DE DEPENDENCIAS (pubspec.yaml)
=========================================================

dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

dev_dependencies:
  build_runner: ^2.4.9
  riverpod_generator: ^2.4.0

Comando para generar código:
flutter pub run build_runner build

=========================================================
ARCHIVO: providers.dart
Lógica de negocio usando Riverpod Generator
========================================================= */

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

/// NIVEL 1: Provider simple
@riverpod
String welcomeMessage(Ref ref) {
  return "¡Bienvenido a la Arquitectura Reactiva Modern!";
}

/// NIVEL 2: Notifier (contador)
@riverpod
class Counter extends _$Counter {

  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}

/// NIVEL 3: AsyncNotifier
@riverpod
class ProductList extends _$ProductList {

  @override
  Future<List<String>> build() async {

    await Future.delayed(const Duration(seconds: 2));

    return [
      "Laptop",
      "Mouse",
      "Teclado"
    ];
  }

  Future<void> addProduct(String item) async {

    final previousState = await future;

    state = const AsyncValue.loading();

    try {

      await Future.delayed(const Duration(seconds: 1));

      if (item.contains("error")) {
        throw Exception("Error al guardar en servidor");
      }

      final newList = [...previousState, item];

      state = AsyncValue.data(newList);

    } catch (error, stackTrace) {

      state = AsyncValue.error(error, stackTrace);

    }
  }
}

/* =========================================================
ARCHIVO: main.dart
Interfaz reactiva usando Riverpod
========================================================= */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const ArchitectureDemoScreen(),
    );
  }
}

class ArchitectureDemoScreen extends ConsumerWidget {

  const ArchitectureDemoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final message = ref.watch(welcomeMessageProvider);
    final count = ref.watch(counterProvider);
    final productsAsync = ref.watch(productListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod 3.0 Demo")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(message),

            const Divider(),

            Row(
              children: [

                Text("Contador: $count"),

                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: const Text("+"),
                ),

                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).reset();
                  },
                  child: const Text("Reset"),
                ),

              ],
            ),

            const Divider(),

            const Text("Productos Async:"),

            Expanded(
              child: productsAsync.when(

                data: (products) => ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(products[index])),
                ),

                loading: () =>
                    const Center(child: CircularProgressIndicator()),

                error: (err, stack) =>
                    Center(child: Text("Error: $err")),
              ),
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {

          ref.read(productListProvider.notifier)
              .addProduct("Nuevo Item");

        },

        child: const Icon(Icons.add),

      ),
    );
  }
}
