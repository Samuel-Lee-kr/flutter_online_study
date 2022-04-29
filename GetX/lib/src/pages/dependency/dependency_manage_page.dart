import 'package:counter/src/controller/dependency_controller.dart';
import 'package:counter/src/pages/dependency/get_lazyput.dart';
import 'package:counter/src/pages/dependency/get_put.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("의존성주입"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("GetPut"),
              onPressed: (){
                Get.to(
                    GetPut(),
                    binding: BindingsBuilder((){
                      Get.put(DependencyController());
                    })
                );
              }
            ),
            RaisedButton(
                child: Text("Get.lazyPut"),
                onPressed: (){
                  Get.to(
                      GetLazyPut(),
                      binding: BindingsBuilder((){
                        //컨트롤러에 접근할때 메모리에 올림
                        Get.lazyPut<DependencyController>(
                                () => DependencyController()
                        );
                      })
                  );
                }
            ),
            RaisedButton(
                child: Text("Get.putAsync"),
                onPressed: (){
                  Get.to(
                      GetPut(),
                      binding: BindingsBuilder((){
                        //비동기 식으로 데이터를 받아오거나 가공처리를 하고나서 컨트롤러를 인스턴스화 해야할때 필요함
                        Get.putAsync<DependencyController>(() async {
                          await Future.delayed(Duration(seconds: 5));
                          return DependencyController();
                        });
                      })
                  );
                }
            ),
            RaisedButton(
                child: Text("Get.create"),
                onPressed: (){
                  Get.to(
                      GetPut(),
                      binding: BindingsBuilder((){
                        //컨트롤러에 접근할때 메모리에 올리고 다른 인스턴스를 계속 생성이 가능함
                        Get.create<DependencyController>(
                                () => DependencyController()
                        );
                      })
                  );
                }
            )
          ],
        ),
      ),
    );
  }
}
