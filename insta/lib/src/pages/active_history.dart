import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insta/src/components/avatar_widget.dart';

class ActiveHistory extends StatelessWidget {
  const ActiveHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            '활동',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          )),
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

  Widget _newRecentlyActiveView(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 15,
          ),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
          _activeItemOne(),
        ],
      ),
    );
  }

  Widget _activeItemOne() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          AvatarWidget(
              type: AvatarType.TYPE2,
              size: 40,
              thumbPath:
                  'https://cdn.shopify.com/app-store/listing_images/21d07b9a03ab6e538a053381def7b15d/icon/CJnzrtj0lu8CEAE=.jpg'),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Text.rich(TextSpan(
                  text: 'samuel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  children: [
                TextSpan(
                  text: '님이 회원님의 게시물을 좋아합니다.',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: ' 5일 전',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13, color: Colors.black54),
                )
              ]))),
        ],
      ),
    );
  }
}
