

// import 'package:flutter_application_1/data/models/chracters.dart';

// import '../API/web_services_page.dart';

// class ChractersRepo {

//  final WebServices webServices;

//   ChractersRepo(this.webServices);

// Future<List<Character>> getAllCracters() async {
//   final chracters = await webServices.getAllCracters();
//    print(chracters);
//     return chracters.map((character) => Character.fromJson(character)).toList();
// }
  
// }


import 'package:flutter_application_1/data/API/web_services_page.dart';
import 'package:flutter_application_1/data/models/chracters.dart';

// import '';

class CharactersRepository {
  final WebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCracters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }


}