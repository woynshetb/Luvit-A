import 'package:flutter/material.dart';
import 'package:luvit/core/stacked/base.view_model.dart';
import 'package:luvit/feature/home/presentation/view/home_page.dart';

class AppBaseViewModel extends MyBaseViewModel {
  AppBaseViewModel(BuildContext context) {
    viewContext = context;
  }

  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    Text("Location"),
    Text("Star"),
    Text("Chat"),
    Text("Profile"),
  ];
  @override
  initialise() {
    setBusy(true);
    super.initialise();
    setBusy(false);
  }
}
