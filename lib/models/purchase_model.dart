import 'item_model.dart';

class Purchase {
  Purchase({
    required this.pid,
    required this.title,
    required this.items,
  });

  final int pid;
  final String title;
  final List<Item> items;
}
