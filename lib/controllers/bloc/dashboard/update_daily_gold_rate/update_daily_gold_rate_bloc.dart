import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/daily_gold_rate/update_daily_gold_rate.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/notifier/update_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'update_daily_gold_rate_event.dart';
part 'update_daily_gold_rate_state.dart';

class UpdateDailyGoldRateBloc
    extends Bloc<UpdateDailyGoldRateEvent, UpdateDailyGoldRateState>
    with UpdateDailyGoldRateNotifier {
  final log = getLogger<UpdateDailyGoldRateBloc>();

  final UpdateTodayGoldRateUseCase updateDailyGoldRateUseCase;
  UpdateDailyGoldRateBloc({required this.updateDailyGoldRateUseCase})
      : super(const UpdateDailyGoldRateState()) {
    on<UpdateDailyGoldRate>(_updateDailyGoldRate);
  }

  FutureOr<void> _updateDailyGoldRate(
      UpdateDailyGoldRate event, Emitter<UpdateDailyGoldRateState> emit) async {
    log.logEvent<UpdateDailyGoldRate>();
    event.dailyGoldRate.updateValues();
    DailyGoldRatePresentation dailyGoldRate =
        await updateDailyGoldRateUseCase(dailyGoldRate: event.dailyGoldRate);

    notifySubscriber(
      notification:
          UpdateDailyGoldRateNotification(dailyGoldRate: dailyGoldRate),
    );
  }
}
