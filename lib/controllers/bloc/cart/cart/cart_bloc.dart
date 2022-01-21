import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/create_order.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notifier/add_to_cart_notifier.dart';
import 'package:jb_fe/util/item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with AddItemToCartNotifier {
  final CreateOrderUseCase _createOrderUseCase;
  CartBloc({required CreateOrderUseCase createOrderUseCase})
      : _createOrderUseCase = createOrderUseCase,
        super(
          CartState(order: OrderPresentation.empty()),
        ) {
    on<AddGoldRate>(_setGoldRate);
    on<UpdateScrapAndKasar>(_updateOrder);
    on<AddItemToCart>(_addItemToCart);
    on<RemoveItemFromCart>(_removeItemFromCart);
    on<DecreaseItemQuantityInCart>(_decreaseItemQuantityInCart);
    on<AddPartyToCart>(_addPartyToCart);
    on<SaveOrder>(_saveOrder);
  }

  FutureOr<void> _addItemToCart(AddItemToCart event, Emitter<CartState> emit) {
    emit(state.copyWith(
      status: CartStatus.LOADING,
    ));
    ItemPresentation eventItem = event.item;
    eventItem.setCartQuantity(event.item.cartQuantity + 1);
    OrderPresentation order = state.order;
    if (order.items.where((item) => item.id == event.item.id).isEmpty) {
      order.addItem(event.item);
    } else {
      order.items
          .where((item) => item.id == event.item.id)
          .first
          .setCartQuantity(event.item.cartQuantity);
    }
    ItemUtils.calculateAndSetItemPriceDetails(
        item: eventItem, goldRate: state.order.goldRate!);
    ItemUtils.calculateAndSetOrderPriceDetails(order: state.order);

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
    ItemUtils.calculateAndSetOrderPriceDetails(order: order);

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
      goldRate: state.order.goldRate!,
    );
    ItemUtils.calculateAndSetOrderPriceDetails(order: order);

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
    OrderPresentation order = state.order;
    order.setParty(event.party.id!);
    emit(
      state.copyWith(party: event.party, order: order),
    );
  }

  FutureOr<void> _setGoldRate(AddGoldRate event, Emitter<CartState> emit) {
    OrderPresentation order = state.order;
    order.setGoldRate(event.goldRate.toString());
    emit(
      state.copyWith(status: CartStatus.LOADING),
    );

    for (ItemPresentation item in order.items) {
      ItemUtils.calculateAndSetItemPriceDetails(
        item: item,
        goldRate: state.order.goldRate!,
      );
    }
    ItemUtils.calculateAndSetOrderPriceDetails(order: state.order);

    emit(
      state.copyWith(status: CartStatus.COMPLETED, order: order),
    );
  }

  FutureOr<void> _updateOrder(
      UpdateScrapAndKasar event, Emitter<CartState> emit) {
    emit(state.copyWith(status: CartStatus.LOADING));
    ItemUtils.calculateAndSetOrderPriceDetails(order: state.order);
    emit(state.copyWith(status: CartStatus.COMPLETED));
  }

  FutureOr<void> _saveOrder(SaveOrder event, Emitter<CartState> emit) async {
    emit(
      state.copyWith(
        status: CartStatus.LOADING,
      ),
    );
    OrderPresentation orderPresentation =
        await _createOrderUseCase(order: state.order);
    emit(
      state.copyWith(
        status: CartStatus.COMPLETED,
        order: orderPresentation,
      ),
    );
  }
}
