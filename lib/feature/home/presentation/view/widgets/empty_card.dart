import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "추천 드릴 친구들을 준비 중이에요",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Color(0xffFCFCFC),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 31 / 24,
            letterSpacing: -0.6,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "매일 새로운 친구들을 소개시켜드려요",
            textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Pretendard',
            color: Color(0xffADADAD),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 24/ 16,
            letterSpacing: -0.6,
          ),
        )
      ],
    );
  }
}
