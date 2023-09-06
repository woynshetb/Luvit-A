import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:luvit/feature/home/presentation/stacked/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  const HomePage({key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(context),
        onViewModelReady: (viewmodel) async {
          await viewmodel.initialise();
        },
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: StreamBuilder<DatabaseEvent>(
                stream: viewmodel.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      viewmodel.onParseData(snapshot.data!);
                      return ListView.builder(
                          itemCount: viewmodel.cardDatas.length,
                          itemBuilder: (context, index) {
                            return Text(
                              viewmodel.cardDatas[index].name!,
                              style: TextStyle(color: Colors.white),
                            );
                          });
                    } else {
                      return Text("No Data");
                    }
                  }
                }),
          );
        });
  }
}
