import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../blocs/purchase_bloc/purchase_bloc.dart';
import '../models/purchase_model.dart';

class NewPurchaseScreen extends StatefulWidget {
  const NewPurchaseScreen({super.key});

  @override
  State<NewPurchaseScreen> createState() => _NewPurchaseScreenState();
}

class _NewPurchaseScreenState extends State<NewPurchaseScreen> {
  // Date now (default)
  final defaultDate = DateTime.now();
  final datePickerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    datePickerController.text = DateFormat('MM, dd yyyy').format(defaultDate);
  }

  @override
  void dispose() {
    super.dispose();
    datePickerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TextFormField(
              controller: datePickerController,
              readOnly: true,
              onTap: () async {
                // Show datepicker
                final dateSelected = await showDatePicker(
                  context: context,
                  initialDate: defaultDate,
                  firstDate: DateTime(defaultDate.year),
                  lastDate: DateTime(2100),
                );
                // Store value
                datePickerController.text = DateFormat('MM, dd yyyy')
                    .format(dateSelected ?? defaultDate);
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final purchaseReadBloc = context.read<PurchaseBloc>();
                  // Add purchase
                  purchaseReadBloc.add(
                    AddPurchase(
                      purchase: Purchase(
                        pid: purchaseReadBloc.purchaseLenght + 1,
                        title: datePickerController.text,
                        items: <Item>[],
                      ),
                    ),
                  );
                  // Close screen
                  Navigator.of(context).pop();
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
