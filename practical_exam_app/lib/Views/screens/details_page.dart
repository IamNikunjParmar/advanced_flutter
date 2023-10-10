import 'package:flutter/material.dart';
import 'package:practical_exam_app/Controllers/Quote_controller.dart';
import 'package:practical_exam_app/Model/qoutes_model.dart';
import 'package:provider/provider.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    QuoteModel quoteModel= ModalRoute.of(context)!.settings.arguments as QuoteModel;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Consumer<QuoteController>(
        builder: (context,pro,_) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: pro.allQuotes.length ,
                    itemBuilder:(ctx,index){

                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2,2),
                              blurRadius: 2,
                            ),
                          ],

                        ),
                        child: Text("${quoteModel.quote}"),
                      );


                }),
              )
            ],
          );
        }
      ),
    );
  }
}
