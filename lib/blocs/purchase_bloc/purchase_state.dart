part of 'purchase_bloc.dart';

sealed class PurchaseState {
  final List<Purchase> purchase;

  PurchaseState({required this.purchase});
}

class PurchaseBlocInitial extends PurchaseState {
  PurchaseBlocInitial({required List<Purchase> purchase})
      : super(purchase: purchase);
}

class PurchaseBlocUpdated extends PurchaseState {
  PurchaseBlocUpdated({required List<Purchase> purchase})
      : super(purchase: purchase);
}
