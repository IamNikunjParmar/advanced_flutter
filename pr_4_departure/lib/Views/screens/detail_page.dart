import 'package:flutter/material.dart';
import 'package:pr_4_departure/Helpers/json_helper.dart';
import 'package:pr_4_departure/Views/Componets/my_back_button.dart';

import '../../Utils/route_utils.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

   dynamic data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3C1B17),
        title: Text("${data['name']}",
          style: TextStyle(
              color: Color(0xffFFF1B9)
          ),
        ),
        leading: MyBackButton(),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff3C1B17),
      body:FutureBuilder(
          future: JasonHelper.jasonHelper.geetaGetData(),
          builder: (ctx,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (ctx,index){
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MyRoutes.SlockDetailpage,
                              arguments: snapshot.data![index]);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff3C1B17),
                            border: Border.all(
                              color: Color(0xffFFF1B9),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffFFF1B9),
                                offset: Offset(2,2),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: Text("श्लोक:${snapshot.data![index]['verse_number']}",
                            style:const  TextStyle(
                              color:  Color(0xffFFF1B9),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );


              });
            }else if(snapshot.hasError){

              return Text("Error:${snapshot.error}");

            }else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

          }),
    );
  }
}
