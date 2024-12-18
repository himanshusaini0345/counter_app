import 'package:counter_app/bloc/switch_example/switch_example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example two'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notifications'),
                BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitch != current.isSwitch,
                  builder: (context, state) {
                    return Switch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          print('notifications');
                          context
                              .read<SwitchExampleBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  print('slider');
                  return Container(
                    height: 200,
                    color: Colors.red
                        .withAlpha((state.slider * (255 - 1) + 1).toInt()),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                builder: (context, state) {
              return Slider(
                  value: state.slider.toDouble(),
                  onChanged: (value) {
                    print('slider');
                    context
                        .read<SwitchExampleBloc>()
                        .add(SliderEvent(slider: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}
