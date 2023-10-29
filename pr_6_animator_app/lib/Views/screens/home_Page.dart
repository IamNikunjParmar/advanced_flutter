import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pr_6_animator_app/Controllers/planets_controller.dart';
import 'package:pr_6_animator_app/Helper/planets_helper.dart';
import 'package:pr_6_animator_app/Utils/route_utils.dart';
import 'package:provider/provider.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge>with TickerProviderStateMixin{

  late AnimationController animationController;
  late Animation sizeAnimation;
  late Animation rotationAnimation;


  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
        duration: const Duration(seconds: 1300),
    );

    sizeAnimation = Tween(
        begin: 150.0,
        end: 250.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.easeInOutSine),
    );

    rotationAnimation = Tween(
      begin: 0.0,
      end: 360.0,
    ).animate(
        animationController
    );




  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanetController>(
      builder: (context,pro,_) {
        return Scaffold(
          body:
              SingleChildScrollView(
                child: Stack(
                 alignment: Alignment.center,
                  children:[
                   const  Image(
                      image: AssetImage("assets/images/bg space.jpg"),
                      fit: BoxFit.cover,
                      height: 867,
                    ),
                  AnimatedBuilder(
                      animation:rotationAnimation ,
                      builder: (context,_){
                        return Transform.rotate(
                          angle: rotationAnimation.value,
                        child:Transform.scale(
                          scale: 3,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [

                              Transform.rotate(
                                angle: pi - rotationAnimation.value,
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        pro.allPlanet[8].image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Transform.rotate(
                                angle: rotationAnimation.value,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                    Transform.rotate(
                                      angle: rotationAnimation.value,
                                      child: Container(
                                        height: 33,
                                        width: 33,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              pro.allPlanet[0].image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Transform.rotate(
                                angle: rotationAnimation.value,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 5,
                                      child: Transform.rotate(
                                        angle: rotationAnimation.value,
                                        child: Container(
                                          height: 33,
                                          width: 33,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                pro.allPlanet[1].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                              Transform.rotate(
                                angle: rotationAnimation.value,
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      child: Transform.rotate(
                                        angle: rotationAnimation.value,
                                        child: Container(
                                          height: 33,
                                          width: 33,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                pro.allPlanet[2].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                              Transform.rotate(
                                angle: rotationAnimation.value,
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Container(
                                      height: 190,
                                      width: 190,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 25,
                                      child: Transform.rotate(
                                        angle: rotationAnimation.value,
                                        child: Container(
                                          height: 33,
                                          width: 33,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                pro.allPlanet[3].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: 220,
                                    width: 220,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white10,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 35,
                                    child: Container(
                                      height: 33,
                                      width: 33,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            pro.allPlanet[4].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              Transform.rotate(
                                angle: rotationAnimation.value,
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white10,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 45,
                                      child: Container(
                                        height: 33,
                                        width: 33,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              pro.allPlanet[5].image,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),


                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    height: 280,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white10,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 55,
                                    child: Container(
                                      height: 33,
                                      width: 33,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            pro.allPlanet[6].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    height: 280,
                                    width: 280,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.white10,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 55,
                                    child: Container(
                                      height: 33,
                                      width: 33,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            pro.allPlanet[7].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),




                            ],
                          ),
                        ) ,


                        );


                  }),
                    Transform.translate(
                      offset: const Offset(0,400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              animationController.forward();
                            },
                            child: const Icon(Icons.play_arrow),
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,

                          ),

                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              animationController.stop();
                            },
                            child: const Icon(Icons.stop),

                          ),

                          FloatingActionButton(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              animationController.reverse();
                            },
                            child: const Icon(Icons.replay),

                          )
                        ],
                      ),
                    ),




                  ]
                ),
              ),

        );
      }
    );
  }
}
