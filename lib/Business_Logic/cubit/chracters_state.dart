part of 'chracters_cubit.dart';

@immutable
abstract class ChractersState {}

class ChractersInitial extends ChractersState {}

class ChractersIsLoaded extends ChractersState {
 final List<Character> chractersList;

  ChractersIsLoaded(this.chractersList);

}


