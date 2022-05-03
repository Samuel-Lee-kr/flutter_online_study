import 'package:counter/src/components/image_data.dart';
import 'package:counter/src/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu(){
    return PreferredSize(
      child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))
          ),
          height: AppBar().preferredSize.height,
          width: Size.infinite.width,
          child: TabBar(
              controller: tabController,
              indicatorColor: Colors.black,
              tabs: [
                _tabMenuOne('인기'),
                _tabMenuOne('계정'),
                _tabMenuOne('오디오'),
                _tabMenuOne('태그'),
                _tabMenuOne('장소')
              ]
          )),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  Widget _body(){
    return TabBarView(
      controller: tabController,
      children: const [
        Center(child: Text('인기페이지'),),
        Center(child: Text('계정페이지'),),
        Center(child: Text('오디오페이지'),),
        Center(child: Text('태그페이지'),),
        Center(child: Text('장소페이지'),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: (){
              BottomNavController.to.willPopAction();
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: ImageData(
                IconsPath.backBtnIcon,
              ),
            ),
          ),
        titleSpacing: 0, //타이틀 마진 0으로
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef)
          ),
          child: const TextField(decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색',
            contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
            isDense: true,
          ),),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
