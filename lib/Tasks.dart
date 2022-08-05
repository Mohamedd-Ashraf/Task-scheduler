// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, prefer_const_literals_to_create_immutables, unnecessary_const, implementation_imports, unnecessary_import, annotate_overrides, sort_child_properties_last

// import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Archived.dart';
import 'package:flutter_application_1/Done.dart';
import 'package:flutter_application_1/bloc/pizza_bloc.dart';
import 'package:flutter_application_1/counter_Bloc.dart';
import 'package:flutter_application_1/recent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'models/models.dart';
import 'main.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

late Database data;
bool isBottomSheetOpened = false;
var scaffoldKey = GlobalKey<ScaffoldState>();
IconData fabbottom = Icons.add;

List<Map>? dataList;

class _TasksState extends State<Tasks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    createDataBase();
  }

  @override
  int currentIndex = 0;
  List<Widget> CureentScreen = [
    const RecentScreen(),
    const DoneScreen(),
    const ArchivedScreen(),
  ];
  List<String> CureentAppBar = ["Recent", "Done", "Archived"];
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Center(
          
          child: BlocBuilder<PizzaBloc, PizzaState>(
            builder: (context, state) {
              if (state is PizzaInitial){
                return CircularProgressIndicator(color: Colors.amber,);
              }
              if (state is Pizzaloaded){
                return Column(children: [Text("${state.piza.length}")],);
              }
              else {return Text("SomeThing went wrong ");}
            },
          ),
          
        ),
        floatingActionButton: FloatingActionButton( onPressed: (){
          context.read().add(addPizza(pizza.piza[0]));

        },)

      ),
      // home: BlocProvider(
      //   creator: (BuildContext context) => CounterCubit(),
      //   child: BlocConsumer<>(
        
      //   ),
      // ),
    ));
  }

  void createDataBase() async {
    data = await openDatabase(
      'tasks6.db',
      version: 2,
      onCreate: ((data, version) {
        data
            .execute(
                "CREATE TABLE Taskss(id INTEGER PRIMARY KEY, status TEXT, title TEXT, time TEXT)")
            .then((value) {
          print("Table is createed");
        }).catchError((onError) {
          print(onError);
        });

        print("Data base is Created");
      }),
      onOpen: (db) {
        print("dataBase Is opened");
        getFromDataBase(db)?.then((value) {
          dataList = value;
          print(dataList);
        });
      },
    );
  }

  void insertIntoDataBase() {
    data.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO Taskss( status, title, time) VALUES("asdf", "sdf", "asdf")')
          .then((value) {
        print("$value inserted ");
      }).catchError((onError) {
        print(onError);
      });
      // txn.insert('taks2').then((value) => null).catchError((onError){print(onError);});
      //  return  null;
    });
  }

  Future<List<Map>>? getFromDataBase(data) async {
    return await data.rawQuery('SELECT * FROM Taskss');
  }

// void createDatabase() async {
//     data = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         // id integer
//         // title String
//         // date String
//         // time String
//         // status String

//         print('database created');
//         database
//             .execute(
//                 'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Error When Creating Table ${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         print('database opened');
//       },
//     );
//   }

//   void insertToDatabase()  {
//      data.transaction((txn)
//     {
//       return txn
//           .rawInsert(
//         'INSERT INTO tasks(title, date, time, status) VALUES("title", "time", "date", "new")',
//       )
//           .then((value) {
//         print('$value inserted successfully');
//       }).catchError((error) {
//         print('Error When Inserting New Record ${error.toString()}');
//       });

//       // return null;
//     });
//   }

}




/* Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: Text(CureentAppBar[currentIndex]),
              ),
              floatingActionButton: FloatingActionButton(child:Icon(fabbottom),onPressed: (() {
        
                // insertIntoDataBase();
              //   if (isBottomSheetOpened){
              //     Navigator.pop(context);
              //      isBottomSheetOpened=false;
              //     setState(() {
              //       fabbottom = Icons.add;
              //     });
                  
              //   }
              //   else{
                
              //   scaffoldKey.currentState?.showBottomSheet((context) {
                 
                  
              //     return Container(
              //       width: 40,
              //       height: 150,
              //       color: Colors.red,
              //     );
              //   });
              //     isBottomSheetOpened=true;
              //     setState(() {
              //       fabbottom=Icons.edit;
              //     });
              //   }
              }
              
              )
              
              
              ),
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
                      label: "Tasks"),
                  const BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.done_all_outlined,
                      ),
                      label: "Done"),
                  const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.archive_outlined,
                      ),
                      label: "Archived")
                ],
              )), */