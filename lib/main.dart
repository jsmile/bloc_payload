import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/theme/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'BLoC Payload',
            theme: (state.appTheme ==
                    AppTheme.light) // watch()의 context 는 build의 context 임.
                ? ThemeData.light()
                : ThemeData.dark(),
            home: const MyHomePage(title: 'BLoC Payload'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Change Theme',
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          onPressed: () {
            final randInt = Random().nextInt(10);
            print('*** randInt : $randInt.');
            // event 에 parameter 로 payload 를 전달.
            context.read<ThemeBloc>().add(ThemeChangedEvent(randInt: randInt));
          },
        ),
      ),
    );
  }
}
