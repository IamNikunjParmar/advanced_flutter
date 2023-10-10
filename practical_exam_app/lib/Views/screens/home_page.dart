import 'package:flutter/material.dart';
import 'package:practical_exam_app/Controllers/Quote_controller.dart';
import 'package:practical_exam_app/Model/qoutes_model.dart';
import 'package:practical_exam_app/Utils/routes_utils.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Quote App"),
        centerTitle: true,
      ),
      body:Consumer<QuoteController>(
          builder: (context,pro,_) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child:   TextField(
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.text,
                    onSubmitted: (val) {
                      pro.getQuoteData(category: val);
                    },

                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search For Quotes",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: pro.allQuotes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (ctx,index){

                        QuoteModel quotes = pro.allQuotes[index];

                        return GestureDetector(
                          onTap: () {

                            Navigator.of(context).pushNamed(MyRoutes.detailsPage,arguments: pro.allQuotes[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(2,2),
                                    blurRadius: 2,
                                  ),
                                ],
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text("${quotes.category}",style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );

                      }
                  ),
                ),

              ],
            );
          }
      ),
    );
    
  }
}
