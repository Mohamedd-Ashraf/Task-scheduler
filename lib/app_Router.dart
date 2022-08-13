// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Business_Logic/cubit/chracters_cubit.dart';
import 'package:flutter_application_1/Constants/Strings.dart';
import 'package:flutter_application_1/data/API/web_services_page.dart';
import 'package:flutter_application_1/data/Repo/chracter_repo.dart';
import 'package:flutter_application_1/interface/screens/chracter_page_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Constants/Strings.dart';

class AppRouter {
    late CharactersRepository chractersRepo;
    late ChractersCubit chractersCubit;

    AppRouter() {
      chractersRepo = CharactersRepository(WebServices());
      chractersCubit = ChractersCubit(chractersRepo);
    }
  Route? generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case allChracterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => chractersCubit,
            child: ChracterScreen(),
          ),
        );
      

      case detialsScreen:
        return MaterialPageRoute(builder: (_) => ChracterScreen());
        

      default:
    }
  }
}
