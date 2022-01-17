import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/daily_gold_rate/get_today_gold_rate.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/subscriber/operation_subscriber.dart';
import 'package:uuid/uuid.dart';

part 'daily_gold_rate_event.dart';
part 'daily_gold_rate_state.dart';

class _AddDailyGoldRate extends DailyGoldRateEvent {
  final DailyGoldRatePresentation dailyGoldRate;
  const _AddDailyGoldRate({required this.dailyGoldRate}) : super();

  @override
  List<Object?> get props => [dailyGoldRate];
}

class _UpdateDailyGoldRate extends DailyGoldRateEvent {
  final DailyGoldRatePresentation dailyGoldRate;
  const _UpdateDailyGoldRate({required this.dailyGoldRate}) : super();

  @override
  List<Object?> get props => [dailyGoldRate];
}

class DailyGoldRateBloc extends Bloc<DailyGoldRateEvent, DailyGoldRateState>
    with DailyGoldRateOperationSubscriber {
  final String _id = const Uuid().v4();
  final GetTodayGoldRateUseCase getTodayGoldRateUseCase;
  DailyGoldRateBloc({required this.getTodayGoldRateUseCase})
      : super(const DailyGoldRateState()) {
    on<GetTodayGoldRate>(_getTodayGoldRate);
    on<_AddDailyGoldRate>(_addDailyGoldRate);
    on<_UpdateDailyGoldRate>(_updateDailyGoldRate);
  }

  FutureOr<void> _getTodayGoldRate(
      GetTodayGoldRate event, Emitter<DailyGoldRateState> emit) async {
    print("Trying to read daily gold rate");
    emit(
      state.copyWith(
        status: DailyGoldRateStatus.LOADING,
      ),
    );

    try {
      final DailyGoldRatePresentation todayGoldRate =
          await getTodayGoldRateUseCase();

      emit(
        state.copyWith(
          status: DailyGoldRateStatus.COMPLETED,
          todayGoldRate: todayGoldRate,
          todayGoldRateAvailable: true,
        ),
      );
    } catch (e) {
      print("Error $e");
      emit(
        state.copyWith(status: DailyGoldRateStatus.ERROR),
      );
    }
  }

  FutureOr<void> _addDailyGoldRate(
      _AddDailyGoldRate event, Emitter<DailyGoldRateState> emit) {
    emit(
      state.copyWith(
          todayGoldRate: event.dailyGoldRate, todayGoldRateAvailable: true),
    );
  }

  FutureOr<void> _updateDailyGoldRate(
      _UpdateDailyGoldRate event, Emitter<DailyGoldRateState> emit) {
    emit(
      state.copyWith(
        todayGoldRate: event.dailyGoldRate,
        todayGoldRateAvailable: true,
      ),
    );
  }

  @override
  void update({required DailyGoldRateOperationNotification notification}) {
    switch (notification.notificationType) {
      case DailyGoldRateNotificationType.DAILY_GOLD_RATE_UPDATED:
        add(
          _UpdateDailyGoldRate(
            dailyGoldRate:
                (notification as UpdateDailyGoldRateNotification).dailyGoldRate,
          ),
        );
        break;
      case DailyGoldRateNotificationType.DAILY_GOLD_RATE_CREATED:
        add(
          _AddDailyGoldRate(
            dailyGoldRate:
                (notification as NewDailyGoldRateNotification).dailyGoldRate,
          ),
        );
        break;
    }
  }

  @override
  String get id => _id;
}
