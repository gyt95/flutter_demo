import 'package:flutter/material.dart';

class SelectServiceList extends StatefulWidget {
  @override
  _SelectServiceListState createState() => _SelectServiceListState();
}

class _SelectServiceListState extends State<SelectServiceList> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> serviceItems = [
    'Service 1',
    'Service 2',
    'Service 3',
    'Service 4'
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
                    Row(
                      children: [
                        Text(
                          'Select Services',
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
                    // aaa
                    Container(
                      height: 300,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromARGB(47, 52, 64, 0),
                                  Color.fromARGB(47, 52, 64, 1),
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/car/ss1_1.png',
                          ),
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Charging Station',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Near You',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1.8W+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'All Stations',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2,000+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'ID. Stations',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30.0),
                                    Row(
                                      children: [
                                        Text(
                                          'Nearby Stations',
                                          style: TextStyle(
                                            color: Color(0xFFEED484),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Image.asset(
                                          'assets/car/arrow_station_more.png',
                                          width: 4,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Image.asset(
                            'assets/car/ss1_2.png',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    )
                  ])),
        ],
      ),
    );
  }
}
