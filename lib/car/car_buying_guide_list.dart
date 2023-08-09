import 'package:flutter/material.dart';
import 'package:flutter_demo/car/car_buying_guide_item.dart';
import 'package:flutter_demo/car/common/card_header.dart';

class CarBuyingGuideList extends StatelessWidget {
  final List<CarBuyingGuideItemMap> list;

  CarBuyingGuideList()
      : list = [
          CarBuyingGuideItemMap(
              id: 1,
              title: 'ID. UNYX',
              subTitle: 'Brand Insurance & Service Package',
              image: AssetImage('assets/car/cbg1.png')),
          CarBuyingGuideItemMap(
              id: 2,
              title: 'ID. UNYX',
              subTitle: 'Maintenance&Repair',
              image: AssetImage('assets/car/cbg2.png')),
          CarBuyingGuideItemMap(
              id: 3,
              title: 'ID. UNYX',
              subTitle: 'Financial Loan Program',
              image: AssetImage('assets/car/cbg3.png')),
        ];

  @override
  Widget build(BuildContext context) {
    return Container(
        /**
         * 在 Flutter 中设置边距（margin）的方式，表示在水平方向上设置一个固定的边距值为 20
         * symmetric 是一个 EdgeInsets 类提供的方法，用于在水平和垂直方向上设置对称的边距
         * 当只传递一个参数时，它会将该参数值同时应用于水平和垂直方向
         */
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10), // 列表上方的间距
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // 列表宽度设置为100%
              children: [
                CardHeader(title: 'Car buying guide'),
                SizedBox(height: 22.0), // Row和列表之间的间距
                ...list.map((item) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: CarBuyingGuideItem(
                        data: item,
                      ));
                }).toList()
              ]),
          /**
             * 不使用toList()会报错,尝试将一个类型为Iterable<CarBuyingGuideItem>的参数赋值给类型为List<Widget>的参数,但它们的类型不匹配
             * List<Widget>表示一个包含Widget对象的列表
             * Iterable<CarBuyingGuideItem>表示一个迭代CarBuyingGuideItem对象的可迭代对象
             * 
             * 办法:通过使用map()函数将CarBuyingGuideItem对象转换为Widget对象,然后将其放入一个新的列表中
             * map()函数将每个CarBuyingGuideItem对象转换为相应的Widget对象
             * 返回一个新的Iterable对象
             * 通过调用toList()方法将Iterable对象转换为一个新的List<Widget>对象
             */
        )
      ],
    ));
  }
}
