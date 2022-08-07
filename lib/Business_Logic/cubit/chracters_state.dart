part of 'chracters_cubit.dart';

@immutable
abstract class ChractersState {}

class ChractersInitial extends ChractersState {}

class ChractersIsLoaded extends ChractersState {
 final List<Chracter> chractersList;

  ChractersIsLoaded(this.chractersList);

}

