part of 'purchase_bloc.dart';

sealed class PurchaseEvent {}

class AddPurchase extends PurchaseEvent {
  final Purchase purchase;

  AddPurchase({required this.purchase});
}

class DeletePurchase extends PurchaseEvent {
  final Purchase purchase;

  DeletePurchase({required this.purchase});
}

class UpdatePurchase extends PurchaseEvent {
  final Purchase purchase;

  UpdatePurchase({required this.purchase});
}
