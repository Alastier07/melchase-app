import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melchase_app/screens/home_screen.dart';

import 'blocs/item_bloc/item_bloc.dart';
import 'blocs/purchase_bloc/purchase_bloc.dart';

class MelchaseApp extends StatelessWidget {
  const MelchaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PurchaseBloc()),
        BlocProvider(create: (context) => ItemBloc()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
