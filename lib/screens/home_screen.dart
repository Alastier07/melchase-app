import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melchase_app/blocs/purchase_bloc/purchase_bloc.dart';
import 'package:melchase_app/screens/new_purchase_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Melchase'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const NewPurchaseScreen(),
              ),
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<PurchaseBloc, PurchaseState>(
        builder: (context, state) {
          if (state.purchase.isEmpty) {
            return const Center(
              child: Text('No available purchase yet.'),
            );
          } else {
            final purchase = state.purchase;

            return ListView.builder(
              itemCount: purchase.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(purchase[index].title),
              ),
            );
          }
        },
      ),
    );
  }
}
