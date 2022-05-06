import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crow_insta_clone/src/pages/search/search_focus.dart';
import 'package:quiver/iterables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i = i + 1) {
      var greedIndex = groupIndex.indexOf(min<int>(groupIndex)!);
      var sizeBox = 1;

      if (greedIndex != 1) {
        sizeBox = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[greedIndex].add(sizeBox);
      groupIndex[greedIndex] += sizeBox;
    }
  }

  Widget _appbar() {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Get.to(()=>SearchFocus());
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFocus()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 15),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xffefefef),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    Text(
                      "검색",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff838383),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.location_pin),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'http://th3.tmon.kr/thumbs/image/246/52b/36b/d7b52f680_700x700_95_FIT.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appbar(),
          Expanded(child: _body()),
        ],
      ),
    );
  }
}
