import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/main_controller.dart';
import 'package:pattern_getx/models/post_model.dart';

class MainPage extends StatefulWidget {
  static const String id = "/home_page";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<MainController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pattern Provider",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Obx(() => Stack(
            children: [
              ListView.builder(
                itemCount: Get.find<MainController>().items.length,
                itemBuilder: (context, index) {
                  return itemOfPost(Get.find<MainController>().items[index]);
                },
              ),
              if (Get.find<MainController>().isLoading())
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  Slidable itemOfPost(Post post) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // SlidableAction(
          //   onPressed: (BuildContext context) => Get.find<MainController>().apiUpdatePost(post),
          //   backgroundColor: const Color(0xFFFE6D49),
          //   foregroundColor: Colors.white,
          //   icon: Icons.edit,
          //   label: 'Edit',
          // ),
          SlidableAction(
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            onPressed: (BuildContext context) => Get.find<MainController>().apiPostDelete(post),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              post.body!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
