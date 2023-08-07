import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
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
            Text('More', style: TextStyle(color: Color(0x73FFFFFF))),
            SizedBox(width: 4.0),
            Image.asset(
              'assets/car/arrow_more.png', // 替换为实际的图像路径
              width: 16.0,
              height: 16.0,
            ),
          ],
        ),
      ],
    );
  }
}
