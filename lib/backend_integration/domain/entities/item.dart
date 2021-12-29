import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/data/models/item/item_model.dart';

String? ignoreIfEmpty(String? value) {
  return value == null || value.isEmpty ? null : value;
}

class ItemEntity extends Equatable {
  const ItemEntity() : super();

  @override
  List<Object?> get props => [];

  ItemModel getModel() {
    return const ItemModel();
  }
}
