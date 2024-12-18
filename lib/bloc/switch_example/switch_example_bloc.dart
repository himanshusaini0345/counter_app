import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_example_event.dart';
part 'switch_example_state.dart';

class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc() : super(SwitchExampleState()) {
    on<EnableOrDisableNotification>((event, emit) {
      emit(state.copyWith(isSwitch: !state.isSwitch));
    });
    on<SliderEvent>((event, emit) {
      emit(state.copyWith(slider: event.slider));
    });
  }
}
