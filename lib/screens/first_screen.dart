import 'package:example2/bloc/first_screen/first_screen_bloc.dart';
import 'package:example2/bloc/first_screen/first_screen_event.dart';
import 'package:example2/bloc/first_screen/first_screen_state.dart';
// import 'package:example2/bloc/slider/slider_bloc.dart';
// import 'package:example2/bloc/slider/slider_event.dart';
// import 'package:example2/bloc/slider/slider_state.dart';
// import 'package:example2/bloc/switch/switch_bloc.dart';
// import 'package:example2/bloc/switch/switch_event.dart';
// import 'package:example2/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),

                BlocBuilder<FirstScreenBloc, FirstScreenState>(
                  buildWhen: (previousState, currentState) =>
                      previousState.isActive != currentState.isActive,
                  builder: (context, state) {
                    print("switch");
                    return Switch(
                      value: state.isActive,
                      onChanged: (value) {
                        print("switch");
                        context.read<FirstScreenBloc>().add(SwitchEvent());
                      },
                    );
                  },
                )

                // BlocBuilder<SwitchBloc, SwitchState>(
                //   builder: (context, state) => Switch(
                //     value: state.isActive,
                //     onChanged: (value) {
                //       context.read<SwitchBloc>().add(ActivateOrDeactivate());
                //     },
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            BlocBuilder<FirstScreenBloc, FirstScreenState>(
                buildWhen: (previousState, currentState) =>
                    previousState.value != currentState.value,
                builder: (context, state) {
                  print("container");
                  return Container(
                    height: 80,
                    width: 150,
                    color: Colors.red.withOpacity(state.value),
                  );
                }),

            // BlocBuilder<SliderBloc, SliderState>(
            //   builder: (context, state) => Container(
            //     height: 80,
            //     width: 150,
            //     color: Colors.red.withOpacity(state.value),
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),

            BlocBuilder<FirstScreenBloc, FirstScreenState>(
              buildWhen: (previousState, currentState) =>
                  previousState.value != currentState.value,
              builder: (context, state) {
                print("slider:${state.value}");
                return Slider(
                  value: state.value,
                  onChanged: (value) {
                    context
                        .read<FirstScreenBloc>()
                        .add(SliderEvent(value: value));
                  },
                );
              },
            ),

            // BlocBuilder<SliderBloc, SliderState>(
            //   builder: (context, state) => Slider(
            //     value: state.value,
            //     onChanged: (value) {
            //       context
            //           .read<SliderBloc>()
            //           .add(SliderChangeEvent(value: value));
            //     },
            //   ),
            // )

            // showing the values
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.2),
                  ),
                  child: Column(
                    children: [
                      const Text("Switch"),
                      BlocBuilder<FirstScreenBloc, FirstScreenState>(
                        buildWhen: (previous, current) =>
                            previous.isActive != current.isActive,
                        builder: (context, state) {
                          return Text(state.isActive.toString());
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.2),
                  ),
                  child: Column(
                    children: [
                      const Text("Slider"),
                      BlocBuilder<FirstScreenBloc, FirstScreenState>(
                        buildWhen: (previous, current) =>
                            previous.value != current.value,
                        builder: (context, state) {
                          return Text(state.value.toStringAsFixed(3));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
