part of 'switch_example_bloc.dart';

class SwitchExampleState extends Equatable {
  final bool isSwitch;
  final double slider;
  const SwitchExampleState({this.slider = 0.8, this.isSwitch = false});

  SwitchExampleState copyWith({bool? isSwitch, double? slider}) {
    return SwitchExampleState(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isSwitch, slider];
}
