import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  BuildContext? viewContext;
  final formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ConnectivityResult result = ConnectivityResult.none;
  bool hasConnection = true;

  initialise() async {
    await checkConnection();
    notifyListeners();
  }

  checkConnection() {
    InternetConnectionChecker().onStatusChange.listen((state) {
      final hasConnection = state == InternetConnectionStatus.connected;
      this.hasConnection = hasConnection;
      notifyListeners();
    });

    Connectivity().onConnectivityChanged.listen((result) {
      this.result = result;
      notifyListeners();
    });

    notifyListeners();
  }
}
