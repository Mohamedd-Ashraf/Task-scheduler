import 'package:flutter/material.dart';
import 'package:flutter_application_1/Business_Logic/cubit/chracters_cubit.dart';
import 'package:flutter_application_1/Constants/MyColors.dart';
import 'package:flutter_application_1/data/models/chracters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late List<Chracter> allChracter;

class ChracterScreen extends StatefulWidget {
  const ChracterScreen({Key? key}) : super(key: key);

  @override
  State<ChracterScreen> createState() => _ChracterScreenState();
}

class _ChracterScreenState extends State<ChracterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allChracter = BlocProvider.of<ChractersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Chracters"),
        backgroundColor: MyColors.MyYellow,
      ),
      body: buildBlockWidget(),
    );
  }
}

Widget buildBlockWidget() {
  return BlocBuilder<ChractersCubit, ChractersState>(
      builder: ((context, state) {
    if (state is ChractersIsLoaded) {
      allChracter = (state).chractersList;
      return buildLoadListWidget();
    } else {
      return screenIdacator();
    }
  }));
}

Widget screenIdacator() {
  return Center();
}

Widget buildLoadListWidget() {
  return SingleChildScrollView(
    child: Container(
      color: MyColors.Mygrey,
      child: Column(
        children: [buildCharcterList()],
      ),
    ),
  );
}

Widget buildCharcterList() {
  return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1 ,
          ),
      itemBuilder: ((context, index) {
       retuen CharacterItem();
      }));
}
