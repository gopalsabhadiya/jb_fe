import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/add_to_cart_notifier.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with AddItemToCartNotifier {
  CartBloc() : super(const CartState()) {
    on<AddItemToCart>(_addItemToCart);
    on<RemoveItemFromCart>(_removeItemFromCart);
    on<DecreaseItemQuantityInCart>(_decreaseItemQuantityInCart);
    on<AddPartyToCart>(_addPartyToCart);
  }

  FutureOr<void> _addItemToCart(AddItemToCart event, Emitter<CartState> emit) {
    final List<ItemPresentation> stateCartItems = state.itemList;
    final List<ItemPresentation> newList = <ItemPresentation>[
      ...stateCartItems
    ];

    event.item.setCartQuantity(event.item.cartQuantity + 1);

    if (stateCartItems.where((item) => item.id == event.item.id).isEmpty) {
      newList.add(event.item);
    }

    emit(
      state.copyWith(
        itemList: newList,
        totalItemCount: state.totalItemCount + 1,
      ),
    );
    notifySubscriber(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _removeItemFromCart(
      RemoveItemFromCart event, Emitter<CartState> emit) {
    List<ItemPresentation> filteredCart =
        state.itemList.where((item) => item.id != event.item.id).toList();
    emit(
      state.copyWith(
        itemList: filteredCart,
        totalItemCount: state.totalItemCount - event.item.cartQuantity,
      ),
    );
    event.item.setCartQuantity(0);
    notifySubscriber(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _decreaseItemQuantityInCart(
      DecreaseItemQuantityInCart event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        itemList: state.itemList.map((item) {
          if (item.id == event.item.id) {
            item.setCartQuantity(item.cartQuantity - 1);
          }
          return item;
        }).toList(),
        totalItemCount: state.totalItemCount - 1,
      ),
    );
    notifySubscriber(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _addPartyToCart(
      AddPartyToCart event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        party: event.party,
      ),
    );
  }
}
