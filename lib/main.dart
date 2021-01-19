import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:virtual_guide/UnescoSite.dart';

import 'Services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Tourist Guide',
      // theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UnescoSite> unescoSites = [];
  List<UnescoSite> filteredSites = [];
  var isSearching = false;

  void initState() {
    super.initState();
    Services.getUnescoSites().then((sites) {
      setState(() {
        unescoSites = sites;
        filteredSites = unescoSites;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore The World'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Enter Name or Location',
              ),
              onChanged: (string) {
                if (string == '') {
                  isSearching = false;
                  setState(() {});
                } else {
                  isSearching = true;
                  setState(() {
                    // print('inside setstate + $string');
                    filteredSites = unescoSites
                        .where(
                          (u) => (u.site
                              .toLowerCase()
                              .contains(string.toLowerCase())),
                        )
                        .toList();
                  });
                }
              },
            ),
            isSearching
                ? Container()
                : Container(
                    color: Colors.redAccent,
                    height: 200.0,
                  ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                    ),
                    title: Text(filteredSites[index].site),
                    subtitle: Text(filteredSites[index].category),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
