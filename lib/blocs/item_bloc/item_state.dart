part of 'item_bloc.dart';

// @immutable
sealed class ItemState {
  final List<Item> item;

  ItemState({required this.item});
}

final class ItemInitial extends ItemState {
  ItemInitial({required List<Item> item}) : super(item: item);
}

final class ItemUpdated extends ItemState {
  ItemUpdated({required List<Item> item}) : super(item: item);
}
