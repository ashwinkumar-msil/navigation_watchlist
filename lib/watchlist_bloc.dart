import 'dart:async';

import 'contact_data_model.dart';
import 'package:http/http.dart' as http;

class ContactBloc {
  List<Contact> contactList = [];

  final _tabStreamController = StreamController<int>();
  StreamSink<int> get tabSink => _tabStreamController.sink;
  Stream<int> get _tabStream => _tabStreamController.stream;

  final _contactStreamController = StreamController<List<Contact>>.broadcast();
  StreamSink<List<Contact>> get _contactSink => _contactStreamController.sink;
  Stream<List<Contact>> get contactStream => _contactStreamController.stream;

  ContactBloc() {
    _tabStream.listen((event) {
      if (event == 1) {
        fetchAlbum();
      }
    });
  }

  Future<void> fetchAlbum() async {
    List<Contact> contactdata = [];
    final response = await http.get(Uri.parse(
        'https://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts'));
    try {
      if (response.statusCode == 200) {
        contactdata = contactFromJson(response.body);
        _contactSink.add(contactdata);
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void dispose() {
    _contactStreamController.close();
    _tabStreamController.close();
  }
}
