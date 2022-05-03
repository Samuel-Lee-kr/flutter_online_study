import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter/src/components/avatar_widget.dart';
import 'package:counter/src/components/image_data.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          AvatarWidget(
              type: AvatarType.TYPE3,
              nickname: '김태리',
              size: 40,
              thumbPath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr2fKlECiNFTvHS6ng6B6LbMUlqA1rwiuwZA&usqp=CAU'
          ),
          GestureDetector(
            onTap: (){

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageData(
                IconsPath.postMoreIcon,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Widget _image() {
    return CachedNetworkImage(imageUrl: 'https://scontent-ssn1-1.cdninstagram.com/v/t51.2885-15/279610309_544409587040296_956818974553936827_n.jpg?stp=dst-jpg_e35&_nc_ht=scontent-ssn1-1.cdninstagram.com&_nc_cat=104&_nc_ohc=o5ZOAy-WUnUAX8wEgLe&tn=NDdIcst4ppbpxrYh&edm=ALQROFkBAAAA&ccb=7-4&ig_cache_key=MjgyODk3MjUwNzE3MDUxMjkxNg%3D%3D.2-ccb7-4&oh=00_AT-EX6z9K15ZM39Ruw5q-ZezcvEq7qD4rfT2NXeZYc3Tvw&oe=6276B5BE&_nc_sid=30a2ef');
  }

  Widget _infoCount(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageData(IconsPath.likeOffIcon, width: 65,),
              const SizedBox(width: 15, ),
              ImageData(IconsPath.replyIcon, width: 60,),
              const SizedBox(width: 15, ),
              ImageData(IconsPath.directMessage, width: 55,),
            ],
          ),
          ImageData(IconsPath.bookMarkOffIcon, width: 55,),
        ],
      ),
    );
  }

  Widget _infoDescription(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('좋아요 150개', style: TextStyle(fontWeight: FontWeight.bold),),
          ExpandableText(
              '콘텐츠1입니다\n콘텐츠1입니다\n콘텐츠1입니다\n콘텐츠1입니다\n',
              prefixText: '김태리',
              onPrefixTap: (){
                print('김태리 페이지 이동');
              },
              prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
              expandText: '더보기',
              collapseText: '접기',
              maxLines: 3,
              expandOnTextTap: true,//...을 클릭해도 더보기 실행
              collapseOnTextTap: true,//...을 클릭해도 접기 실행
              linkColor: Colors.grey,//더보기 글자색 변경
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn(){
    return GestureDetector(onTap: (){},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text('댓글 199개 모두보기',style: TextStyle(color: Colors.grey, fontSize: 13),),
      ),
    );
  }

  Widget _dateAgo(){
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text('1일전',
          style: TextStyle(color: Colors.grey, fontSize: 13),
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
          const SizedBox(height: 15,),
          _image(),
          const SizedBox(height: 15,),
          _infoCount(),
          const SizedBox(height: 5,),
          _infoDescription(),
          const SizedBox(height: 5,),
          _replyTextBtn(),
          const SizedBox(height: 5,),
          _dateAgo()
        ],
      ),
    );
  }
}
