import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/models.dart';

part 'pizza_event.dart';
part 'pizza_state.dart';

class PizzaBloc extends Bloc<PizzaEvent, PizzaState> {
  PizzaBloc() : super(PizzaInitial()) {
   on<loadPizzaCounter>((event, emit) async {
     await Future<void>.delayed(const Duration(seconds: 1 ));
     emit(const Pizzaloaded(piza: <pizza>[]));

   });
   on<addPizza>((event, emit) {
     if(state is Pizzaloaded){
      final state = this.state as Pizzaloaded;

      emit(Pizzaloaded(piza:List.from(state.piza)..add(event.pizaa) ));


     }
   });
   on<removePizza>((event, emit) {

    if(state is Pizzaloaded){
      final state = this.state as Pizzaloaded;

      emit(Pizzaloaded(piza:List.from(state.piza)..remove(event.pizaa) ));


     }
   });
    
   }
  }

