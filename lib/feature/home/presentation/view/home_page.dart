import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:luvit/constants/app_images.dart';
import 'package:luvit/feature/home/presentation/stacked/home_view_model.dart';
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
                
                children: [
                  Container(
                    height: 50,
                    padding:
                        EdgeInsets.only(top: 5, right: 0, bottom: 5, left: 8),
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
                          margin: EdgeInsets.only(right: 4),
                          height: 40,
                          width: 134,
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Color(0xff000000),
                                    border: Border.all(
                                        width: 1, color: Color(0xff212121))),
                                padding: EdgeInsets.only(
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
                              return ListView.builder(
                                  itemCount: viewmodel.cardDatas.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: false,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 340,
                                      height: 600,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          border: Border.all(
                                            color: Color(0xff3A3A3A),
                                          )),
                                      child: Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              viewmodel.currentImageIndex = 1 +
                                                  viewmodel.currentImageIndex;
                                              viewmodel.notifyListeners();
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(999),
                                              child: Container(
                                                width: 340,
                                                height: 600,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: viewmodel
                                                      .cardDatas[index]
                                                      .images[0],
                                                  width: 340,
                                                  height: 600,
                                                  fit: BoxFit.fill,
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
                                                                  .circular(8),
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
                                            ),
                                          ),
                                          Positioned(
                                            top: 16,
                                            left: 20,
                                            child: Container(
                                              width: 300,
                                              alignment: Alignment.topCenter,
                                              child: AnimatedSmoothIndicator(
                                                activeIndex:
                                                    viewmodel.currentImageIndex,
                                                count: viewmodel
                                                    .cardDatas[index]
                                                    .images
                                                    .length,
                                                curve: Curves.easeOutSine,
                                                effect:
                                                    const CustomizableEffect(
                                                  spacing: 4,
                                                  dotDecoration: DotDecoration(
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
                                                                1000)),
                                                    color: Color(
                                                      0xffFF006B,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            } else {
                              return Text("No Data");
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

class ImageSliderWidget extends StatelessWidget {
  final List<String> images = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: images.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.network(
                item,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
