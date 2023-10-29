import 'package:flutter/material.dart';
import 'package:pr_6_animator_app/Helper/planets_helper.dart';
import 'package:pr_6_animator_app/Modal/space_modal.dart';


class PlanetController extends ChangeNotifier {
  List<GalaxyModal> allPlanet = [];

  PlanetController() {
    getData();
  }

  getData() async {
    allPlanet = await JsonHelper.jsonHelper.getData();
    notifyListeners();
  }
}