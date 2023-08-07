import 'package:flutter/material.dart';
import 'package:flutter_demo/car/car_buying_guide_item.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10), // 列表上方的间距
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // 列表宽度设置为100%
                  children: [
                    Row(
                      children: [
                        Text(
                          'Car buying guide',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        SizedBox(width: 8.0),
                        Row(
                          children: [
                            Text('More',
                                style: TextStyle(color: Color(0x73FFFFFF))),
                            SizedBox(width: 4.0),
                            Image.asset(
                              'assets/car/arrow_more.png', // 替换为实际的图像路径
                              width: 16.0,
                              height: 16.0,
                            ),
                          ],
                        ),
                      ],
                    ),
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
