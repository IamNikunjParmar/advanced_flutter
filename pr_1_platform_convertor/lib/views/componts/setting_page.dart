import 'package:flutter/material.dart';
import 'package:pr_1_platform_convertor/Controllers/setting_controller.dart';
import 'package:pr_1_platform_convertor/Controllers/theme_controller.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Consumer<SettingController>(
        builder: (context,pro,_) {
          return Column(
            children: [
              ListTile(
                title: const Text("Profile"),
                subtitle: const Text("Update Profile Data"),
                leading: Icon(Icons.person),
                trailing: Switch(
                  value: pro.isSelected,
                  onChanged: (value) {
                    pro.profileChange();
                  },
                  activeColor: Color(0xff3D246C),
                ),
                // onTap: () {
                //   pro.profileChange();
                // },
              ),
              const Divider(),
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
          );
        }
      ),
    );
  }
}
