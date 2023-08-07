import 'package:flutter/material.dart';
import 'package:flutter_demo/car/common/card_header.dart';
import 'package:flutter_demo/car/owner_eva_item.dart';

class OwnerEvaList extends StatelessWidget {
  final List<OwnerEvaItemMap> list;

  OwnerEvaList()
      : list = [
          OwnerEvaItemMap(
              id: 1,
              title: 'ID. UNYX Panther marks the end of the gas-powered...',
              image: AssetImage('assets/car/oe1.png')),
          OwnerEvaItemMap(
              id: 2,
              title: 'ID. UNYX Panther marks the end of the gas-powered...',
              image: AssetImage('assets/car/oe2.png')),
          OwnerEvaItemMap(
              id: 3,
              title: 'ID. UNYX Panther marks the end of the gas-powered...',
              image: AssetImage('assets/car/oe3.png')),
        ];

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10), // 列表上方的间距
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // 列表宽度设置为100%
              children: [
                CardHeader(title: 'Owner Evaluation'),
                SizedBox(height: 22.0), // Row和列表之间的间距
                ...list.map((item) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: OwnerEvaItem(
                        data: item,
                      ));
                }).toList()
              ]),
        )
      ],
    ));
  }
}
