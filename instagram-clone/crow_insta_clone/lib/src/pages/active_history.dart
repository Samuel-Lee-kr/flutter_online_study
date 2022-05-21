import 'package:crow_insta_clone/src/components/avatar_widget.dart';
import 'package:flutter/material.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({Key? key}) : super(key: key);

  Widget _activeItemOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AvatarWidget(
            thumbPath: 'https://d2v80xjmx68n4w.cloudfront.net/gigs/JU2Lp1593392669.jpg',
            type: AvatarType.TYPE2,
            size: 40,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text.rich(
              TextSpan(
                text: '써누파파님',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '이 회원님의 게시물을 좋아합니다.좋아합니다.좋아합니다.좋아합니다.',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: ' 5 일전',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newRecentlyActiveView(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '활동',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _newRecentlyActiveView('오늘'),
            _newRecentlyActiveView('이번주'),
            _newRecentlyActiveView('이번달'),
          ],
        ),
      ),
    );
  }
}
