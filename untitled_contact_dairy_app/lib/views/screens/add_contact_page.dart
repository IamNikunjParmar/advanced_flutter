import 'package:flutter/material.dart';
import 'package:untitled_contact_dairy_app/views/componets/my_back_button.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Contact"),
        leading: MyBackButton(),
      ),
    );
  }
}
