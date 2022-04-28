import 'package:cached_network_image/cached_network_image.dart';
import 'package:crow_insta_clone/src/components/avatar_widget.dart';
import 'package:crow_insta_clone/src/components/image_data.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
            nickName: '써누파파',
            size: 40,
            thumbPath:
                'https://t1.daumcdn.net/cfile/tistory/1638104351322B6C14',
            type: AvatarType.TYPE3,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                icon: IconsPath.postMoreIcon,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl:
          "https://www.ecaren.co.kr/wp-content/uploads/2022/01/0104_%ED%94%84%EB%A1%9C%EB%B0%94%EC%9D%B4%EC%98%A4%ED%8B%B1%EC%8A%A4_%EC%83%81%EC%84%B8%ED%8E%98%EC%9D%B4%EC%A7%80_01.jpg",
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(
                icon: IconsPath.likeOffIcon,
                width: 75,
              ),
              const SizedBox(width: 15),
              ImageData(
                icon: IconsPath.replyIcon,
                width: 70,
              ),
              const SizedBox(width: 15),
              ImageData(
                icon: IconsPath.directMessage,
                width: 65,
              ),
            ],
          ),
          ImageData(
            icon: IconsPath.bookMarkOffIcon,
            width: 60,
          )
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "좋아요 150개",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ExpandableText(
            "컨텐츠 1입니다.\n컨텐츠 1입니다. \n컨텐츠 1입니다. \n컨텐츠 1입니다.",
            prefixText: "써누파파",
            onPrefixTap: () {
              print("써누파파 페이지로 이동");
            },
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
            expandText: "더보기",
            collapseText: "접기",
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        "댓글 11개 모두 보기",
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Text(
        "1일전",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 11,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          const SizedBox(height: 15),
          _image(),
          const SizedBox(height: 15),
          _infoCount(),
          const SizedBox(height: 5),
          _infoDescription(),
          const SizedBox(height: 15),
          _replyTextBtn(),
          const SizedBox(height: 5),
          _dateAgo(),
        ],
      ),
    );
  }
}
