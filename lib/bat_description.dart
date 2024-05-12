import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:x/heart.dart';
import 'package:x/map_text.dart';
import 'map_description.dart';

class bat_description extends StatelessWidget {
  String bat;
  String price;
  static List<String?> batcodeList = [];
  String image;
  String bat_code;
  final PageController pageController = PageController();
  List imagesList = ["image-front", "image-back", "image-side"];
  bat_description(
      {required this.bat,
      required this.price,
      required this.image,
      required this.bat_code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Description"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.replay_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: double.infinity,
          color: const Color.fromARGB(255, 235, 235, 235),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
            child: Column(
              // alignment: Alignment.topLeft,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  child: Container(
                    //width: double.infinity,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 300,
                                child: PageView.builder(
                                  controller: pageController,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Image.asset(
                                      Bat[bat_code][imagesList[index]],
                                      height: 250,
                                    );
                                  },
                                ),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(bat),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SmoothPageIndicator(
                                        controller: pageController,
                                        count: 3,
                                        effect: ExpandingDotsEffect(
                                            radius: 10, dotColor: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 50),
                                  HeartButton(
                                    onTap: () => bat_description.batcodeList
                                        .add(bat_code),
                                  ),
                                ],
                              )
                            ]),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  pageController.previousPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.linear);
                                },
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                              ),
                              IconButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_rounded)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  map_text[bat_code]!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
