import 'package:flutter/material.dart';

class CellGroupList extends StatelessWidget {
  final List<List<ItemData>> items = [
    [
      ItemData('assets/car/ssl_calc.png', 'Financial', 'Calculator'),
      ItemData('assets/car/ssl_setting.png', 'Configuration', 'Comparison')
    ],
    [
      ItemData('assets/car/ssl_category.png', 'Used Car', 'Transaction'),
      ItemData('assets/car/ssl_network.png', 'Travel', 'Service')
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          // 垂直水平居中布局思路：Row设置mainAxisAlignment为center就居中了，然后中间添加 SizedBox 作为图片&文本、子项&子项的间距
          Row(
            // Row 水平居中对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/car/ssl_calc.png',
                width: 40,
              ),
              SizedBox(width: 8.0),
              Container(
                  // decoration: BoxDecoration(
                  //   border:
                  //       Border.all(color: Colors.grey, width: 1), // 设置网格线的样式
                  // ),
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // start 靠左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Financial',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text(
                          'Calculator',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ])),
              SizedBox(width: 16.0),
              Image.asset(
                'assets/car/ssl_setting.png',
                width: 40,
              ),
              SizedBox(width: 8.0),
              Container(
                  // decoration: BoxDecoration(
                  //   border:
                  //       Border.all(color: Colors.grey, width: 1), // 设置网格线的样式
                  // ),
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // start 靠左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Configuration',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text('Comparison',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ]))
            ],
          ),
          SizedBox(height: 22.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/car/ssl_category.png',
                width: 40,
              ),
              SizedBox(width: 8.0),
              Container(
                  // decoration: BoxDecoration(
                  //   border:
                  //       Border.all(color: Colors.grey, width: 1), // 设置网格线的样式
                  // ),
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // start 靠左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Used Car',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text(
                          'Transaction',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ])),
              SizedBox(width: 16.0),
              Image.asset(
                'assets/car/ssl_network.png',
                width: 40,
              ),
              SizedBox(width: 8.0),
              Container(
                  // decoration: BoxDecoration(
                  //   border:
                  //       Border.all(color: Colors.grey, width: 1), // 设置网格线的样式
                  // ),
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // start 靠左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Travel',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                        Text('Service',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ]))
            ],
          )
        ]));
  }
}

class ItemData {
  final String imagePath;
  final String title;
  final String subTitle;

  ItemData(this.imagePath, this.title, this.subTitle);
}
