import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jb_fe/backend_integration/domain/usecase/business/get_business_data.dart';
import 'package:jb_fe/backend_integration/dto/business/business_presentation.dart';

part 'business_data_event.dart';
part 'business_data_state.dart';

class BusinessDataBloc extends Bloc<BusinessDataEvent, BusinessDataState> {
  final GetBusinessDataUseCase getBusinessDataUseCase;

  BusinessDataBloc({required this.getBusinessDataUseCase})
      : super(const BusinessDataState()) {
    on<FetchBusinessData>(_onFetchBusinessData);
  }

  FutureOr<void> _onFetchBusinessData(
      FetchBusinessData event, Emitter<BusinessDataState> emit) async {
    final BusinessPresentation businessData = await getBusinessDataUseCase();
    emit(
      state.copyWith(
        status: BusinessDataStatus.COMPLETED,
        business: businessData,
      ),
    );
  }
}
