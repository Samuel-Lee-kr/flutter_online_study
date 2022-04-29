import 'package:crow_insta_clone/src/components/avatar_widget.dart';
import 'package:crow_insta_clone/src/components/image_data.dart';
import 'package:crow_insta_clone/src/components/post_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(children: [
      AvatarWidget(
        thumbPath:
            'http://th3.tmon.kr/thumbs/image/246/52b/36b/d7b52f680_700x700_95_FIT.jpg',
        type: AvatarType.TYPE2,
        size: 70,
      ),
      Positioned(
        right: 5,
        bottom: 0,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: const Center(
            child: Text(
              "+",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          _myStory(),
          const SizedBox(width: 5),
          ...List.generate(
            100,
            (index) => AvatarWidget(
                thumbPath:
                    'https://www.ecaren.co.kr/wp-content/uploads/2022/01/0104_%EA%B0%80%EB%A5%B4%EC%8B%9C%EB%8B%88%EC%95%84_%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_01.jpg',
                type: AvatarType.TYPE1),
          )
        ],
      ),
    );
  }

  Widget _postList(){
    return Column(
      children: List.generate(50, (index) => const PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ImageData(
          icon: IconsPath.logo,
          width: 300,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              //
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ImageData(
                icon: IconsPath.directMessage,
                width: 65,
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
