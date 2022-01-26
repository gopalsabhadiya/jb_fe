import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/order/create_order.dart';
import 'package:jb_fe/backend_integration/dto/item/item_presentation.dart';
import 'package:jb_fe/backend_integration/dto/order/order_presentation.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/controllers/bloc/inventory/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/order/mediator/notifier/add_notifier.dart';
import 'package:jb_fe/util/item.dart';
import 'package:url_launcher/url_launcher.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState>
    with AddOrderNotifier {
  final CreateOrderUseCase createOrderUseCase;

  AddOrderBloc({required this.createOrderUseCase})
      : super(
          AddOrderState(
            order: OrderPresentation.empty(),
          ),
        ) {
    on<AddGoldRate>(_setGoldRate);
    on<UpdateScrapAndKasar>(_updateOrder);
    on<AddItemToOrder>(_addItemToOrder);
    on<RemoveItemFromOrder>(_removeItemFromOrder);
    on<DecreaseItemQuantityInOrder>(_decreaseItemQuantityInOrder);
    on<AddPartyToOrder>(_addPartyToOrder);
    on<SaveOrder>(_saveOrder);
  }

  FutureOr<void> _addItemToOrder(
      AddItemToOrder event, Emitter<AddOrderState> emit) {
    emit(state.copyWith(
      status: AddOrderStatus.LOADING,
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
        status: AddOrderStatus.BUILDING,
        totalItemCount: state.totalItemCount + 1,
        order: order,
      ),
    );
    notifySubscriberForItemOperation(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _removeItemFromOrder(
      RemoveItemFromOrder event, Emitter<AddOrderState> emit) {
    emit(
      state.copyWith(
        status: AddOrderStatus.LOADING,
      ),
    );

    event.item.setCartQuantity(0);
    OrderPresentation order = state.order;
    order.removeItem(event.item);
    ItemUtils.calculateAndSetOrderPriceDetails(order: order);

    emit(
      state.copyWith(
        status: AddOrderStatus.BUILDING,
        order: order,
      ),
    );
    notifySubscriberForItemOperation(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _decreaseItemQuantityInOrder(
      DecreaseItemQuantityInOrder event, Emitter<AddOrderState> emit) {
    emit(
      state.copyWith(
        status: AddOrderStatus.LOADING,
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
        status: AddOrderStatus.BUILDING,
        order: order,
      ),
    );
    notifySubscriberForItemOperation(
      notification: UpdateItemFromCartNotification(
        item: event.item,
      ),
    );
  }

  FutureOr<void> _addPartyToOrder(
      AddPartyToOrder event, Emitter<AddOrderState> emit) {
    OrderPresentation order = state.order;
    order.setParty(event.party.id!);
    print("Setting party: ${event.party}");
    emit(
      state.copyWith(
        party: event.party,
        order: order,
      ),
    );
  }

  FutureOr<void> _setGoldRate(AddGoldRate event, Emitter<AddOrderState> emit) {
    OrderPresentation order = state.order;
    order.setGoldRate(event.goldRate.toString());
    emit(
      state.copyWith(status: AddOrderStatus.LOADING),
    );

    for (ItemPresentation item in order.items) {
      ItemUtils.calculateAndSetItemPriceDetails(
        item: item,
        goldRate: state.order.goldRate!,
      );
    }
    ItemUtils.calculateAndSetOrderPriceDetails(order: state.order);

    emit(
      state.copyWith(status: AddOrderStatus.BUILDING, order: order),
    );
  }

  FutureOr<void> _updateOrder(
      UpdateScrapAndKasar event, Emitter<AddOrderState> emit) {
    emit(state.copyWith(status: AddOrderStatus.LOADING));
    ItemUtils.calculateAndSetOrderPriceDetails(order: state.order);
    emit(state.copyWith(status: AddOrderStatus.BUILDING));
  }

  FutureOr<void> _saveOrder(
      SaveOrder event, Emitter<AddOrderState> emit) async {
    emit(
      state.copyWith(
        status: AddOrderStatus.LOADING,
      ),
    );
    OrderPresentation orderPresentation =
        await createOrderUseCase(order: state.order);
    print('Order placed: ${state.party}');
    await Future.delayed(const Duration(seconds: 2));

    notifySubscriber(
      notification: NewOrderNotification(
        order:
            orderPresentation.getOrderDetailsPresentation(party: state.party!),
      ),
    );
    notifySubscriberForItemOperation(
      notification: UpdateItemFromPlacedOrderNotification(
        order: orderPresentation,
      ),
    );
    launch("http://localhost:8080/api/bill/${orderPresentation.id}");
    // FutureOr<Uint8List> pdf =
    //     await Printing.convertHtml(html: state.order.toString());
    // Printing.sharePdf(
    //     bytes: Uint8List.fromList(state.order.toString().codeUnits));
    // await Future.delayed(const Duration(seconds: 2));
    // await Printing.layoutPdf(
    //     onLayout: Uint8List.fromList(state.order.toString()));
    // print("PDF: $pdf");
    OrderPresentation newOrder = OrderPresentation.empty();
    newOrder.setGoldRate(state.order.goldRate.toString());
    emit(
      state.copyWith(
        status: AddOrderStatus.COMPLETED,
        order: newOrder,
        party: null,
        totalItemCount: 0,
      ),
    );
  }
}
