import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_watchlist/bloc/watchlist_bloc.dart';
import 'package:navigation_watchlist/model/contact_data_model.dart';
import 'package:navigation_watchlist/service/contactrespo.dart';
import 'package:navigation_watchlist/src/string.dart';
import 'categoreis_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late ContactBloc contactBloc;
  late TabController _tabController;
  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(vsync: this, length: 3);
    contactBloc = ContactBloc(ContactService());
    contactBloc.tabSink.add(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Strings.name.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.title),
          bottom: const TabBar(
            tabs: Strings.name,
          ),
        ),
        body: TabBarView(
            controller: _tabController,
            children: isLoading
                ? <Widget>[
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ]
                : <Widget>[
                    StreamBuilder(
                        stream: contactBloc.contactStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CategoriesScreen(
                                data: snapshot.data as List<Contact>);
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Text(Strings.unknownError);
                          }
                        }),
                    StreamBuilder(
                        stream: contactBloc.contactStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CategoriesScreen(
                                data: snapshot.data as List<Contact>);
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Text(Strings.unknownError);
                          }
                        }),
                    StreamBuilder(
                        stream: contactBloc.contactStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CategoriesScreen(
                                data: snapshot.data as List<Contact>);
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return const Text(Strings.unknownError);
                          }
                        }),
                  ]),
      ),
    );
  }
}
