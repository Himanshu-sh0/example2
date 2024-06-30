import 'package:example2/bloc/first_screen/first_screen_bloc.dart';
import 'package:example2/bloc/slider/slider_bloc.dart';
import 'package:example2/bloc/switch/switch_bloc.dart';
import 'package:example2/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // using multi-bloc-provider to access multiple blocs
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => SliderBloc()),
        BlocProvider(create: (_) => FirstScreenBloc())
      ],
      // BlocProvider(
      //   create: (_) => SwitchBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
