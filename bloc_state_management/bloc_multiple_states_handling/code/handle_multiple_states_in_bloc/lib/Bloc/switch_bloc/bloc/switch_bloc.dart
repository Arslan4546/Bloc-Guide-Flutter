import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotificationEvent>(_enableOrDisableNotification);
    on<SliderEvent>(_sliderEvent);
  }

  void _enableOrDisableNotification(
    EnableOrDisableNotificationEvent event,
    Emitter<SwitchState> emit,
  ) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderEvent(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSlider: event.slider));
  }
}
