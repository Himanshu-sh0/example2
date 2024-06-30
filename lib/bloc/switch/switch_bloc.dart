import 'package:bloc/bloc.dart';
import 'package:example2/bloc/switch/switch_event.dart';
import 'package:example2/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchState()) {
    on<ActivateOrDeactivate>(_activateOrDeactivate);
  }

  void _activateOrDeactivate(
      ActivateOrDeactivate event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isActive: !state.isActive));
  }
}
