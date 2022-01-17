import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/add_to_cart_notifier.dart';
import 'package:jb_fe/util/item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with AddItemToCartNotifier {
  CartBloc()
      : super(
          CartState(order: OrderPresentation.empty()),
        ) {
    on<AddGoldRate>(_setGoldRate);
    on<AddItemToCart>(_addItemToCart);
    on<RemoveItemFromCart>(_removeItemFromCart);
    on<DecreaseItemQuantityInCart>(_decreaseItemQuantityInCart);
    on<AddPartyToCart>(_addPartyToCart);
  }

  FutureOr<void> _addItemToCart(AddItemToCart event, Emitter<CartState> emit) {
    emit(state.copyWith(
      status: CartStatus.LOADING,
    ));

    ItemPresentation eventItem = event.item;

    eventItem.setCartQuantity(event.item.cartQuantity + 1);

    ItemUtils.calculateAndSetItemPriceDetails(
        item: eventItem, goldRate: state.order.goldRate);

    OrderPresentation order = state.order;

    if (order.items.where((item) => item.id == event.item.id).isEmpty) {
      order.addItem(event.item);
    } else {
      order.items
          .where((item) => item.id == event.item.id)
          .first
          .setCartQuantity(event.item.cartQuantity);
    }

    emit(
      state.copyWith(
        status: CartStatus.COMPLETED,
        totalItemCount: state.totalItemCount + 1,
        order: order,
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
    emit(
      state.copyWith(
        status: CartStatus.LOADING,
      ),
    );
    event.item.setCartQuantity(0);
    OrderPresentation order = state.order;
    order.removeItem(event.item);
    emit(
      state.copyWith(
        status: CartStatus.COMPLETED,
        order: order,
      ),
    );
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
        status: CartStatus.LOADING,
      ),
    );

    OrderPresentation order = state.order;
    order.items
        .where((item) => item.id == event.item.id)
        .first
        .setCartQuantity(event.item.cartQuantity - 1);
    ItemUtils.calculateAndSetItemPriceDetails(
      item: order.items.where((item) => item.id == event.item.id).first,
      goldRate: state.order.goldRate,
    );

    emit(
      state.copyWith(
        status: CartStatus.COMPLETED,
        order: order,
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

  FutureOr<void> _setGoldRate(AddGoldRate event, Emitter<CartState> emit) {
    OrderPresentation order = state.order;
    order.setGoldRate(event.goldRate);
    emit(
      state.copyWith(status: CartStatus.LOADING),
    );
    for (ItemPresentation item in order.items) {
      ItemUtils.calculateAndSetItemPriceDetails(
        item: item,
        goldRate: state.order.goldRate,
      );
    }
    emit(
      state.copyWith(status: CartStatus.COMPLETED, order: order),
    );
  }
}
