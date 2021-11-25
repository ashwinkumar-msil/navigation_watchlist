import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'contact_item.dart';
import 'contact_data_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  List<Contact> contactdata = [];
  Future<void> fetchAlbum() async {
    final response = await http.get(Uri.parse(
        'https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    try {
      this.setState(() {
        contactdata = contactFromJson(response.body);
      });

      debugPrint(contactdata[1].name);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  itemCount:
                      contactdata.length == null ? 0 : contactdata.length,
                  itemBuilder: (
                    BuildContext context,
                    int i,
                  ) {
                    return userList(context, i, contactdata);
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
