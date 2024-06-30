import 'package:equatable/equatable.dart';

sealed class FirstScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SwitchEvent extends FirstScreenEvent {}

class SliderEvent extends FirstScreenEvent {
  final double value;
  SliderEvent({required this.value});

  @override
  List<Object> get props => [value];
}
