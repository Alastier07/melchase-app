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

class Item {
  Item({
    required this.name,
    required this.quantity,
    required this.amount,
  });

  final String name;
  final String quantity;
  final double amount;
}
