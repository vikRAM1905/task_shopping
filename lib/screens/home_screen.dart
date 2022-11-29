import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.menu, color: Colors.white),
          )
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ))
            : Container(
                color: Colors.orangeAccent.withOpacity(0.1),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      tabMenu(context),
                      tabView(context),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget tabMenu(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, bottom: 5, left: 10, right: 10),
            child: CupertinoSlidingSegmentedControl(
                padding: EdgeInsets.all(6),
                children: <int, Widget>{
                  0: Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 10, top: 15, bottom: 15),
                    child: Text(
                      "Men's Fashion",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: controller.tabPosition.value == 0
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 16,
                          fontWeight: controller.tabPosition.value == 0
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                  1: Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 10, top: 15, bottom: 15),
                    child: Text(
                      "Women's Fashion",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: controller.tabPosition.value == 1
                              ? Colors.black
                              : Colors.grey,
                          fontSize: 16,
                          fontWeight: controller.tabPosition.value == 1
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                },
                groupValue: controller.tabPosition.toInt(),
                onValueChanged: (val) {
                  controller.updatetabPosition(int.parse(val.toString()));
                })));
  }

  Widget tabView(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => controller.tabPosition.value == 0
          ? Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: GridView.count(
                        mainAxisSpacing: 10, crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // ignore: sort_child_properties_last
                        children: [
                          for (int i = 0;
                              i < controller.productList.length;
                              i++)
                            Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                height: 200,
                                width: 150,
                                child: Column(children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                          i % 4 == 0
                                              ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJSvBZs4mRhVn7FB0xbi1yD1DB4Hhfs_zsqw&usqp=CAU"
                                              : i % 3 == 0
                                                  ? "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/11/Tshirt-design.jpg?auto=format&q=60&fit=max&w=930"
                                                  : i % 2 == 0
                                                      ? "https://media.istockphoto.com/id/1425659954/photo/lifestyle-and-luxury-businessman-fashion-model-in-studio-photoshoot-for-wealthy-and-rich.jpg?b=1&s=170667a&w=0&k=20&c=279yVUji5fkmxDm6pACStKqDk0DEn7FZB_iJQqumeIw="
                                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYdKkIrZV1VvIfjkQLoaFWqzZ4wGku3I4CpA&usqp=CAU",
                                          height: 130,
                                          width: 190,
                                          fit: BoxFit.fill),
                                      Positioned(
                                          left: 5,
                                          top: 5,
                                          child: Icon(Icons.favorite,
                                              color: Colors.grey))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        Text('\u{20B9}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24)),
                                        Text(
                                            controller.productList[i].price
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Text(controller.productList[i].title!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14))
                                ]))
                        ],
                        crossAxisCount: 2,
                      ),
                    ),
                    Text(controller.productList[0].title!,
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ))
          : Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: GridView.count(
                        mainAxisSpacing: 10, crossAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        // ignore: sort_child_properties_last
                        children: [
                          for (int i = 0;
                              i < controller.productList.length;
                              i++)
                            Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                height: 200,
                                width: 150,
                                child: Column(children: [
                                  Image.network(
                                      i % 4 == 0
                                          ? "https://thumbs.dreamstime.com/z/fashion-pretty-cool-young-girl-shopping-bags-wearing-black-hat-white-pants-over-colorful-orange-background-79063329.jpg"
                                          : i % 3 == 0
                                              ? "https://i.insider.com/5e725891c485400ed151c015?width=600&format=jpeg&auto=webp"
                                              : i % 2 == 0
                                                  ? "https://images.pexels.com/photos/428338/pexels-photo-428338.jpeg?cs=srgb&dl=pexels-spencer-selover-428338.jpg&fm=jpg"
                                                  : "https://navbharattimes.indiatimes.com/thumb/msid-88389153,imgsize-167770,width-540,height-405,resizemode-75/womens-clothingwomen-kurtis-88389153.jpg",
                                      height: 130,
                                      width: 190,
                                      fit: BoxFit.fill),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        Text('\u{20B9}',
                                            style: const TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24)),
                                        Text(
                                            controller.productList[i].price
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Text(controller.productList[i].title!,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14))
                                ]))
                        ],
                        crossAxisCount: 2,
                      ),
                    ),
                    Text(controller.productList[0].title!,
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
    );
  }
}
