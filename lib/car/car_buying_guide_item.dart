import 'package:flutter/material.dart';

class CarBuyingGuideItemMap {
  CarBuyingGuideItemMap(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.image});

  // 定义
  final int id;
  String title;
  String subTitle;
  AssetImage image;

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "subTitle": subTitle, "image": image};
  }

  factory CarBuyingGuideItemMap.fromMap(Map map) {
    return CarBuyingGuideItemMap(
      id: map['id'],
      title: map['title'],
      subTitle: map['subTitle'],
      image: map['image'],
    );
  }
}

class CarBuyingGuideItem extends StatelessWidget {
  CarBuyingGuideItem({required this.data}) : super(key: ObjectKey(data));

  final CarBuyingGuideItemMap data;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: data.image, fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
        constraints: BoxConstraints.tightFor(height: 150),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 4),
                Text(
                  data.subTitle,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Spacer(), // 添加一个占位符，将“Learn more”和图像推到底部
                Row(
                  children: [
                    Text(
                      'Learn More',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Image.asset(
                      'assets/car/arrow_learn_more.png',
                      width: 4,
                    )
                  ],
                )
              ],
            )));
  }
}
