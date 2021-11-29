import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:navigation_watchlist/service/contactrespo.dart';

class ContactBloc {
  List<Contact> contactList = [];

  final _tabStreamController = StreamController<int>();
  StreamSink<int> get tabSink => _tabStreamController.sink;
  Stream<int> get _tabStream => _tabStreamController.stream;

  final _contactStreamController = StreamController<List<Contact>>.broadcast();
  StreamSink<List<Contact>> get _contactSink => _contactStreamController.sink;
  Stream<List<Contact>> get contactStream => _contactStreamController.stream;
  ContactService contactRepo;
  ContactBloc(this.contactRepo) {
    List<Contact> contactdata = [];
    _tabStream.listen((event) async {
      if (event == 1) {
        contactdata = await contactRepo.fetchContact();
        _contactSink.add(contactdata);
      }
    });
  }

  void dispose() {
    _contactStreamController.close();
    _tabStreamController.close();
  }
}
