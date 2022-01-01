part of 'binary_cubit.dart';

class BinaryState extends Equatable {
  final bool value;
  const BinaryState({this.value = false});

  @override
  List<Object?> get props => [value];
}
