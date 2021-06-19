import 'dart:math';

import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), Front()],
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;

    final start = Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(240, 240, 240, 1),
            Color.fromRGBO(255, 255, 255, 1),
          ])),
    );

    final firstBox = Transform.rotate(
        angle: -pi / 4,
        child: Container(
          width: _sizeScreen.width / 1.3,
          height: _sizeScreen.width / 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withOpacity(0.5)),
        ));

    final secondBox = Transform.rotate(
        angle: -pi / 4,
        child: Container(
          width: _sizeScreen.width / 1.3,
          height: _sizeScreen.width / 1.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withOpacity(0.5)),
        ));

    return Stack(children: [
      start,
      Positioned(top: -5, left: -120, child: firstBox),
      Positioned(top: -270, left: 155, child: secondBox)
    ]);
  }
}

class Front extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      child: Column(
        children: [
          ContentFirst(),
          ContentSecond(),
          ContentThird(),
          SizedBox(height: 20),
          ContentForth(),
          ContentFifth(),
        ],
      ),
    ));
  }
}

class ContentFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          Text('Kudos',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          Icon(Icons.shopping_bag_outlined)
        ],
      ),
    );
  }
}

class ContentSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('favourites',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.all(10),
            width: 70,
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'VIEW ALL',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ForRow extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String points;
  final Color star1;
  final Color star2;
  final Color star3;
  final Color star4;
  final Color star5;

  const ForRow(
      {@required this.image,
      @required this.title,
      @required this.subtitle,
      @required this.points,
      @required this.star1,
      @required this.star2,
      @required this.star3,
      @required this.star4,
      @required this.star5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: 238,
              height: 118,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 7,
                    blurRadius: 7,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: 250,
              height: 110,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/' + image),
                      width: 30,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 4,
                                blurRadius: 4,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add_circle_rounded,
                          color: Colors.blue[600],
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 9,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          points + ' ',
                          style: TextStyle(
                              color: Colors.black38,
                              fontSize: 9,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.star,
                          size: 8,
                          color: star1,
                        ),
                        Icon(
                          Icons.star,
                          size: 8,
                          color: star2,
                        ),
                        Icon(
                          Icons.star,
                          size: 8,
                          color: star3,
                        ),
                        Icon(
                          Icons.star,
                          size: 8,
                          color: star4,
                        ),
                        Icon(
                          Icons.star,
                          size: 8,
                          color: star5,
                        )
                      ],
                    )
                  ],
                )
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

class ContentThird extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          ForRow(
              image: 'washer.png',
              title: 'Washer Machine',
              subtitle: 'Ready Wash Stainless',
              points: '4.6',
              star1: Colors.blue[600],
              star2: Colors.blue[600],
              star3: Colors.blue[600],
              star4: Colors.blue[600],
              star5: Colors.black38),
          SizedBox(width: 15),
          ForRow(
              image: 'dryer.png',
              title: 'Dryer Machine',
              subtitle: 'Ready Wash Stainless',
              points: '3.2',
              star1: Colors.blue[600],
              star2: Colors.blue[600],
              star3: Colors.blue[600],
              star4: Colors.black38,
              star5: Colors.black38)
        ],
      ),
    );
  }
}

class ContentForth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
            'ALL',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class ForColumn extends StatelessWidget {
  final String image;
  final String title;
  final String points;
  final Color star1;
  final Color star2;
  final Color star3;
  final Color star4;
  final Color star5;

  const ForColumn(
      {@required this.image,
      @required this.title,
      @required this.points,
      @required this.star1,
      @required this.star2,
      @required this.star3,
      @required this.star4,
      @required this.star5});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 340,
              height: 86,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/' + image),
                          width: 50,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  points + ' ',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 8,
                                  color: star1,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 8,
                                  color: star2,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 8,
                                  color: star3,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 8,
                                  color: star4,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 8,
                                  color: star5,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        width: 35,
                        child: Icon(
                          Icons.more_vert,
                          size: 35,
                          color: Colors.black26,
                        )),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

class ContentFifth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ForColumn(
                image: 'microwave.png',
                title: 'Microwave Oven',
                points: '4.6',
                star1: Colors.blue[600],
                star2: Colors.blue[600],
                star3: Colors.blue[600],
                star4: Colors.blue[600],
                star5: Colors.black38),
            SizedBox(height: 12),
            ForColumn(
                image: 'whisk.png',
                title: 'Whisk',
                points: '3.3',
                star1: Colors.blue[600],
                star2: Colors.blue[600],
                star3: Colors.blue[600],
                star4: Colors.black38,
                star5: Colors.black38),
            SizedBox(height: 12),
            ForColumn(
                image: 'speakers.png',
                title: 'Speakers',
                points: '4.6',
                star1: Colors.blue[600],
                star2: Colors.blue[600],
                star3: Colors.blue[600],
                star4: Colors.blue[600],
                star5: Colors.black38),
            SizedBox(height: 12),
            ForColumn(
                image: 'air.png',
                title: 'Air Conditioner',
                points: '5.0',
                star1: Colors.blue[600],
                star2: Colors.blue[600],
                star3: Colors.blue[600],
                star4: Colors.blue[600],
                star5: Colors.blue[600]),
            SizedBox(height: 12),
            ForColumn(
                image: 'tv.png',
                title: 'Television',
                points: '5.0',
                star1: Colors.blue[600],
                star2: Colors.blue[600],
                star3: Colors.blue[600],
                star4: Colors.blue[600],
                star5: Colors.blue[600]),
            SizedBox(height: 12)
          ],
        ),
      ),
    );
  }
}
