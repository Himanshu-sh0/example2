import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double value;
  const SliderState({this.value = 0});

  SliderState copyWith({double? value}) =>
      SliderState(value: value ?? this.value);
  @override
  List<Object> get props => [value];
}
