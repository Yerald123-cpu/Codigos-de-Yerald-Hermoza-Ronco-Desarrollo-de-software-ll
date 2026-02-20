import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: const [

                CustomAppBar(),

                SizedBox(height: 20),

                BalanceCard(),

                SizedBox(height: 20),

                QuickActions(),

                SizedBox(height: 20),

                TransactionsList(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [

        Text(
          "Hola Yerald",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        CircleAvatar(
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          "Saldo: S/ 1500",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 20,
      children: [

        ActionButton(
          icon: Icons.send,
          label: "Enviar",
        ),

        ActionButton(
          icon: Icons.add,
          label: "Agregar",
        ),

        ActionButton(
          icon: Icons.money,
          label: "Pagar",
        ),

      ],
    );
  }
}

class ActionButton extends StatelessWidget {

  final IconData icon;
  final String label;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        CircleAvatar(
          radius: 30,
          child: Icon(icon),
        ),

        Text(label),

      ],
    );
  }
}

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: const [

        TransactionItem(
          title: "Netflix",
          amount: "- S/ 40",
        ),

        TransactionItem(
          title: "Pago",
          amount: "+ S/ 200",
        ),

      ],
    );
  }
}

class TransactionItem extends StatelessWidget {

  final String title;
  final String amount;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {

    return ListTile(

      title: Text(title),

      trailing: Text(amount),

    );
  }
}
