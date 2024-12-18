part of 'switch_example_bloc.dart';

abstract class SwitchExampleEvent extends Equatable {
  const SwitchExampleEvent();
  @override
  List<Object?> get props => [];
}

class EnableOrDisableNotification extends SwitchExampleEvent {}

class SliderEvent extends SwitchExampleEvent {
  final double slider;
  const SliderEvent({required this.slider});

  @override
  List<Object?> get props => [slider];
}
