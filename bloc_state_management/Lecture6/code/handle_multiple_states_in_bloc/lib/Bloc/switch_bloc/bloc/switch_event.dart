part of 'switch_bloc.dart';

abstract class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotificationEvent extends SwitchEvent {
  const EnableOrDisableNotificationEvent();
}

class SliderEvent extends SwitchEvent {
  final double slider;
  const SliderEvent({required this.slider});
}
