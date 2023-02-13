import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = <String>[];

  void _submit(value) {
    setState(() {
      list.add(value);
    });
    print(list);
  }

  void _update(text, item) {}

  void _remove(item) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(onSubmitted: (String value) {
              _submit(value);
            }),
            ListView(
              children: list.map((item) {
                return TodoItem(data: item, remove: _remove);
              }).toList(),
            ),
            // ListView.builder(
            //   padding: const EdgeInsets.all(8),
            //   itemBuilder: (BuildContext context, int index) {
            //     return Text('1');
            //     // return Container(
            //     //   height: 50,
            //     //   child: Center(child: Text('Entry ${list[index]}')),
            //     // );
            //   },
            //   // separatorBuilder: (BuildContext context, int index) =>
            //   // const Divider(),
            // ),
          ],
        ),
      )),
    );
  }
}

class TodoItem extends StatelessWidget {
  TodoItem({required this.data, required this.remove})
      : super(key: ObjectKey(data));

  final String data;
  final Function(String data) remove;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(data));
  }
}
