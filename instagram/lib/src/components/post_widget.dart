import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter/src/components/avatar_widget.dart';
import 'package:counter/src/components/image_data.dart';
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
    return CachedNetworkImage(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr2fKlECiNFTvHS6ng6B6LbMUlqA1rwiuwZA&usqp=CAU');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _header(),
          const SizedBox(height: 15,),
          _image(),
          // _infoCount(),
          // _infoDescription(),
          // _replyTextBtn(),
          // _dateAgo()
        ],
      ),
    );
  }
}
