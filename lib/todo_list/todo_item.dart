import 'package:flutter/material.dart';

// 一定要有个类,才能List<TodoItemMap>
class TodoItemMap {
  TodoItemMap(
      {required this.id,
      required this.value,
      required this.isChecked,
      required this.errorText});

  final int id;
  String value;
  bool isChecked;
  String? errorText;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "value": value,
      "isChecked": isChecked,
      "errorText": null
    };
  }

  factory TodoItemMap.fromMap(Map map) {
    return TodoItemMap(
        id: map['id'],
        value: map['value'],
        isChecked: map['isChecked'],
        errorText: map['errorText']);
  }
}

typedef CheckBeforeSubmit = Function(String value, TodoItemMap item);
typedef OnChanged = Function(bool boolean, TodoItemMap item);
typedef Remove = Function(TodoItemMap item);

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.data,
      required this.onChanged,
      required this.checkBeforeSubmit,
      required this.remove})
      : super(key: ObjectKey(data));

  final TodoItemMap data;
  final OnChanged onChanged;
  final CheckBeforeSubmit checkBeforeSubmit;
  final Remove remove;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Checkbox(
          value: data.isChecked,
          onChanged: (boolean) => onChanged(boolean!, data)),
      Expanded(
          child: data.isChecked
              ? Text(
                  data.value,
                  style: data.isChecked
                      ? TextStyle(
                          fontSize: 16, decoration: TextDecoration.lineThrough)
                      : null,
                )
              : Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: TextField(
                      controller: TextEditingController.fromValue(
                          TextEditingValue(text: data.value)),
                      decoration: InputDecoration(
                        hintText: '请输入内容',
                        errorText: data.errorText,
                      ),
                      onSubmitted: (String value) {
                        checkBeforeSubmit(value, data);
                      }))),
      ElevatedButton(
        onPressed: () {
          remove(data);
        },
        child: const Text('删除'),
      )
    ]);
  }
}
