import 'package:flutter/material.dart';

class SalesConsultant extends StatelessWidget {
  final double imageWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            /**
         * 使用 Expanded 组件将 sc1 图像和文本部分扩展以占用剩余的可用空间
         */
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(imageWidth * 0.5),
                      right: Radius.circular(imageWidth * 0.5),
                    ),
                    child: Image.asset(
                      'assets/car/sc1.png',
                      width: 40,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sales Consultant',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Online consultation model',
                        style: TextStyle(
                          color: Color(0x73FFFFFF),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 26),
            // 使用 Container 组件来创建宽度为 36dp、高度为 36dp 的带有背景色的 Box
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                width: 36,
                height: 36,
                padding: EdgeInsets.all(8), // box和image之间的内边距
                decoration: BoxDecoration(
                  color: Color(0x1AFFFFFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'assets/car/sc2.png',
                ),
              ),
            ),
            SizedBox(width: 26),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                width: 36,
                height: 36,
                padding: EdgeInsets.all(8), // box和image之间的内边距
                decoration: BoxDecoration(
                  color: Color(0x1AFFFFFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset(
                  'assets/car/sc3.png',
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 42),
        child: Text(
          '“ Hi, I am car consultant, please contact me ”',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ]);
  }
}
