import 'package:bloc/bloc.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

enum AuthenticatedSidePanelState {
  DASHBOARD,
  PARTY,
  INVENTORY,
  ORDERS,
  PAYMENTS,
  SHOP_EXPENSES
}

class AuthenticatedSidePanelCubit extends Cubit<AuthenticatedSidePanelState> {
  final log = getLogger<AuthenticatedSidePanelCubit>();

  AuthenticatedSidePanelCubit(AuthenticatedSidePanelState initialState)
      : super(initialState);

  void navigateTo(String link) {
    log.logEventForCubit(eventName: "navigateTo: $link");

    emit(
      AuthenticatedSidePanelState.values.firstWhere(
        (e) => e.toString().toLowerCase().contains(
              link.toLowerCase(),
            ),
      ),
    );
  }
}
