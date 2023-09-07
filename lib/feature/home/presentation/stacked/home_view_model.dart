import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luvit/constants/app_constants.dart';
import 'package:luvit/constants/app_urls.dart';
import 'package:luvit/core/stacked/base.view_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

class HomeViewModel extends MyBaseViewModel {
  HomeViewModel(BuildContext context) {
    viewContext = context;
  }
  var pageController = ScrollController();

  DatabaseReference ref = FirebaseDatabase.instance.ref("data");
  List<CardData> cardDatas = [];
  late Stream<DatabaseEvent> stream;
  int currentImageIndex = 0;
  int cardIndex = 0;
  @override
  initialise() async {
    setBusy(true);
    super.initialise();
    stream = ref.onValue;
    setBusy(false);
  }

  onParseData(DatabaseEvent event) {
    (event.snapshot);
    for (final child in event.snapshot.children) {
      Map maped = child.value as Map;
      Map<String, dynamic> jsonVal = {};
      maped.forEach((key, value) {
        jsonVal[key] = value;
      });

      cardDatas.add(CardData.fromJson(jsonVal));
    }
  }

  void onCardDrag(DraggableDetails details) {
    if (details.offset.dx < -100 || details.offset.dy > 100) {
      if (cardIndex < cardDatas.length - 1) {
        removeCard(cardIndex);
      }
    }
  }

  void removeCard(int index) {
    if (index >= 0 && index < cardDatas.length) {
      cardDatas.removeAt(index);
    }
    notifyListeners();
  }
}
