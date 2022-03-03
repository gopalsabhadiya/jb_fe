import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/entities/stats/business/business_stats.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../backend_integration/domain/usecase/business/get_business_stats.dart';
import '../../../../util/logger.dart';

part 'business_stats_event.dart';
part 'business_stats_state.dart';

class BusinessStatsBloc extends Bloc<BusinessStatsEvent, BusinessStatsState> {
  final log = getLogger<BusinessStatsBloc>();
  final GetBusinessStatsUseCase getBusinessStatsUseCase;

  BusinessStatsBloc({required this.getBusinessStatsUseCase})
      : super(const BusinessStatsState()) {
    on<GetBusinessStats>(_getBusinessStats);
  }

  FutureOr<void> _getBusinessStats(
      GetBusinessStats event, Emitter<BusinessStatsState> emit) async {
    log.logEvent<GetBusinessStats>();
    print("hello");

    emit(
      state.copyWith(
        status: BusinessStatsStatus.LOADING,
      ),
    );
    try {
      final BusinessStatsEntity businessStatsEntity =
          await getBusinessStatsUseCase();

      emit(
        state.copyWith(
          status: BusinessStatsStatus.COMPLETED,
          businessStatsEntity: businessStatsEntity,
        ),
      );
    } catch (e) {
      print("Error $e");
      emit(
        state.copyWith(status: BusinessStatsStatus.ERROR),
      );
    }
  }
}
