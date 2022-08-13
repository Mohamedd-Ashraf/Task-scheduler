// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_application_1/data/Repo/chracter_repo.dart';
import 'package:flutter_application_1/data/models/chracters.dart';

part 'chracters_state.dart';

class ChractersCubit extends Cubit<ChractersState> {
  final CharactersRepository CharRepo;
   List <Character> characters =[];
  ChractersCubit(
    this.CharRepo,
  ) : super(ChractersInitial());
  List<Character> getAllCharacters() {
    CharRepo.getAllCharacters().then((characters) {
    
       emit(ChractersIsLoaded(characters));
       this.characters = characters;
    });

    return characters ;
   
  }
}
