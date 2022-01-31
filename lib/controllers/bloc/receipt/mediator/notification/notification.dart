import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/dto/payment/details/receipt_details_presentation.dart';

enum ReceiptNotificationType {
  RECEIPT_DELETED,
  RECEIPT_CREATED,
  RECEIPT_ADD_REQUEST,
  RECEIPT_SEARCH_COMPLETE,
  RECEIPT_SEARCH_CLEARED,
  RECEIPT_GET_NEXT_PAGE
}

class ReceiptOperationNotification extends Equatable {
  final ReceiptNotificationType notificationType;
  const ReceiptOperationNotification({required this.notificationType});

  @override
  List<Object?> get props => [notificationType];
}

class DeleteReceiptNotification extends ReceiptOperationNotification {
  final String receiptId;

  const DeleteReceiptNotification({
    required this.receiptId,
  }) : super(notificationType: ReceiptNotificationType.RECEIPT_DELETED);

  @override
  List<Object> get props => [receiptId, notificationType];
}

class NewReceiptNotification extends ReceiptOperationNotification {
  final ReceiptDetailsPresentation receipt;

  const NewReceiptNotification({
    required this.receipt,
  }) : super(notificationType: ReceiptNotificationType.RECEIPT_CREATED);

  @override
  List<Object> get props => [receipt, notificationType];
}

class SearchReceiptCompleteNotification extends ReceiptOperationNotification {
  final List<ReceiptDetailsPresentation> result;
  final String searchTerm;
  const SearchReceiptCompleteNotification(
      {required this.result, required this.searchTerm})
      : super(
            notificationType: ReceiptNotificationType.RECEIPT_SEARCH_COMPLETE);

  @override
  List<Object> get props => [result, notificationType];
}

class SearchReceiptTermClearedNotification
    extends ReceiptOperationNotification {
  const SearchReceiptTermClearedNotification()
      : super(notificationType: ReceiptNotificationType.RECEIPT_SEARCH_CLEARED);
}

class SearchNextReceiptPageRequestNotification
    extends ReceiptOperationNotification {
  const SearchNextReceiptPageRequestNotification()
      : super(notificationType: ReceiptNotificationType.RECEIPT_GET_NEXT_PAGE);
}

class AddReceiptRequestNotification extends ReceiptOperationNotification {
  const AddReceiptRequestNotification()
      : super(notificationType: ReceiptNotificationType.RECEIPT_ADD_REQUEST);
}
