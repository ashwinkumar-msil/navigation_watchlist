import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoreisItem extends StatelessWidget {
  final int id;
  final String name;
  final String url;
  final int number;
  const CategoreisItem(
      {required this.id,
      required this.name,
      required this.number,
      required this.url});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(15.0),
      child: Text(name),
    );
  }
}
