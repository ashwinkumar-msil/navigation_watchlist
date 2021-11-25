import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_watchlist/contact_data_model.dart';
import 'categoreis_screen.dart';
import 'watchlist_bloc.dart';

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
    contactBloc = ContactBloc();
    contactBloc.tabSink.add(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Contact 1"),
              Tab(text: "Contact 2"),
              Tab(
                text: 'Contact 3',
              )
            ],
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
                            return const Text('Something went wrong');
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
                            return const Text('Something went wrong');
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
                            return const Text('Something went wrong');
                          }
                        }),
                  ]),
      ),
    );
  }
}
