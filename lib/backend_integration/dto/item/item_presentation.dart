import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/item.dart';

class ItemPresentation extends Equatable {
  const ItemPresentation(ItemEntity entity) : super();
  const ItemPresentation.empty() : super();

  void updateValues() {}

  ItemEntity getEntity() {
    return ItemEntity();
  }

  @override
  List<Object?> get props => [];
}
