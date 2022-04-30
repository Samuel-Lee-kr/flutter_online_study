import 'package:flutter/material.dart';
import 'package:insta/src/components/avatar_widget.dart';
import 'package:insta/src/components/image_data.dart';
import 'package:insta/src/components/post_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          type: AvatarType.TYPE2,
          thumbPath:
              'https://cdn.shopify.com/app-store/listing_images/21d07b9a03ab6e538a053381def7b15d/icon/CJnzrtj0lu8CEAE=.jpg',
          size: 70,
        ),
        Positioned(
            right: 10,
            bottom: 10,
            child: Container(
              width: 20,
              height: 25,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(color: Colors.white, width: 2)),
              child: const Center(
                child: Text(
                  '+',
                  style:
                      TextStyle(fontSize: 20, color: Colors.white, height: 1.1),
                ),
              ),
            ))
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(
          width: 20,
        ),
        _myStory(),
        const SizedBox(
          width: 5,
        ),
        ...List.generate(
            100,
            (index) => AvatarWidget(
                  type: AvatarType.TYPE1,
                  thumbPath:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/800px-Instagram_logo_2016.svg.png',
                )),
      ]),
    );
  }

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          IconsPath.logo,
          width: 270,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.directMessage,
                width: 50,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _storyBoardList(),
          _postList(),
        ],
      ),
    );
  }
}
