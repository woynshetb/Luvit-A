import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:luvit/constants/app_images.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';
import 'package:luvit/feature/home/presentation/stacked/home_view_model.dart';
import 'package:luvit/feature/home/presentation/view/widgets/card_one.dart';
import 'package:luvit/feature/home/presentation/view/widgets/card_three.dart';
import 'package:luvit/feature/home/presentation/view/widgets/card_two.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                        top: 5, right: 0, bottom: 5, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  AppImages.appbarlocationIcon,
                                  width: 14,
                                  height: 18,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const Text(
                              "목이길어슬픈기린님의 새로운 스팟",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xffFCFCFC),
                                fontSize: 14,
                                height: 20 / 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 4),
                          height: 40,
                          width: 134,
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xff000000),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff212121))),
                                padding: const EdgeInsets.only(
                                    top: 5, right: 10, bottom: 5, left: 6),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            AppImages.appBarStarIcon,
                                            width: 14,
                                            height: 14,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "323,233",
                                        style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 14.0,
                                          height: 16.7 / 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffFCFCFC),
                                          letterSpacing: -0.6,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppImages.notificationIcon,
                                    width: 16.52,
                                    height: 19,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    height: 600,
                    width: double.infinity,
                    child: StreamBuilder<DatabaseEvent>(
                        stream: viewmodel.stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasData) {
                              viewmodel.onParseData(snapshot.data!);

                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  viewmodel.cardDatas.length,
                                  (cardIndex) => Draggable(
                                      onDragEnd: viewmodel.onCardDrag,
                                      feedback: Material(
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Container(
                                            width: 340,
                                            height: 600,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                                border: Border.all(
                                                  color: const Color(0xff3A3A3A),
                                                )),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 340,
                                                  height: 600,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                    20,
                                                  )),
                                                  child: CachedNetworkImage(
                                                    imageUrl: viewmodel
                                                            .cardDatas[cardIndex]
                                                            .images[
                                                        viewmodel
                                                            .currentImageIndex],
                                                    width: 340,
                                                    height: 600,
                                                    fit: BoxFit.cover,
                                                    imageBuilder:
                                                        (context, imageprovier) {
                                                      return Container(
                                                        decoration:
                                                            ShapeDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  imageprovier),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    placeholder: (context, url) =>
                                                        Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor: Colors.red,
                                                      child: Container(
                                                        width: 340,
                                                        height: 600,
                                                        decoration:
                                                            ShapeDecoration(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Icon(
                                                      Icons.error,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 16,
                                                  left: 20,
                                                  child: Container(
                                                    width: 300,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child:
                                                        AnimatedSmoothIndicator(
                                                      activeIndex: viewmodel
                                                          .currentImageIndex,
                                                      count: viewmodel
                                                          .cardDatas[cardIndex]
                                                          .images
                                                          .length,
                                                      curve: Curves.easeOutSine,
                                                      effect:
                                                          const CustomizableEffect(
                                                        spacing: 4,
                                                        dotDecoration:
                                                            DotDecoration(
                                                          height: 3,
                                                          width: 56.8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      1000)),
                                                          color: Color(
                                                            0xff202020,
                                                          ),
                                                        ),
                                                        activeDotDecoration:
                                                            DotDecoration(
                                                          height: 3,
                                                          width: 56.8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              1000,
                                                            ),
                                                          ),
                                                          color: Color(
                                                            0xffFF006B,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                            .currentImageIndex ==
                                                        0,
                                                    child: MainProfileBodyOne(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                            .currentImageIndex ==
                                                        1,
                                                    child: MainProfileBodyTwo(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                                .currentImageIndex <=
                                                            2 &&
                                                        viewmodel
                                                                .currentImageIndex <
                                                            viewmodel
                                                                .cardDatas[
                                                                    cardIndex]
                                                                .images
                                                                .length,
                                                    child: MainProfileBodyThree(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTapDown: (TapDownDetails details) {
                                          final double x =
                                              details.localPosition.dx;
                                          final double y =
                                              details.localPosition.dy;

                                          if (x < 50 && y < 50) {
                                            if (viewmodel.cardIndex > 0) {
                                              viewmodel.removeCard(
                                                  viewmodel.cardIndex);
                                              viewmodel.notifyListeners();
                                            }
                                          }
                                        },
                                        onTapUp: (details) {
                                          final RenderBox box = context
                                              .findRenderObject() as RenderBox;
                                          final Offset localPosition =
                                              box.globalToLocal(
                                                  details.globalPosition);

                                          if (localPosition.dy < 20 &&
                                              localPosition.dx < 100) {
                                            // previos
                                            viewmodel.onImageIndexChange(
                                              cardIndex,
                                              viewmodel.currentImageIndex - 1,
                                            );
                                          } else if (localPosition.dy < 20 &&
                                              localPosition.dx > 300) {
                                            viewmodel.onImageIndexChange(
                                              cardIndex,
                                              viewmodel.currentImageIndex + 1,
                                            );
                                          }
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Container(
                                            width: 340,
                                            height: 600,
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff3A3A3A),
                                                )),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 340,
                                                  height: 600,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                    20,
                                                  )),
                                                  child: CachedNetworkImage(
                                                    imageUrl: viewmodel
                                                            .cardDatas[cardIndex]
                                                            .images[
                                                        viewmodel
                                                            .currentImageIndex],
                                                    width: 340,
                                                    height: 600,
                                                  
                                                     fit: BoxFit.cover,
                                                  imageBuilder:
                                                      (context, imageprovier) {
                                                    return Container(
                                                      decoration:
                                                          ShapeDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:
                                                                imageprovier),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            20,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                    placeholder:
                                                        (context, url) =>
                                                            Shimmer.fromColors(
                                                      baseColor: Colors.grey,
                                                      highlightColor:
                                                          Colors.red,
                                                      child: Container(
                                                        width: 340,
                                                        height: 600,
                                                        decoration:
                                                            ShapeDecoration(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Icon(
                                                      Icons.error,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 16,
                                                  left: 20,
                                                  child: Container(
                                                    width: 300,
                                                    alignment:
                                                        Alignment.topCenter,
                                                    child:
                                                        AnimatedSmoothIndicator(
                                                      activeIndex: viewmodel
                                                          .currentImageIndex,
                                                      count: viewmodel
                                                          .cardDatas[cardIndex]
                                                          .images
                                                          .length,
                                                      curve: Curves.easeOutSine,
                                                      onDotClicked: (int val) {
                                                        viewmodel
                                                            .onImageIndexChange(
                                                          cardIndex,
                                                          val,
                                                        );
                                                      },
                                                      effect:
                                                          const CustomizableEffect(
                                                        spacing: 4,
                                                        dotDecoration:
                                                            DotDecoration(
                                                          height: 3,
                                                          width: 56.8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          1000)),
                                                          color: Color(
                                                            0xff202020,
                                                          ),
                                                        ),
                                                        activeDotDecoration:
                                                            DotDecoration(
                                                          height: 3,
                                                          width: 56.8,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              1000,
                                                            ),
                                                          ),
                                                          color: Color(
                                                            0xffFF006B,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                            .currentImageIndex ==
                                                        0,
                                                    child: MainProfileBodyOne(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                            .currentImageIndex ==
                                                        1,
                                                    child: MainProfileBodyTwo(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 0,
                                                  child: Visibility(
                                                    visible: viewmodel
                                                                .currentImageIndex >=
                                                            2 &&
                                                        viewmodel
                                                                .currentImageIndex <=
                                                            viewmodel
                                                                .cardDatas[
                                                                    cardIndex]
                                                                .images[viewmodel
                                                                    .currentImageIndex]
                                                                .length,
                                                    child: MainProfileBodyThree(
                                                      cardData: viewmodel
                                                          .cardDatas[cardIndex],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              );
                            } else {
                              return const Center(
                                  child: const Text(
                                "No Data",
                              ));
                            }
                          }
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}



