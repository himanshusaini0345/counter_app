import 'package:counter_app/bloc/counter/counter_bloc.dart';
import 'package:counter_app/bloc/counter/counter_event.dart';
import 'package:counter_app/bloc/counter/counter_state.dart';
import 'package:counter_app/ui/posts/posts_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late final CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter Example'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostsScreen(),
                    ),
                  );
                },
                child: Text('Posts')),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 60),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementCounter());
                        },
                        child: Text('increment')),
                  );
                }),
                SizedBox(
                  width: 20,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return Center(
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementCounter());
                        },
                        child: Text('decrement')),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
