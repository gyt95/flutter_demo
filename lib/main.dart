import 'package:flutter/material.dart';
import 'package:flutter_demo/car/car_buying_guide_list.dart';
import 'package:flutter_demo/car/cell_group_list.dart';
import 'package:flutter_demo/car/owner_eva_list.dart';
import 'package:flutter_demo/car/select_service_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarHomePage(title: 'Flutter'),
    );
  }
}

class CarHomePage extends StatefulWidget {
  const CarHomePage({super.key, required this.title});

  final String title;

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0D171A),
        appBar: AppBar(
          title: null,
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(children: [
                  CarBuyingGuideList(),
                  Expanded(
                    child: SelectServiceList(),
                  ),
                  CellGroupList(),
                  OwnerEvaList(),
                ]))));
  }
}
