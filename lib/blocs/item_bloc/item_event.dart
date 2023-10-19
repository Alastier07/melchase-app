part of 'item_bloc.dart';

// @immutable
sealed class ItemEvent {}

class AddItem extends ItemEvent {
  final Item item;

  AddItem({required this.item});
}

class DeleteItem extends ItemEvent {
  final Item item;

  DeleteItem({required this.item});
}

class UpdateItem extends ItemEvent {
  final Item item;

  UpdateItem({required this.item});
}
