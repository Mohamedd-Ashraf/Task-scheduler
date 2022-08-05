part of 'pizza_bloc.dart';

abstract class PizzaEvent extends Equatable {
  const PizzaEvent();

  @override
  List<Object> get props => [];
}
  class loadPizzaCounter extends PizzaEvent {
    


  }
  class addPizza extends PizzaEvent {

    final pizza pizaa;

    const addPizza(this.pizaa);

    
  @override
  List<Object> get props => [];



  }

  class removePizza extends PizzaEvent {

    final pizza pizaa;

    const removePizza(this.pizaa);

    
  @override
  List<Object> get props => [];



  }
  
