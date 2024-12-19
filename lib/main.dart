import 'package:counter_app/bloc/counter/counter_bloc.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:counter_app/bloc/posts/posts_bloc.dart';
import 'package:counter_app/bloc/switch_example/switch_example_bloc.dart';
import 'package:counter_app/bloc/todo/todo_bloc.dart';
import 'package:counter_app/repositories/favourite_repository.dart';
import 'package:counter_app/repositories/posts_repository.dart';
import 'package:counter_app/ui/posts/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchExampleBloc(),
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => FavouriteAppBloc(FavouriteRepository()),
        ),
        BlocProvider(
          create: (_) => PostsBloc(postsRepository: PostsRepository()),
        )
      ],
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme:
            ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
        home: const PostsScreen(),
      ),
    );
  }
}
