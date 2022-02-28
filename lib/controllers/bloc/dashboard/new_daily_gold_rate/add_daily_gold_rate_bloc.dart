import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/daily_gold_rate/create_daily_gold_rate.dart';
import 'package:jb_fe/backend_integration/dto/daily_gold_rate/daily_gold_rate_presentation.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/notification/notification.dart';
import 'package:jb_fe/controllers/bloc/dashboard/mediator/notifier/add_notifier.dart';
import 'package:jb_fe/util/extension/common_logging.dart';

import '../../../../util/logger.dart';

part 'add_daily_gold_rate_event.dart';
part 'add_daily_gold_rate_state.dart';

class AddDailyGoldRateBloc
    extends Bloc<AddDailyGoldRateEvent, AddDailyGoldRateState>
    with AddDailyGoldRateNotifier {
  final log = getLogger<AddDailyGoldRateBloc>();

  final CreateDailyGoldRateUseCase createDailyGoldRateUseCase;
  AddDailyGoldRateBloc({required this.createDailyGoldRateUseCase})
      : super(const AddDailyGoldRateState()) {
    on<AddDailyGoldRate>(_addDailyGoldRate);
  }

  FutureOr<void> _addDailyGoldRate(
      AddDailyGoldRate event, Emitter<AddDailyGoldRateState> emit) async {
    log.logEvent<AddDailyGoldRate>();

    DailyGoldRatePresentation dailyGoldRate =
        await createDailyGoldRateUseCase(dailyGoldRate: event.dailyGoldRate);

    notifySubscriber(
      notification: NewDailyGoldRateNotification(dailyGoldRate: dailyGoldRate),
    );
  }
}
