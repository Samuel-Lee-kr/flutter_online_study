import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter/src/components/image_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

import 'search/search_focus.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox=[[],[],[]];
  List<int> groupIndex = [0,0,0];

  @override
  void initState(){
    super.initState();
    
    for(var i=0; i<100; i++){
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if(gi!=1){
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }

      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }

    print(groupBox);
  }

  Widget _appBar(){
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
              onTap: (){
                // Get.to(SearchFocus());
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text('검색',style: TextStyle(fontSize: 15,color: Color(0xff838383)))
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.location_pin),
        )
      ],
    );
  }

  Widget _body(){
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: List.generate(groupBox.length,
                    (index) => Expanded(
                        child: Column(
                          children: List.generate(groupBox[index].length,
                                  (index2) => Container(
                                    height: Get.width * 0.33 * groupBox[index][index2],
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.primaries[
                                        Random().nextInt(Colors.primaries.length)]),
                                    child: CachedNetworkImage(imageUrl: 'https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/279610309_544409587040296_956818974553936827_n.jpg?stp=dst-jpg_e35&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=o5ZOAy-WUnUAX8wEgLe&tn=NDdIcst4ppbpxrYh&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MjgyODk3MjUwNzE3MDUxMjkxNg%3D%3D.2-ccb7-4&oh=00_AT-EX6z9K15ZM39Ruw5q-ZezcvEq7qD4rfT2NXeZYc3Tvw&oe=6276B5BE&_nc_sid=30a2ef', fit: BoxFit.cover,)
                                  )).toList()
                        )
                    ),).toList()
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 상태표시줄을 벗어나지 않도록 한다.
        child: Column(
          children: [
            _appBar(),
            Expanded(child: _body())
        ],),
      ),
    );
  }
}
