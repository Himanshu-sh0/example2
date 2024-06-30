import 'package:example2/bloc/slider/slider_event.dart';
import 'package:example2/bloc/slider/slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()) {
    on<SliderChangeEvent>(_sliderChange);
  }
  void _sliderChange(SliderChangeEvent event, Emitter<SliderState> emit) {
    emit(state.copyWith(value: event.value));
  }
}
