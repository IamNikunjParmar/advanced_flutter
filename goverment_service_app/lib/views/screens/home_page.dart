

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:goverment_service_app/Controllers/web_view_controller.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewController>(
      builder: (context,pro,_) {
        return StreamBuilder<Object>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.data == ConnectivityResult.none) {
              return SizedBox(
                  height: 10,
                  child: Transform.scale(scale: 0.4,
                      child: Image.asset("assets/images/no-wifi.png")));
            }
            else {
              return Scaffold(
                appBar: AppBar(
                  title: Text("My Browser"),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: () {
                      pro.back();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  actions: [
                    IconButton(onPressed: () {
                      pro.forword();
                    }, icon: Icon(Icons.arrow_forward_ios_outlined))
                  ],
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onSubmitted: (val) {
                          pro.search(value: val);
                        },
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                            hintText: "Search for Web",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                            )
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Expanded(
                      child: InAppWebView(
                        initialUrlRequest: URLRequest(url: Uri.parse(
                            pro.googleUrl)
                        ),
                        onLoadStart: (controller, Url) {
                          return pro.initController(
                              webViewController: controller);
                        },
                        onLoadStop: (controller, Url) {
                          return pro.initController(
                              webViewController: controller);
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        );

      }
    );
  }
}
