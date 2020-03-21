import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'Planets.dart';

class Loader extends StatefulWidget {
  @override
  State createState() => new LoaderState();
}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    AssetImage sun = AssetImage('assets/images/sun.png');
    AssetImage planet1 = AssetImage('assets/images/charon.png');
    AssetImage planet2 = AssetImage('assets/images/Eris.png');
    AssetImage planet3 = AssetImage('assets/images/Quaoar.png');
    AssetImage planet4 = AssetImage('assets/images/pluto.png');
    AssetImage planet5 = AssetImage('assets/images/makmake.png');
    AssetImage planet6 = AssetImage('assets/images/sedna.png');
    AssetImage planet7 = AssetImage('assets/images/varuna.png');
    AssetImage planet8 = AssetImage('assets/images/Despina.png');
    AssetImage planet9 = AssetImage('assets/images/Halimede.png');
    AssetImage planet10 = AssetImage('assets/images/haumea.png');
    AssetImage planet11 = AssetImage('assets/images/Triton.png');

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        width: 1200,
        child: Center(
          child: Stack(
            children: <Widget>[
              Sun(
                planet: sun,
                animation: animation,
              ),
              Planet(
                rank:'2',
                  radius: 80,
                  speed: 7,
                  offset: -6,
                  planet: planet3,
                  animation: animation,
                  name: 'Quaoar'),
              Planet(
                rank:'3',
                  radius: 120,
                  speed: 2,
                  offset: -8,
                  planet: planet5,
                  animation: animation,
                  name: 'Makemake'),
              Planet(
                rank:'5',
                  radius: 160,
                  speed: 1,
                  offset: 6.5,
                  planet: planet10,
                  animation: animation,
                  name: 'Haumea'),
              Planet(
                rank:'7',
                  radius: 200,
                  speed: 9,
                  offset: 2,
                  planet: planet2,
                  animation: animation,
                  name: 'Eris'),
              Planet(
                rank:'1',
                  radius: 240,
                  speed: 6,
                  offset: -4,
                  planet: planet1,
                  animation: animation,
                  name: 'Charon'),
              Planet(
                rank: '2',
                  radius: 280,
                  speed: 4,
                  offset: -2,
                  planet: planet4,
                  animation: animation,
                  name: 'Pluto'),
              Planet(
                rank:'3',
                  radius: 320,
                  speed: 3,
                  offset: 4,
                  planet: planet7,
                  animation: animation,
                  name: 'Varuna'),
              Planet(
                rank:'4',
                  radius: 360,
                  speed: 5,
                  offset: -1,
                  planet: planet8,
                  animation: animation,
                  name: 'Despina'),
              Planet(
                rank:'5',
                  radius: 400,
                  speed: 2,
                  offset: 6,
                  planet: planet9,
                  animation: animation,
                  name: 'Halimede'),
              Planet(
                rank:'6',
                  radius: 440,
                  speed: 4,
                  offset: -2,
                  planet: planet11,
                  animation: animation,
                  name: 'Triton'),
            ],
          ),
        ),
      ),
    );
  }
}

class Sun extends StatelessWidget {
  final AssetImage planet;
  final Animation<double> animation;

  Sun({this.planet, this.animation});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: animation.value * 6 * 2 * pi,
                child: Image(
                  image: planet,
                  height: 30,
                ),
              ),
              Text('Sun'),
            ],
          ),
        ));
  }
}

class Planet extends StatelessWidget {
  final double speed, radius, offset;
  final String name,rank;
  final AssetImage planet;
  final Animation<double> animation;

  Planet(
      {this.name,
      this.radius,
      this.speed,
      this.offset,
      this.planet,
      this.animation,this.rank});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: animation.value * speed * 2 * pi,
        child: Transform.translate(
            offset: Offset(radius, radius / 7),
            child: Center(
                child: Transform.rotate(
              angle: -animation.value * speed * 2 * pi,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlanetView(
                                name: name,
                                image: planet,
                            rank:rank,
                              )));
                    },
                    child: Transform.rotate(
                      angle: animation.value * speed * 3 * pi,
                      child: Image(
                        image: planet,
                        height: 30,
                      ),
                    ),
                  ),
                  Text(name),
                ],
              ),
            ))));
  }
}
