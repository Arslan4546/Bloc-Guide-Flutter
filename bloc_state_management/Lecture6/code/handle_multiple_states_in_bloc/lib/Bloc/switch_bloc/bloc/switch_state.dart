part of 'switch_bloc.dart';

@immutable
class SwitchState extends Equatable {
  final bool isSwitch;
  final double isSlider;
  const SwitchState({this.isSwitch = false, this.isSlider = 1.0});

  @override
  List<Object?> get props => [isSwitch, isSlider];

  SwitchState copyWith({bool? isSwitch, double? isSlider}) {
    return SwitchState(
      isSwitch: isSwitch ?? this.isSwitch,
      isSlider: isSlider ?? this.isSlider,
    );
  }
}
