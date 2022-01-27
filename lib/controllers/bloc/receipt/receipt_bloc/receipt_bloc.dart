import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/get_receipt_page.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';
import 'package:jb_fe/backend_integration/dto/payment/receipt_presentation.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/next_page_notifier.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class _DeleteReceipt extends ReceiptEvent {
  final String receiptId;

  const _DeleteReceipt({required this.receiptId});
}

class _AddReceipt extends ReceiptEvent {
  final ReceiptPresentation addedReceipt;
  const _AddReceipt({required this.addedReceipt});
}

class _DisplaySearchReceiptResult extends ReceiptEvent {
  final List<ReceiptDetailsPresentation> result;
  const _DisplaySearchReceiptResult({required this.result});
}

class _ClearSearchTerm extends ReceiptEvent {}

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState>
    with ReceiptOperationSubscriber, SearchNextReceiptPageNotifier {
  final String _id = const Uuid().v4();

  final GetReceiptPageUseCase getReceiptPageUseCase;

  ReceiptBloc({required this.getReceiptPageUseCase})
      : super(const ReceiptState()) {
    on<FetchReceiptFirstPage>(_onFetchReceiptFirstPage);
    on<FetchNextReceiptPage>(_fetchNextReceiptPage);
    on<_DisplaySearchReceiptResult>(_displaySearchResult);
    on<_ClearSearchTerm>(_clearSearchTerm);
    on<_DeleteReceipt>(_removeReceiptFromList);
    on<_AddReceipt>(_addReceipt);
  }

  FutureOr<void> _onFetchReceiptFirstPage(
      FetchReceiptFirstPage event, Emitter<ReceiptState> emit) async {
    emit(
      state.copyWith(
        status: ReceiptStatus.LOADING,
      ),
    );
    try {
      final receiptList = await getReceiptPageUseCase();
      emit(
        state.copyWith(
          status: ReceiptStatus.SUCCESS,
          receiptList: receiptList,
          hasReachedMax: receiptList.length < 20,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ReceiptStatus.FAILURE,
        ),
      );
    }
  }

  FutureOr<void> _fetchNextReceiptPage(
      FetchNextReceiptPage event, Emitter<ReceiptState> emit) async {
    if (state.hasReachedMax == true) {
      return null;
    }
    if (state.needToSearch) {
      notifySubscriber(
        notification: const SearchNextReceiptPageRequestNotification(),
      );
      return null;
    }

    final receiptList =
        await getReceiptPageUseCase(skip: state.receiptList.length);
    emit(
      state.copyWith(
        hasReachedMax: receiptList.length < 20,
        receiptList: List.of(state.receiptList)..addAll(receiptList),
        status: ReceiptStatus.SUCCESS,
      ),
    );
    return null;
  }

  FutureOr<void> _displaySearchResult(
      _DisplaySearchReceiptResult event, Emitter<ReceiptState> emit) {
    emit(
      state.copyWith(
        status: ReceiptStatus.LOADING,
      ),
    );
    emit(
      state.copyWith(
        receiptList: event.result,
        status: ReceiptStatus.SUCCESS,
        hasReachedMax: event.result.length < 20,
        needToSearch: true,
      ),
    );
  }

  FutureOr<void> _clearSearchTerm(
      _ClearSearchTerm event, Emitter<ReceiptState> emit) {
    emit(
      state.copyWith(
        status: ReceiptStatus.LOADING,
        receiptList: <ReceiptDetailsPresentation>[],
        needToSearch: false,
      ),
    );
    add(FetchReceiptFirstPage());
  }

  FutureOr<void> _removeReceiptFromList(
      _DeleteReceipt event, Emitter<ReceiptState> emit) {
    final newList = <ReceiptDetailsPresentation>[];
    for (var receipt in state.receiptList) {
      if (receipt.id != event.receiptId) {
        newList.add(receipt);
      }
    }
    emit(
      state.copyWith(
        status: ReceiptStatus.SUCCESS,
        receiptList: newList,
      ),
    );
  }

  FutureOr<void> _addReceipt(_AddReceipt event, Emitter<ReceiptState> emit) {
    emit(
      state.copyWith(
        status: ReceiptStatus.SUCCESS,
        receiptList: List.from([event.addedReceipt])..addAll(state.receiptList),
      ),
    );
  }

  @override
  void update({required ReceiptOperationNotification notification}) {
    switch (notification.notificationType) {
      case ReceiptNotificationType.RECEIPT_DELETED:
        add(
          _DeleteReceipt(
            receiptId: (notification as DeleteReceiptNotification).receiptId,
          ),
        );
        break;
      case ReceiptNotificationType.RECEIPT_SEARCH_COMPLETE:
        add(
          _DisplaySearchReceiptResult(
            result: (notification as SearchReceiptCompleteNotification).result,
          ),
        );
        break;
      case ReceiptNotificationType.RECEIPT_SEARCH_CLEARED:
        add(_ClearSearchTerm());
        break;
      case ReceiptNotificationType.RECEIPT_CREATED:
        add(
          _AddReceipt(
            addedReceipt: (notification as NewReceiptNotification).receipt,
          ),
        );
        break;
    }
  }

  @override
  String get id => _id;
}
