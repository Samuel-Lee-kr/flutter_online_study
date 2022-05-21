import 'package:crow_insta_clone/src/components/avatar_widget.dart';
import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.black12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 15,
            right: 15,
            child: Column(
              children: [
                const SizedBox(height: 10),
                AvatarWidget(
                  thumbPath:
                      'https://post-phinf.pstatic.net/MjAxOTA3MjRfMjM2/MDAxNTYzOTMxODc4NjMy.MLX6Ec0qnAA9W4KRhaaU_RAY1QQD4NSAZLBiJX0nzeYg.7O1B1g8DnfoSZol5sU87Q_RpsVGw1CFvJPxUQVeUQzgg.JPEG/%ED%8F%AC%ED%86%A0%EC%83%B5_%EC%9C%A0%ED%8A%9C%EB%B8%8C_%EC%8D%B8%EB%84%A4%EC%9D%BC.jpg?type=w1200',
                  type: AvatarType.TYPE2,
                  size: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  userId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Follow'),
                )
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 14,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
