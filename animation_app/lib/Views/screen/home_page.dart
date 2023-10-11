import 'dart:math';

import 'package:animation_app/Controllers/fruite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;



    return Scaffold(
      // appBar: AppBar(
      //    backgroundColor: Color(0xff007995),
      // ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 867,
            child: Image.asset("assets/images/bg theme.png",
              fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<FruitController>(
              builder: (context,pro,_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pro.allData
                            .map((e) => Draggable(
                          data:e,
                          feedback: Container(
                            margin: EdgeInsets.all(10),
                            height: h * 0.1,
                            width: w * 0.3,
                            child:  Text(
                              e.toString().toUpperCase(),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade800,
                                    blurRadius: 3,
                                    offset: Offset(2,2)
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: h * 0.1,
                            width: w * 0.3,
                            alignment: Alignment.center,
                            child:  Text(
                              e.toString().toUpperCase(),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade800,
                                    blurRadius: 3,
                                    offset: Offset(2,2)
                                ),
                              ],
                            ),
                          ),
                          childWhenDragging: Container(),
                        ),
                        ).toList(),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pro.allImages
                            .map((e) =>
                            Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade800,
                                blurRadius: 3,
                                offset: Offset(2,2)
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(5),
                          height: 250,
                          width: 250,
                        )).toList(),
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                    const SizedBox(
                      height: 100,
                    ),


                    DragTarget(
                        onAccept: (data){

                        },
                        onWillAccept: (data){

                          return data == pro.allData;
                        },

                        builder: (ctx,_,__){
                          return Stack(
                              children:[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  height: h * 0.1,
                                  width: w * 0.3,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade800,
                                          blurRadius: 3,
                                          offset: Offset(2,2)
                                      ),
                                    ],
                                  ),
                                ),


                              ]
                          );

                        }),
                  ],
                );
              }
            ),
          ),
        ],
      ),

    );
  }
}

