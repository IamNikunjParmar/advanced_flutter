import 'package:flutter/material.dart';

import '../Componets/my_back_button.dart';


class SlockDetailsPage extends StatelessWidget {
  const SlockDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    dynamic data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3C1B17),
        title: Text("श्लोक : ${data['verse_number']}",
          style: const TextStyle(
              color: Color(0xffFFF1B9)
          ),
        ),
        leading: const MyBackButton(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                 margin: EdgeInsets.all(10),
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Color(0xff3C1B17),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: Offset(3,3),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child:  Text("${data['text']}",
                    style: const TextStyle(
                        color: Color(0xffFFF1B9),
                      fontSize: 20,
                    ),

                  ),
                ),
                Container(
                  height: 400,
                  width: 300,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff3C1B17),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage("https://i.pinimg.com/564x/8d/69/fd/8d69fddacdf8c2d6bcf1a1e8fa0b01b0.jpg"),
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                      color: Colors.grey.shade800,
                      offset: Offset(3,3),
                      blurRadius: 2,
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
