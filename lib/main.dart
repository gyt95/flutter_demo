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

// 一定要有个类,才能List<TodoItemMap>
class TodoItemMap {
  TodoItemMap({required this.id, required this.value, required this.isChecked});

  final int id;
  String value;
  bool isChecked;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "value": value,
      "isChecked": isChecked,
    };
  }

  factory TodoItemMap.fromMap(Map map) {
    return TodoItemMap(
      id: map['id'],
      value: map['value'],
      isChecked: map['isChecked'],
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItemMap> list = [];

  String? _errorText;

  int id = 1;

  late TextEditingController _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(); // 创建文本控制器实例
  }

  // dispose 当不再使用 TextEditingController 时，请销毁它以确保相关的资源得到释放。
  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  void _submit(value) {
    Map<String, dynamic> obj = {"id": id, "value": value, "isChecked": false};
    setState(() {
      list.insert(0, TodoItemMap.fromMap(obj));
      id = id + 1;
      _editingController = TextEditingController();
    });
    print(list.toList());
  }

  void _update(text, item) {
    // var arr = list.map((v) => v).toList();
    // 思路:原本list在map后得到的类型是Iterable<TodoItemMap>实际上需要List<TodoItemMap>
    // 所以最后要toList()转换
    // 之后又要对个别的值做处理,注意,如果v=>v,前面不用括号包裹,会报错 Undefined name 'v'.
    // 如下:
    // var arr = list.map(v => v).toList();

    var arr = list.map((v) {
      if (v.id == item.id) {
        v.value = text;
      }
      return v;
    }).toList();
    setState(() {
      list = arr;
    });
  }

  void _remove(item) {
    setState(() {
      list.removeWhere((v) => v.id == item.id);
    });
  }

  void onChanged(bool, item) {
    setState(() {
      list = list.map((v) {
        if (v.id == item.id) {
          v.isChecked = bool;
        }
        return v;
      }).toList();
    });
    print(list);
    print('...');
  }

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
            TextField(
                controller: _editingController,
                decoration: InputDecoration(
                  hintText: '请输入内容',
                  errorText: _errorText,
                ),
                onSubmitted: (String value) {
                  if (value.trim() == '') {
                    setState(() {
                      _errorText = '失败! 内容不能为空';
                    });
                  } else {
                    var lastValue = value.trim();
                    if (lastValue.length != value.length) {
                      setState(() {
                        _errorText = '失败! 包含多余空格';
                      });
                    } else {
                      _submit(value);
                      setState(() {
                        _errorText = null;
                      });
                    }
                  }
                }),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: list.map((item) {
                      return Row(children: [
                        Checkbox(
                            value: item.isChecked,
                            onChanged: (bool) => onChanged(bool, item)),
                        Expanded(
                            child: item.isChecked
                                ? Text(
                                    item.value,
                                    style: item.isChecked
                                        ? TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough)
                                        : null,
                                  )
                                : TextField(
                                    controller: TextEditingController.fromValue(
                                        TextEditingValue(text: item.value)),
                                    decoration: InputDecoration(
                                      hintText: '请输入内容',
                                      errorText: _errorText,
                                    ),
                                    onSubmitted: (String value) {
                                      if (value.trim() == '') {
                                        setState(() {
                                          _errorText = '失败! 内容不能为空';
                                        });
                                      } else {
                                        var lastValue = value.trim();
                                        if (lastValue.length != value.length) {
                                          setState(() {
                                            _errorText = '失败! 包含多余空格';
                                          });
                                        } else {
                                          _update(value, item);
                                          setState(() {
                                            _errorText = null;
                                          });
                                        }
                                      }
                                    })),
                        ElevatedButton(
                          onPressed: () {
                            _remove(item);
                          },
                          child: const Text('删除'),
                        )
                      ]);
                    }).toList()))
          ],
        ),
      )),
    );
  }
}
