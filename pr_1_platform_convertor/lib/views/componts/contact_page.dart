import 'package:flutter/material.dart';
import 'package:pr_1_platform_convertor/Controllers/date_controller.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
               child: Icon(Icons.photo_camera,size: 40),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.person_rounded),
                label: Text("Full Name",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                ),

              ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                prefixIcon: Icon(Icons.call),
                label: Text("Phone Number",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),

            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),

                prefixIcon: Icon(Icons.chat),
                label: Text("Chat Converstion",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              ),

            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: ()async {
                 DateTime? d= await showDatePicker(context: context,
                      initialDate: Provider.of<DateController>(context,listen: false).d ??DateTime.now(),
                      firstDate: DateTime(1947),
                      lastDate: DateTime(2050)
                 );
                 if(d != null) {

                   Provider.of<DateController>(context,listen: false).dateChange(dateTime: d);
                 }

                },
                  icon: Icon(Icons.date_range_rounded),),
                // const SizedBox(
                //   width: ,
                //
                // ),
                Consumer<DateController>(
                  builder: (context,pro,_) {
                    return Container(
                        margin: EdgeInsets.all(14),
                        child: Text("${pro.d!.day}/${pro.d!.month}/${pro.d!.year}"));
                  }
                ),
                const Spacer(),
                IconButton(onPressed: () async{

                 TimeOfDay? t= await showTimePicker(context: context,
                     initialTime: Provider.of<DateController>(context,listen: false).t ??TimeOfDay.now()
                 );
                 if(t != null) {

                   Provider.of<DateController>(context,listen: false).timeChange(time: t);
                 }


                },
                    icon: Icon(Icons.timer_outlined)),
                // const SizedBox(
                //   width: ,
                //
                // ),
                Consumer<DateController>(
                    builder: (context,pro,_) {
                      return Container(
                          margin: EdgeInsets.all(14),
                          child: Text("${pro.t!.hour % 12}/${pro.t!.minute}"));
                    }
                ),

              ],
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:MaterialStatePropertyAll<Color>(Color(0xff3D246C),
                ),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
                onPressed: () {

            },
                child: Text("SAVE"))

          ],
        ),
      ),
    );
  }
}
