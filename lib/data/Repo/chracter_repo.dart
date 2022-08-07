

import 'package:flutter_application_1/data/models/chracters.dart';

import '../API/web_services_page.dart';

class ChractersRepo {

 final WebServices webServices;

  ChractersRepo(this.webServices);

Future<List<Chracter>> getAllCracters() async {
  final chracters = await webServices.getAllCracters();
  return chracters.map((chracter) => Chracter.fromJson(chracter)).toList();
}
  
}