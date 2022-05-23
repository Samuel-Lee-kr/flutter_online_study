import 'package:counter/src/components/avatar_widget.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String userId;
  final String description;

  const UserCard({Key? key, required this.userId, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: 150,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12)),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            right: 15,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                AvatarWidget(
                  type: AvatarType.TYPE2,
                  thumbPath:
                      'https://striz0.com/data/item/1653200390/thumb-7IOB7IS41_400x400.jpg',
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userId,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                Text(
                  description,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(onPressed: () {}, child: Container(
                  width: 90,
                  child: const Text('Follow', textAlign: TextAlign.center,),
                ))
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 10,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.close,
                  size: 14,
                  color: Colors.grey,
                ),
              )),
        ],
      ),
    );
  }
}
