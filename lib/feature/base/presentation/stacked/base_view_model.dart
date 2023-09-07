import 'package:flutter/material.dart';

import 'package:luvit/feature/home/presentation/view/home_page.dart';
import 'package:stacked/stacked.dart';

class AppBaseViewModel extends BaseViewModel {
  AppBaseViewModel(BuildContext this.context);
  final BuildContext context;
  int currentIndex = 0;

   List<Widget> pages = const [
    HomePage(),
    Text("Location"),
    Text("Star"),
    Text("Chat"),
    Text("Profile"),
  ];
}
