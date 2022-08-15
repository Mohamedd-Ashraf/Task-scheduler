import 'package:flutter/material.dart';
import 'package:flutter_application_1/Business_Logic/cubit/chracters_cubit.dart';
import 'package:flutter_application_1/Constants/MyColors.dart';
import 'package:flutter_application_1/data/models/chracters.dart';
import 'package:flutter_application_1/interface/widgets/character_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Character> allChracter = [];
List<Character> tempChracter = [];
late List<Character> searchForChracter;
bool isSearching = false;
final searchTextControler = TextEditingController();
List femaleIds = [3, 6, 14, 16, 23, 25, 26, 30, 36, 46, 47, 52, 53, 55, 112];

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Widget buildSearchScren() {
    return TextField(
      controller: searchTextControler,
      cursorColor: MyColors.Mygrey,
      decoration: InputDecoration(
          hintText: "Find a Character",
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: MyColors.MyLightGrey,
            fontSize: 18,
          )),
      style: TextStyle(color: MyColors.MyLightGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedForItmesToSearchedList(searchedCharacter);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChractersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? buildSearchScren() : buildAppBarTitle(),
        actions: buildappbarAction(),
        leading: isSearching
            ? BackButton(
                color: MyColors.MyLightGrey,
              )
            : Container(),
        backgroundColor: MyColors.MyYellow,
      ),
      body: buildBlockWidget(),
    );
  }

  void addSearchedForItmesToSearchedList(String searchedCharacter) {
    searchForChracter = allChracter
        .where((charcter) => charcter.name
            .toLowerCase()
            .contains(searchedCharacter.toLowerCase()))
        .toList();
    setState(() {});
  }

  List<Widget> buildappbarAction() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              searchTextControler.text.isEmpty
                  ? Navigator.pop(context)
                  : clearSearch();
              ;
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.MyLightGrey,
            ))
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search),
          color: MyColors.MyLightGrey,
        )
      ];
    }
  }

  Widget buildBlockWidget() {
    return BlocBuilder<ChractersCubit, ChractersState>(
        builder: ((context, state) {
      if (state is ChractersIsLoaded) {
        state.chractersList.toList().forEach((element) {
          if (!femaleIds.contains(element.charId)) {
            tempChracter.add(element);
          }
          ;
        });
        allChracter = tempChracter.toList();

        tempChracter = [];

        return buildLoadListWidget();
      } else {
        return screenIdacator();
      }
    }));
  }

  Widget screenIdacator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.MyYellow,
      ),
    );
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: searchTextControler.text.isEmpty
            ? allChracter.length
            : searchForChracter.length,
        itemBuilder: ((context, index) {
          return CharacterItem(
            chracter: searchTextControler.text.isEmpty
                ? allChracter[index]
                : searchForChracter[index],
          );
        }));
  }

  startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    //  ModalRoute.of(context)!
    //     .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  stopSearching() {
    clearSearch();

    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    setState(() {
      searchTextControler.clear();
    });
  }

  Widget buildAppBarTitle() {
    return Text(
      'All Characters',
      style: TextStyle(color: MyColors.MyLightGrey),
    );
  }
}
