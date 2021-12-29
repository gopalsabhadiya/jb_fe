import 'package:jb_fe/backend_integration/domain/entities/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends ItemEntity {
  const ItemModel() : super();

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  static List<ItemModel> fromJsonToList(List<dynamic> json) {
    for (int i = 0; i < json.length; i++) {
      ItemModel.fromJson(json[i]);
    }
    return List<ItemModel>.from(json.map((party) => ItemModel.fromJson(party)));
  }
}
