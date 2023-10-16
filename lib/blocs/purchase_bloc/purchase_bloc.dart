import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/purchase_model.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  PurchaseBloc() : super(PurchaseBlocInitial(purchase: [])) {
    on<AddPurchase>(_addPurchase);
    on<DeletePurchase>(_deletePurchase);
    on<UpdatePurchase>(_updatePurchase);
  }

  int get purchaseLenght => state.purchase.length;

  void _addPurchase(AddPurchase event, Emitter<PurchaseState> emit) {
    state.purchase.add(event.purchase);
    emit(PurchaseBlocUpdated(purchase: state.purchase));
  }

  void _deletePurchase(DeletePurchase event, Emitter<PurchaseState> emit) {
    state.purchase.remove(event.purchase);
    emit(PurchaseBlocUpdated(purchase: state.purchase));
  }

  void _updatePurchase(UpdatePurchase event, Emitter<PurchaseState> emit) {
    final purchaseIndexToUpdate = state.purchase.indexWhere(
      (purchase) => purchase.pid == event.purchase.pid,
    );

    state.purchase.removeAt(purchaseIndexToUpdate);
    state.purchase.insert(purchaseIndexToUpdate, event.purchase);

    emit(PurchaseBlocUpdated(purchase: state.purchase));
  }
}
