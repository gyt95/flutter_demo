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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold);
  static List<Widget Function()> _widgetOptions = [
    () => Text(
          'Index 0: Home',
          style: optionStyle,
        ),
    /**
     * 但 Container 不是一个常量表达式，因此不能直接放入 const 列表中
     * 
     * 可以使用一个匿名函数（lambda 函数）来延迟创建 Container
     * 然后将该函数作为 _widgetOptions 的第一个元素
     */
    () => Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              CarBuyingGuideList(),
              Expanded(
                child: SelectServiceList(),
              ),
              CellGroupList(),
              OwnerEvaList(),
            ],
          ),
        ),
    () => Text(
          'Index 2: Business',
          style: optionStyle,
        ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D171A),
      appBar: AppBar(
        title: null,
      ),
      body: Center(
        // child: _widgetOptions.elementAt(_selectedIndex), // 对应纯 Widget
        child: _widgetOptions[_selectedIndex](),
      ),
      bottomNavigationBar: BottomNavigationBar(
        /**
         * 此处不使用 const <BottomNavigationBarItem>[...]
         * 
         * 因为在 BottomNavigationBarItem 构造函数中，activeIcon 字段的类型为 Widget
         * 但是将其设置为 null，这是不允许的。
         * 
         * 解决方法：将 const 关键字移除，或者使用一个非空的 Widget 类型值来替代 null。
         */
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Community',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color(0xFFFFFFFF),
        selectedItemColor: Color(0xFFEED484),
        backgroundColor: Colors.transparent,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
