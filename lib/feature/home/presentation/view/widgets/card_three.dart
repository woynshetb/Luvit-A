import 'package:flutter/material.dart';
import 'package:luvit/constants/app_images.dart';
import 'package:luvit/feature/home/data/model/card_model.dart';

class MainProfileBodyThree extends StatelessWidget {
  final CardData cardData;
  const MainProfileBodyThree({
    Key? key,
    required this.cardData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 292,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 226,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xff000000),
                          border: Border.all(
                              width: 1, color: const Color(0xff212121))),
                      padding: const EdgeInsets.only(
                          top: 5, right: 10, bottom: 5, left: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppImages.greyStar,
                                width: 14,
                                height: 14,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            "${cardData.likeCount}",
                            style: const TextStyle(
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
                    RichText(
                      text: TextSpan(
                        text: '${cardData.name}',
                        style: TextStyle(
                          color: Color(0xffFCFCFC),
                          fontFamily: "Pretendard",
                          fontSize: 28,
                          height: 33.6 / 28,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${cardData.age}',
                              style: TextStyle(
                                color: Color(0xffFCFCFC),
                                fontFamily: "Pretendard",
                                fontSize: 24,
                                height: 28.8 / 24,
                                fontWeight: FontWeight.w300,
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 41,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xff621133).withOpacity(0.7),
                          border: Border.all(
                              width: 1, color: const Color(0xffFF016B))),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppImages.love,
                                width: 14,
                                height: 14,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            "${cardData.description}",
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 14.0,
                              height: 16.7 / 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFF006B),
                              letterSpacing: -0.6,
                            ),
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        cardData.tags.length,
                        (tagIndex) => Container(
                          height: 30,
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xff000000),
                              border: Border.all(
                                  width: 1, color: const Color(0xff212121))),
                          padding: const EdgeInsets.only(
                              top: 5, right: 7, bottom: 5, left: 7.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cardData.tags[tagIndex],
                                textAlign: TextAlign.center,
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
                    ),
                  ],
                ),
              ),
              const SizedBox(),
              Image.asset(
                AppImages.heart,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
        Container(
          width: 340,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
          ),
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
