import 'package:flutter/material.dart';

import 'One.dart';
import 'Two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedindex = 0 ;

  var page = [
    One(),
    Two()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text("NavigationRail "),
        ),
      body: Container(
          child: Row(
            children: [
              NavigationRail(
                backgroundColor: Colors.black,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                NavigationRailDestination( icon: Icon(Icons.wifi,color: Colors.yellow,), label: Text("Wifi",style:TextStyle(color: Colors.yellow),),
                selectedIcon: Icon(
                  Icons.wifi,
                  color: Colors.blue,)
                ),
                NavigationRailDestination(icon: Icon(Icons.sunny,color: Colors.yellow,), label: Text("sunny",style: TextStyle(color: Colors.yellow),),
                selectedIcon: Icon(
                  Icons.sunny,
                  color: Colors.blue,)
                ),

              ], selectedIndex: selectedindex,
              onDestinationSelected: (val){
                setState(() {
                  selectedindex = val;
                });
              },
              ),
              Expanded(child: Container(
                child: page[selectedindex],
              ))
            ],
          ),
      ),
    ));
  }
}



