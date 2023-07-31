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
      child: Builder(builder: (context) {
        // Builder() 대신 Builder widget 을 이용한 BlocProvider 찾기 context 용.
        return MaterialApp(
          title: 'BLoC Payload',
          theme: (context.watch<ThemeBloc>().state.appTheme ==
                  AppTheme.light) // watch()의 context 는 build의 context 임.
              ? ThemeData.light()
              : ThemeData.dark(),
          home: const MyHomePage(title: 'BLoC Payload'),
        );
      }),
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
<<<<<<< HEAD
            style: TextStyle(fontSize: 24.0, color: Colors.white),
=======
            style: TextStyle(fontSize: 24.0),
>>>>>>> da3f53e3cb30d80f2193a47a433d9d225c051415
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
