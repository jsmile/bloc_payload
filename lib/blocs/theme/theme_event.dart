part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeChangedEvent extends ThemeEvent {
  final int randInt;

  const ThemeChangedEvent(
      {required this.randInt}); // rndInt 에 따라서 theme 가 변경되도록 event 를 사용하여 전달

  @override
  List<Object> get props => [randInt];

  @override
  String toString() => 'ThemeChangedEvent(randInt: $randInt)';
}
