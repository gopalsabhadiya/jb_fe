import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_build_state.dart';

class FormBuildCubit extends Cubit<FormBuildState> {
  FormBuildCubit() : super(const FormBuildState());
  void buildStarted() => emit(
    const FormBuildState(
      isBuildComplete: false,
    ),
  );
  void buildFinished() => emit(
    const FormBuildState(
      isBuildComplete: false,
    ),
  );
}
