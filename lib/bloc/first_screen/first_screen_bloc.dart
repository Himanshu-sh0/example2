import 'package:bloc/bloc.dart';
import 'package:example2/bloc/first_screen/first_screen_event.dart';
import 'package:example2/bloc/first_screen/first_screen_state.dart';

class FirstScreenBloc extends Bloc<FirstScreenEvent, FirstScreenState> {
  FirstScreenBloc() : super(const FirstScreenState()) {
    on<SliderEvent>(_sliderEvent);
    on<SwitchEvent>(_switchEvent);
  }

  void _switchEvent(SwitchEvent event, Emitter<FirstScreenState> emit) {
    emit(state.copyWith(isActive: !state.isActive));
  }

  void _sliderEvent(SliderEvent event, Emitter<FirstScreenState> emit) {
    emit(state.copyWith(value: event.value));
  }
}
