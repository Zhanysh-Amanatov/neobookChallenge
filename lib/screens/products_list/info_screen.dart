import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Инфо'),
        // flexibleSpace: Container(
        //   height: 300.h,
        //   child: Image.asset(
        //     'assets/images/info.png',
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
      body: Column(children: [
        Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/info.png'))),
          // child: Image.asset(
          // 'assets/images/info.png',
          // width: double.infinity,
          // fit: BoxFit.cover,
          // ),
        ),
      ]),
    );
  }
}
