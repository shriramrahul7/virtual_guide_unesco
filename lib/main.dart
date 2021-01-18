import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_guide/UnescoSite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Tourist Guide',
      theme: ThemeData.dark(),
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

  // void initState() {
  //   super.initState();
  //   unescoSites = getSites();
  // }

  // Future<String> getJson() {
  //   return DefaultAssetBundle.of(context).loadString('load_json/world-heritage-list-india-fields.json');
  // }

  // Future<String> getJson() {
  //   return rootBundle.loadString('load_json/world-heritage-list-india-fields.json');
  // }

  //   List<UnescoSite> getSites()  {
  //     var jsonData = jsonDecode( getJson() );

  //     List<UnescoSite> unescoSites = [];

  //     for (var site in jsonData) {
  //       UnescoSite unescoSite = UnescoSite.fromJson(site);

  //       unescoSites.add(unescoSite);
  //     }

  //     return unescoSites;
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore The World'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('load_json/world-heritage-list-india-fields.json'),
            builder: (context, snapshot) {
              var jsonData = jsonDecode(snapshot.data.toString());

              for (var site in jsonData) {
                UnescoSite unescoSite = UnescoSite.fromJson(site);

                unescoSites.add(unescoSite);
              }

              return ListView.builder(
                itemCount: unescoSites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.tealAccent,
                    ),
                    title: Text(unescoSites[index].site),
                    subtitle: Text(unescoSites[index].category),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
