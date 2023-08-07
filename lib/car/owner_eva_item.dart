import 'package:flutter/material.dart';

class OwnerEvaItemMap {
  OwnerEvaItemMap({required this.id, required this.title, required this.image});

  // 定义
  final int id;
  String title;
  AssetImage image;

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "image": image};
  }

  factory OwnerEvaItemMap.fromMap(Map map) {
    return OwnerEvaItemMap(
      id: map['id'],
      title: map['title'],
      image: map['image'],
    );
  }
}

class OwnerEvaItem extends StatelessWidget {
  OwnerEvaItem({required this.data}) : super(key: ObjectKey(data));

  final OwnerEvaItemMap data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: data.image, // 使用data.image作为Image的image参数
          width: 80,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  data.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/car/oe_avatar.png',
                      width: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Gary Gastelu",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
