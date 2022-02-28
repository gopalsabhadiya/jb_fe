import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/business/update_business.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/business/mediator/notifier/update_notifier.dart';

import '../../../../util/logger.dart';

part 'update_business_event.dart';
part 'update_business_state.dart';

class UpdateBusinessBloc extends Bloc<UpdateBusinessEvent, UpdateBusinessState>
    with UpdateBusinessNotifier {
  final log = getLogger<UpdateBusinessBloc>();

  final UpdateBusinessUseCase updateBusinessUseCase;

  UpdateBusinessBloc({required this.updateBusinessUseCase})
      : super(const UpdateBusinessState()) {
    on<UpdateBusiness>(_onUpdateBusiness);
  }

  FutureOr<void> _onUpdateBusiness(
      UpdateBusiness event, Emitter<UpdateBusinessState> emit) async {
    print("Business to be updated: ${event.business}");
    emit(
      const UpdateBusinessState(
        status: UpdateBusinessStatus.LOADING,
      ),
    );
    try {
      await updateBusinessUseCase(business: event.business);
      emit(
        const UpdateBusinessState(
          status: UpdateBusinessStatus.COMPLETED,
        ),
      );
      notifySubscriber(
        notification: UpdateBusinessNotification(
          business: event.business,
        ),
      );
    } catch (e) {
      emit(
        const UpdateBusinessState(
          status: UpdateBusinessStatus.ERROR,
        ),
      );
      return null;
    }
  }
}
