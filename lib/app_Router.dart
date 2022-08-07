// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Constants/Strings.dart';
import 'package:flutter_application_1/data/API/web_services_page.dart';
import 'package:flutter_application_1/data/Repo/chracter_repo.dart';
import 'package:flutter_application_1/interface/screens/chracter_page_screen.dart';
import 'Constants/Strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allChracterScreen:
        return MaterialPageRoute(builder: (_) => ChracterScreen());
        break;

      case detialsScreen:
        return MaterialPageRoute(builder: (_) => ChracterScreen());
        break;

      default:
    }
  }
}
