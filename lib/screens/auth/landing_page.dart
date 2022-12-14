import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/model/slider_model.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/button.dart';
import 'package:hms_16/screens/auth/login_page.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:hms_16/widget/navreplace_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

int activeIndex = 0;

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: adddata.length,
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                initialPage: 0,
              ),
              itemBuilder: (context, index, pageindex) => CardItem(
                  netimage: adddata[index].urlimage, deks: adddata[index].text),
            ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: adddata.length,
              effect: const ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              text: "Sign In",
              // margin: EdgeInsets.only(top: 15),
              onpressed: () {
                navReplaceTransition(context, const LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String netimage;
  final String deks;
  const CardItem({required this.netimage, required this.deks, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.amber,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(netimage), fit: BoxFit.fitHeight)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  deks,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: cBlackBase),
                )),
          ),
        ],
      ),
    );
  }
}
