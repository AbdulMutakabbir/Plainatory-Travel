import 'package:flutter/material.dart';
import 'dart:math';

var random = Random.secure();

final list = {
  1: [
    '30.11',
    '30.3',
    '29.81',
    '164.8 years',
    '16.11 hrs',
    '132.99 miles',
    ' 28.32',
    ' -201'
  ],
  2: [
    '43',
    '43.69',
    '41.96',
    '288 years',
    '17.67 hrs',
    '344.8 miles',
    'NA',
    ' -161'
  ],
  3: [
    '45.8',
    '52.761',
    '38.360',
    '305 years',
    ' 22.82 hrs',
    '444 miles',
    '29',
    '-230'
  ],
  4: ['46.7', '43.7', '40.8', ' NA', '48 hrs', '103 miles', 'NA', ' -229'],
  5: ['51.6', '43', '34.9', '282 years', '4 hrs', '385 miles', ' NA', ' -241'],
  6: [
    '67.3',
    '101.25',
    '33.49',
    '184.8 years',
    '22.4 hrs',
    '410 miles',
    ' NA',
    ' -39'
  ],
  7: ['68', '47', '38', '558 years', '25.9 hrs', '722 miles', ' NA', ' -217'],
  8: [
    '76',
    '936',
    '76.09',
    '11408 years',
    '10.273 hrs',
    '309.13 miles',
    ' NA',
    ' -261'
  ]
};

Widget planetPageTabContant = PlanetInfoTab();

class PlanetView extends StatefulWidget {
  final String name;
  final AssetImage image;
  final String rank;

  PlanetView({this.name, this.image, this.rank});

  _PlanetViewState createState() =>
      _PlanetViewState(name: name, image: image, rank: rank);
}

