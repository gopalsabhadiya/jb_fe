import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'item_form_toggle_state.dart';

class ItemFormToggleCubit extends Cubit<ItemFormToggleState> {
  ItemFormToggleCubit() : super(ItemFormToggleInitial());
}
