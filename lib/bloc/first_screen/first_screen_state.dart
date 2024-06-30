import 'package:equatable/equatable.dart';

class FirstScreenState extends Equatable {
  final double value;
  final bool isActive;
  const FirstScreenState({this.isActive = false, this.value = 0});

  FirstScreenState copyWith({bool? isActive, double? value}) =>
      FirstScreenState(
        isActive: isActive ?? this.isActive,
        value: value ?? this.value,
      );

  @override
  List<Object> get props => [value,isActive];
}
