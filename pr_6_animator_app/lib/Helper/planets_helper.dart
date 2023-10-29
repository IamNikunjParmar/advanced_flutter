import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:pr_6_animator_app/Modal/space_modal.dart';


class JsonHelper {
  JsonHelper._();

  static final JsonHelper jsonHelper = JsonHelper._();

  Future<List<GalaxyModal>> getData() async {

    String data = await rootBundle.loadString("assets/json/planets.json");

    List allPlanets = jsonDecode(data);

    log(allPlanets.toString());

    List<GalaxyModal> planetList = allPlanets
        .map(
          (e) => GalaxyModal.fromMap(
        data: e,
      ),
    )
        .toList();

    return planetList;
  }
}