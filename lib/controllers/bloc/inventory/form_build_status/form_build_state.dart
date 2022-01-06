part of 'form_build_cubit.dart';

class FormBuildState extends Equatable {
  final bool isBuildComplete;
  const FormBuildState({this.isBuildComplete = false});

  @override
  List<Object?> get props => [isBuildComplete];
}
