import 'package:flutter/material.dart';
import 'package:pr_4_departure/Helpers/json_helper.dart';
import 'package:pr_4_departure/Utils/route_utils.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3C1B17),
        title:const Text("श्रीमद भागवत गीता",
        style: TextStyle(
          color: Color(0xffFFF1B9)
        ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff3C1B17),
      body: FutureBuilder(
        future: JasonHelper.jasonHelper.getData(),
          builder: (ctx,snapshot){
          if(snapshot.hasData){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2
              ),
              itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff3C1B17),
                      border: Border.all(
                        color: Color(0xffFFF1B9),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffFFF1B9),
                          offset: Offset(2,2),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Text("${snapshot.data![index]['title']}"),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xffFFF1B9),
                            child: Text("${snapshot.data![index]['id']}",
                              style: const TextStyle(
                                  color:  Color(0xff3C1B17),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        // const Spacer(),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text("${snapshot.data![index]["name"]}",
                              style:const  TextStyle(
                                  color:  Color(0xffFFF1B9),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text("कुल श्लोक:${snapshot.data![index]['verses_count']}",
                            style:const  TextStyle(
                              color:  Color(0xffFFF1B9),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),

                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.of(context).pushNamed(MyRoutes.Detailpage,
                                  arguments: snapshot.data![index]);
                            },
                            color: const Color(0xffFFF1B9),
                          ),
                        ],
                      ),
                        const Spacer(),
                      ],
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

      })
    );
  }
}


