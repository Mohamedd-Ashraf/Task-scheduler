part of 'pizza_bloc.dart';

abstract class PizzaState extends Equatable {
  const PizzaState();
  
  @override
  List<Object> get props => [];
}

class PizzaInitial extends PizzaState {}

class Pizzaloaded extends PizzaState {

  final List<pizza> piza;

  const Pizzaloaded({required this.piza});

  @override
  List<Object> get props =>[piza];



}

// class addPizza extends PizzaState {

//   final List<pizza> piza;

//   const addPizza({required this.piza});

//   @override
//   List<Object> get props =>[piza];



// }

