import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/theme_controller.dart';
import '../Componets/my_back_button.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffA5D7E8),
          foregroundColor: Colors.white,
          leading: MyBackButton(),
          title: Container(
            child: Text("Settings"),
            height: 45,
            width: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xff0B2447),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black54,
                  offset: Offset(3,3),
                ),
              ],
            ),
          ),
          centerTitle: true,
          toolbarHeight: 100,
        ),
        body: Column(
          children: [
            Consumer<ThemeController>(
                builder: (context,pro,_) {
                  return Column(
                    children: [
                      ListTile(
                        title: const Text("Theme"),
                        subtitle: const Text("Change Theme"),
                        leading: Icon(Icons.brightness_6),
                        trailing: Switch(
                          value: pro.isDark,
                          onChanged: (value) {
                            pro.themeChange();
                          },
                          activeColor: Color(0xff3D246C),
                        ),
                        // onTap: () {
                        //   pro.profileChange();
                        // },
                      ),
                    ],
                  );

                }
            ),
          ],
        )
    );
  }
}
