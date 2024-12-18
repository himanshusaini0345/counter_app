import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>((event, emit) {
      todoList.add(event.todo);
      emit(state.copyWith(todoList: List.from(todoList)));
    });
    on<RemoveTodoEvent>((event, emit) {
      todoList.remove(event.todo);
      emit(state.copyWith(todoList: List.from(todoList)));
    });
  }
}
