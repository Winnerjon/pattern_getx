import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  static const String id = "/home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pattern Provider",style: TextStyle(fontSize: 20),),
      ),
      body: Obx(
          () => Stack(
            children: [
              ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (context,index){
                  return Slidable(
                    endActionPane:  ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (BuildContext context) {},
                          backgroundColor: const Color(0xFFFE6D49),
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          label: 'Edit',
                        ),
                        SlidableAction(
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (BuildContext context) => controller.apiPostDelete(controller.posts[index]),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.posts[index].title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text(controller.posts[index].body!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  );
                },
              ),

              if(controller.isLoading()) const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add,size: 30,),
      ),
    );
  }
}