import 'package:counter_app/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(child: Text('No todos'));
          } else {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(RemoveTodoEvent(todo: state.todoList[index]));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context
                .read<TodoBloc>()
                .add(AddTodoEvent(todo: 'Task: ${i.toString()}'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
