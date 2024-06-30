import 'package:equatable/equatable.dart';

sealed class SliderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SliderChangeEvent extends SliderEvent {
  final double value;
  SliderChangeEvent({required this.value});

  @override 
  List<Object> get props => [value];
}
