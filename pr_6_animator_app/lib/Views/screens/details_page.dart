import 'package:flutter/material.dart';
import 'package:pr_6_animator_app/Modal/space_modal.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {

   dynamic data = ModalRoute.of(context)!.settings.arguments as GalaxyModal;

    return Scaffold(
      body: Stack(
        children: const [
          Image(
            image: AssetImage("assets/images/bg space.jpg"),
            fit: BoxFit.cover,
            height: 867,
          ),
        ],
      ),
    );
  }
}
