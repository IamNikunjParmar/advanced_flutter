
import 'package:flutter/material.dart';
import 'package:pr_5_sky_skapper/Controller/wether_controller.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context,pro,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff3398FE),
            actions: [
              Transform.translate(
                offset: const Offset(-5,15),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    pro.visibleMethod();
                  },
                  icon: const Icon(
                      Icons.search),
                  iconSize: 40,
                ),
              )
            ],
          ),
          backgroundColor: const Color(0xff3398FE),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                 Visibility(
                   visible: pro.isVisible,
                     child: TextField(

                       textInputAction: TextInputAction.search,
                       cursorColor: Colors.white,
                       style: const TextStyle(
                         color: Colors.white,
                         fontSize: 18,
                       ),
                       onSubmitted: (val) {
                         pro.getWeatherData(city: val);
                       },
                       decoration: InputDecoration(
                         labelText: "Search for City",
                         labelStyle: const TextStyle(
                           color: Colors.white,
                           fontSize: 18
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(40),
                         ),
                         focusedBorder: OutlineInputBorder(
                           borderSide: const BorderSide(
                               color: Colors.white,
                             width: 2
                           ),
                           borderRadius: BorderRadius.circular(40),
                         ),
                       ),
                     ),
                 ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Align(
                        child: Text("${pro.weatherModel.temp}°C",
                          style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Transform.translate(
                        offset: const Offset(7,-15),
                        child: const Image(
                            image: AssetImage("assets/PNG/sunny.png"),
                        height: 140,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          const Spacer(),
                        const  Icon(Icons.arrow_downward_rounded,
                          color: Colors.white,
                            size: 30,
                          ),
                         // const SizedBox(
                         //    width: 5,
                         //  ),
                          Text("${pro.weatherModel.min_temp}°",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        const Spacer(),
                       const Text("Clear Sky",
                         style:  TextStyle(
                           color: Colors.white,
                           fontSize: 25,
                           fontWeight: FontWeight.bold
                         ),
                       ),
                        const Spacer(),
                        const  Icon(Icons.arrow_upward_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          Text("${pro.weatherModel.max_temp}°",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(18),
                          height: 260,
                          width: 380,
                          decoration: BoxDecoration(
                            color: const Color(0xff123499),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(80),
                                bottomRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                offset: const Offset(4,4),
                                blurRadius: 6,
                              ),
                            ],
                            image: const DecorationImage(
                              opacity: 1.1,
                              image: AssetImage("assets/PNG/feel like.png"
                              ),
                              scale: 2
                            ),
                          ),
                          child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Feels like",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Align(
                                child: const ImageIcon(
                                  color: Colors.white,
                                  size: 50,
                                  AssetImage("assets/PNG/hot.png")
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: Text(" ${pro.weatherModel.feels_like}°C",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(18),
                          height: 260,
                          width: 380,
                          decoration: BoxDecoration(
                            color: const Color(0xff123499),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(80),
                              bottomLeft: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                offset: const Offset(-4,4),
                                blurRadius: 6,
                              ),
                            ],
                            image: const DecorationImage(
                                opacity: 1.1,
                                image: AssetImage("assets/PNG/feel like.png"
                                ),
                                scale: 2
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Humidity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Align(
                                child: ImageIcon(
                                    color: Colors.white,
                                    size: 50,
                                    AssetImage("assets/PNG/humidity1.png")
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: Text(" ${pro.weatherModel.humidity}°C",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(18),
                          height: 260,
                          width: 380,
                          decoration: BoxDecoration(
                            color: const Color(0xff123499),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(80),
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                offset: const Offset(4,-4),
                                blurRadius: 6,
                              ),
                            ],
                            image: const DecorationImage(
                                opacity: 1.1,
                                image: AssetImage("assets/PNG/feel like.png"
                                ),
                                scale: 2
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Wind Speed",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Align(
                                child: ImageIcon(
                                    color: Colors.white,
                                    size: 50,
                                    AssetImage("assets/PNG/wind.png")
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: Text(" ${pro.weatherModel.wind_speed} km/h",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(18),
                          height: 260,
                          width: 380,
                          decoration: BoxDecoration(
                            color: const Color(0xff123499),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(80),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade900,
                                offset: const Offset(4,4),
                                blurRadius: 6,
                              ),
                            ],
                            image: const DecorationImage(
                                opacity: 1.1,
                                image: AssetImage("assets/PNG/feel like.png"
                                ),
                                scale: 2
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Cloud Cover",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const Align(
                                child: ImageIcon(
                                    color: Colors.white,
                                    size: 50,
                                    AssetImage("assets/PNG/cloud.png")
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                child: Text(" ${pro.weatherModel.cloud_pct} m",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),

        );
      }
    );
  }
}
