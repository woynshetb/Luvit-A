import 'package:flutter/material.dart';
import 'package:luvit/constants/app_images.dart';
import 'package:luvit/feature/base/presentation/stacked/base_view_model.dart';
import 'package:stacked/stacked.dart';

class BasePage extends StatelessWidget {
  const BasePage({key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppBaseViewModel>.reactive(
        viewModelBuilder: () => AppBaseViewModel(context),
        builder: (context, viewmodel, child) {
          return Scaffold(
            body: viewmodel.pages[viewmodel.currentIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AppImages.starIcon),
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              child: BottomNavigationBar(
                elevation: 8,
                currentIndex: viewmodel.currentIndex,
                selectedItemColor: Color(0xffFF016B),
                unselectedItemColor: Color(0xff3A3A3A),
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                onTap: (val) {},
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      AppImages.homeIcon,
                    ),
                    label: "홈",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppImages.lcationIcon),
                    label: "스팟",
                  ),
                  const BottomNavigationBarItem(
                    icon: Text(""),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppImages.chatIcon),
                    label: "채팅",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppImages.profileIcon),
                    label: "마이",
                  ),
                ],
              ),
            ),
          );
        });
  }
}
