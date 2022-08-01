// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, prefer_const_literals_to_create_immutables, unnecessary_const, implementation_imports, unnecessary_import, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Archived.dart';
import 'package:flutter_application_1/Done.dart';
import 'package:flutter_application_1/recent.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}


class _TasksState extends State<Tasks> {
  @override
  int currentIndex =0; 
  List <Widget> CureentScreen =[
    const RecentScreen(),
    const DoneScreen(),
    const ArchivedScreen(),
  ];
  List <String> CureentAppBar=["Recent","Done","Archived"];
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(CureentAppBar[currentIndex]),),
        body: CureentScreen[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (Index) {
              setState(() {
                currentIndex = Index;
              });
            },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: "Tasks"),          const BottomNavigationBarItem(
              icon: const Icon(
                Icons.done_all_outlined,
              ),
              label: "Done"),          const BottomNavigationBarItem(
              icon: Icon(
                Icons.archive_outlined,
              ),
              label: "Archived")
        ],
      )),
    ));
  }
}
