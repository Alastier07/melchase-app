import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/item_model.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial(item: [])) {
    on<AddItem>(_addItem);
    on<DeleteItem>(_deleteItem);
    on<UpdateItem>(_updateItem);
  }

  void _addItem(AddItem event, Emitter<ItemState> emit) {
    state.item.add(event.item);
    emit(ItemUpdated(item: state.item));
  }

  void _deleteItem(DeleteItem event, Emitter<ItemState> emit) {
    state.item.remove(event.item);
    emit(ItemUpdated(item: state.item));
  }

  void _updateItem(UpdateItem event, Emitter<ItemState> emit) {
    final itemIndexToUpdate = state.item.indexWhere(
      (item) => item.id == event.item.id,
    );

    state.item.removeAt(itemIndexToUpdate);
    state.item.insert(itemIndexToUpdate, event.item);

    emit(ItemUpdated(item: state.item));
  }
}
