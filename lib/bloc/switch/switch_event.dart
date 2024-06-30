import 'package:equatable/equatable.dart';

sealed class SwitchEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class ActivateOrDeactivate extends SwitchEvent{}

