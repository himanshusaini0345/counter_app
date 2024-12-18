import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerState()) {
    on<ImagePickerEvent>((event, emit) {});
  }
}