class _PlanetViewState extends State<PlanetView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        duration: new Duration(seconds: 60), vsync: this);
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.linear)
          ..addListener(() => this.setState(() {}))
          ..addStatusListener((AnimationStatus status) {});
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final String name;
  final String rank;
  AssetImage image = AssetImage('assets/images/test.gif');

  _PlanetViewState({this.name, this.image, this.rank});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: Stack(
            children: <Widget>[
              Container(
                height: 200,
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Transform.rotate(
                  angle: animation.value * 4 * 2 * pi,
                  child: Image(
                    image: image,
                    height: 00,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 240),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromRGBO(250, 250, 250, 1),
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(0, 4, 40, 0.9),
                      Color.fromRGBO(36, 59, 85, 0.98)
                    ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                  ),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            name,
                            style: TextStyle(fontSize: 45),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.attach_money),
                                    onPressed: () {
                                      setState(() {
                                        planetPageTabContant = PlanetActivityTAb();
                                      });
                                    },
                                  ),
                                  Text('Resources'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.assignment),
                                    onPressed: () {
                                      planetPageTabContant = PlanetBookingTab();
                                    },
                                  ),
                                  Text('Timing'),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.info),
                                    onPressed: () {
                                      setState(() {
                                        planetPageTabContant =
                                            PlanetInfoTab(rank: rank);
                                      });
                                    },
                                  ),
                                  Text("Information"),
                                ],
                              ),
                            ],
                          ),
                          planetPageTabContant,
                        ],
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityDetsCardView extends StatelessWidget {

  final double fuel = (random.nextInt(200)+40)*1.0;
  final double nature = (random.nextInt(200)+40)*1.0;
  final double minerals = (random.nextInt(200)+40)*1.0;
  final double ore = (random.nextInt(200)+40)*1.0;
  final double water = (random.nextInt(200)+40)*1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          alignment: Alignment.topCenter,
         children: <Widget>[
           Container(
             margin: EdgeInsets.only(top:50),
             height:650,
             width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               gradient: LinearGradient(colors: [Color.fromRGBO(24, 90, 157, 1),Color.fromRGBO(67, 206, 167, 1)],)
             ),
             child: Padding(
               padding: const EdgeInsets.only(top:70.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Water Available',
                           style: TextStyle(
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.all(4),
                         ),
                         Stack(
                           alignment: Alignment.centerLeft,
                           children: <Widget>[
                             Container(
                                 width:250,
                                 height:25,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(3),
                                   color: Colors.white,
                                 )
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:2.0),
                               child: Container(
                                   width:(random.nextInt(200)+40)*1.0,
                                   height:21,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3),
                                     color: Colors.amber,
                                   ),
                                 child: Center(child: Text('$water cu mi',style:TextStyle(fontWeight: FontWeight.bold))),
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Fuel Available',
                           style: TextStyle(
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.all(4),
                         ),
                         Stack(
                           alignment: Alignment.centerLeft,
                           children: <Widget>[
                             Container(
                                 width:250,
                                 height:25,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(3),
                                   color: Colors.white,
                                 )
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:2.0),
                               child: Container(
                                   width: fuel,
                                   height:21,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3),
                                     color: Colors.amber,
                                   ),
                                  child: Center(child: Text('$fuel MB/D',style:TextStyle(fontWeight: FontWeight.bold)))
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Ore Available',
                           style: TextStyle(
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.all(4),
                         ),
                         Stack(
                           alignment: Alignment.centerLeft,
                           children: <Widget>[
                             Container(
                               width:250,
                               height:25,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(3),
                                 color: Colors.white,
                               )
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:2.0),
                               child: Container(
                                   width:(random.nextInt(200)+40)*1.0,
                                   height:21,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3),
                                     color: Colors.amber,
                                   ),
                                   child: Center(child: Text('$ore bu USD',style:TextStyle(fontWeight: FontWeight.bold))),
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Minerals Available',
                           style: TextStyle(
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.all(4),
                         ),
                         Stack(
                           alignment: Alignment.centerLeft,
                           children: <Widget>[
                             Container(
                                 width:250,
                                 height:25,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(3),
                                   color: Colors.white,
                                 )
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:2.0),
                               child: Container(
                                   width:minerals,
                                   height:21,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3),
                                     color: Colors.amber,
                                   ),
                                   child: Center(child: Text('$minerals bu USD',style:TextStyle(fontWeight: FontWeight.bold))),
                               ),

                             ),
                           ],
                         )
                       ],
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(18.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text('Natural Resources',
                           style: TextStyle(
                             fontSize: 35,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.all(4),
                         ),
                         Stack(
                           alignment: Alignment.centerLeft,
                           children: <Widget>[
                             Container(
                                 width:250,
                                 height:25,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(3),
                                   color: Colors.white,
                                 )
                             ),
                             Padding(
                               padding: const EdgeInsets.only(left:2.0),
                               child: Container(
                                   width:nature,
                                   height:21,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(3),
                                     color: Colors.amber,
                                   ),
                                   child: Center(child: Text('$nature MB/D')),
                               ),
                             ),
                           ],
                         )
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ),
           CircleAvatar(
             radius: 50,
             backgroundColor: Colors.white,
             child: Image(
               height: 95,
               image: AssetImage('assets/images/surface.png'),
             )
           )
         ],
        ),
      )
    );
  }


}

