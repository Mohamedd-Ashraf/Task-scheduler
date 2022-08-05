import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class pizza extends Equatable {
  @required
  String? name;
  @required
  int? id;

  pizza({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  static List<pizza> piza = [pizza(id: 1, name: "ss"),pizza(id: 2, name: "aa")];
}
