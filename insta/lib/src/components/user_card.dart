import 'package:flutter/material.dart';
import 'package:insta/src/components/avatar_widget.dart';

class UserCard extends StatelessWidget {
  final String userId;
  final String description;

  const UserCard({Key? key, required this.userId, required this.description}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.black12,
          )),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                AvatarWidget(
                  type: AvatarType.TYPE2,
                  thumbPath:
                      'https://cdn.shopify.com/app-store/listing_images/21d07b9a03ab6e538a053381def7b15d/icon/CJnzrtj0lu8CEAE=.jpg',
                  size: 80,
                ),
                Text(userId, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
                Text(description, style: const TextStyle(fontSize: 13), textAlign: TextAlign.center,),
                ElevatedButton(onPressed: () {}, child: const Text('Follow'))
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 5,
            child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.close, size: 14, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
