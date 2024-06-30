import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isActive;
  const SwitchState({this.isActive = false});

  SwitchState copyWith({bool? isActive}) =>
      SwitchState(isActive: isActive ?? this.isActive);

  @override
  List<Object> get props => [isActive];
}
