part of 'receipt_bloc.dart';

enum ReceiptStatus { INITIAL, LOADING, SUCCESS, FAILURE }

class ReceiptState extends Equatable {
  final ReceiptStatus status;
  final List<ReceiptPresentation> receiptList;
  final bool hasReachedMax;
  final bool needToSearch;

  const ReceiptState({
    this.status = ReceiptStatus.INITIAL,
    this.receiptList = const <ReceiptPresentation>[],
    this.hasReachedMax = false,
    this.needToSearch = false,
  });

  ReceiptState copyWith({
    ReceiptStatus? status,
    List<ReceiptPresentation>? receiptList,
    bool? hasReachedMax,
    bool? needToSearch,
  }) {
    return ReceiptState(
        status: status ?? this.status,
        receiptList: receiptList ?? this.receiptList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        needToSearch: needToSearch ?? this.needToSearch);
  }

  @override
  List<Object?> get props => [status, receiptList, hasReachedMax, needToSearch];
}
