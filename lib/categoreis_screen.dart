import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:navigation_watchlist/watchlist_bloc.dart';
import 'contact_item.dart';
import 'contact_data_model.dart';

class CategoriesScreen extends StatelessWidget {
  List<Contact> data;

  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 15),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: data.length == null ? 0 : data.length,
                  itemBuilder: (
                    BuildContext context,
                    int i,
                  ) {
                    return userList(context, i, data);
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