class AtmosphericDetsCardView extends StatelessWidget {
  final double cold = (random.nextInt(90) + 95) * 1.0;
  final double heat = (random.nextInt(90) + 95) * 1.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180,
                margin: EdgeInsets.only(top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(97, 67, 133, 1),
                        Color.fromRGBO(81, 99, 149, 1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Atmospheric Details',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.ac_unit,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 28.0, top: 8, left: 8),
                                          child: Container(
                                            height: 25,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 28.0, top: 8, left: 10),
                                          child: Container(
                                            height: 20,
                                            width: cold,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Max Cold: -$cold\u00b0F',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.brightness_7,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.centerLeft,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 28.0, top: 8, left: 8),
                                          child: Container(
                                            height: 25,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 28.0, top: 8, left: 10),
                                          child: Container(
                                            height: 20,
                                            width: heat,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Max Heat: $heat\u00b0F',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                  ),
                  Image(
                    image: AssetImage('assets/images/Atmosphere.png'),
                    height: 80,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class ObjectsInfoCardView extends StatelessWidget {
  final String rotation, radius, tilt;
  final String rank;

  ObjectsInfoCardView({this.rank, this.rotation, this.radius, this.tilt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.centerRight,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 140,
                margin: EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(97, 67, 133, 1),
                        Color.fromRGBO(81, 99, 149, 1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Object\'s Information',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 80.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Rotation: ' +
                                  list[random.nextInt(7) + 1][4]),
                              Text('Planet\'s Radius: ' +
                                  list[random.nextInt(7) + 1][5]),
                              Text('Axial Tilt: ' +
                                  list[random.nextInt(7) + 1][6] +
                                  '\u00b0'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                  ),
                  Image(
                    image: AssetImage('assets/images/planet.png'),
                    height: 80,
                  ),
                ],
              ),
            ],
          )),
    );
    ;
  }
}

class OrbitCardView extends StatelessWidget {
  final String distance, aphi, peri, rev;
  final String rank;

  OrbitCardView({this.rank, this.distance, this.aphi, this.peri, this.rev});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 160,
                margin: EdgeInsets.only(left: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(97, 67, 133, 1),
                        Color.fromRGBO(81, 99, 149, 1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Orbital Distance',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Average Distance: ' +
                                  list[random.nextInt(7) + 1][0] +
                                  ' AU'),
                              Text('Aphelion: ' +
                                  list[random.nextInt(7) + 1][1] +
                                  ' AU'),
                              Text('Perihelion: ' +
                                  list[random.nextInt(7) + 1][2] +
                                  ' AU'),
                              Text('Revolution: ' +
                                  list[random.nextInt(7) + 1][3]),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: Colors.white,
                  ),
                  Image(
                    image: AssetImage('assets/images/orbit.png'),
                    height: 80,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

class PlanetActivityTAb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ActivityDetsCardView();
  }
}

class PlanetInfoTab extends StatelessWidget {
  final String rank;

  PlanetInfoTab({this.rank});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AtmosphericDetsCardView(),
        OrbitCardView(
            rank: rank, distance: '68', aphi: '49.3', peri: '30', rev: '557'),
        ObjectsInfoCardView(
            rank: rank, rotation: '259 Days', radius: '722 Miles', tilt: '57'),
      ],
    );
  }
}

class Booking extends StatelessWidget {
  final String membership;
  final Color c1, c2;
  final int days, yrs;

  Booking({this.membership, this.yrs, this.days, this.c1, this.c2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: 240,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [c1, c2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  membership,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.av_timer,
                      size: 60,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                yrs.toString(),
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Years',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                days.toString(),
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Days',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class PlanetBookingTab extends StatelessWidget {
  var randY = random.nextInt(25) + 7;
  var randD = random.nextInt(300) + 62;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Booking(
            membership: 'Exclusive',
            yrs: randY,
            days: randD,
            c1: Color.fromRGBO(255, 126, 95, 1),
            c2: Color.fromRGBO(255, 195, 113, 1)),
        Booking(
            membership: 'Business',
            yrs: randY + random.nextInt(4) + 1,
            days: randD + random.nextInt(10) + 1,
            c1: Color.fromRGBO(2, 170, 176, 1),
            c2: Color.fromRGBO(0, 205, 172, 1)),
        Booking(
            membership: 'Economy',
            yrs: randY + random.nextInt(13) + 7,
            days: randD + random.nextInt(15) + 11,
            c1: Color.fromRGBO(25, 84, 123, 1),
            c2: Color.fromRGBO(255, 216, 155, 1)),
      ],
    );
  }
}
