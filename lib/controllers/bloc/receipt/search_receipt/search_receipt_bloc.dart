import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/payment/search_receipt.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/notifier/search_notifier.dart';
import 'package:jb_fe/controllers/bloc/receipt/mediator/subscriber/operation_subscriber.dart';
import 'package:jb_fe/util/extension/common_logging.dart';
import 'package:uuid/uuid.dart';

import '../../../../util/logger.dart';

part 'search_receipt_event.dart';
part 'search_receipt_state.dart';

class SearchReceiptBloc extends Bloc<SearchReceiptEvent, SearchReceiptState>
    with SearchReceiptNotifier, ReceiptOperationSubscriber {
  final log = getLogger<SearchReceiptBloc>();

  final String _id = const Uuid().v4();

  final SearchReceiptUseCase searchReceiptUseCase;

  SearchReceiptBloc({required this.searchReceiptUseCase})
      : super(const SearchReceiptState()) {
    on<SearchReceipt>(_onSearchReceipt);
    on<ClearSearchReceiptTerm>(_onClearSearchTerm);
  }

  FutureOr<void> _onSearchReceipt(
      SearchReceipt event, Emitter<SearchReceiptState> emit) async {
    log.logEvent<SearchReceipt>();

    emit(
      state.copyWith(
        searchStatus: SearchReceiptStatus.LOADING,
      ),
    );
    try {
      final searchResult = await searchReceiptUseCase(
        searchTerm: event.searchTerm,
      );
      emit(
        state.copyWith(
          searchStatus: SearchReceiptStatus.COMPLETED,
          searchTerm: event.searchTerm,
          result: List.of(state.result)..addAll(searchResult),
        ),
      );
      notifySubscriber(
        notification: SearchReceiptCompleteNotification(
          result: state.result,
          searchTerm: state.searchTerm,
        ),
      );
    } catch (e) {
      print("Error: $e");
      emit(
        state.copyWith(
          searchStatus: SearchReceiptStatus.ERROR,
        ),
      );
      return null;
    }
  }

  FutureOr<void> _onClearSearchTerm(
      ClearSearchReceiptTerm event, Emitter<SearchReceiptState> emit) {
    log.logEvent<ClearSearchReceiptTerm>();

    emit(
      state.copyWith(
        result: <ReceiptDetailsPresentation>[],
        searchTerm: DefaultTexts.EMPTY,
        searchStatus: SearchReceiptStatus.COMPLETED,
      ),
    );
    notifySubscriber(
      notification: const SearchReceiptTermClearedNotification(),
    );
    return null;
  }

  @override
  void update({required ReceiptOperationNotification notification}) async {
    final searchResult = await searchReceiptUseCase(
      searchTerm: state.searchTerm,
      skip: state.result.length,
    );
    notifySubscriber(
      notification: SearchReceiptCompleteNotification(
        result: List.of(state.result)..addAll(searchResult),
        searchTerm: state.searchTerm,
      ),
    );
  }

  @override
  String get id => _id;
}
