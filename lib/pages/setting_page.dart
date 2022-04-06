import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/setting_controller.dart';

class SettingPage extends StatefulWidget {
  static const String id = "/home_page";

  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<SettingController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pattern Provider",style: TextStyle(fontSize: 20),),
      ),
      body: GetX<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context,index){
                  return Slidable(
                    endActionPane:  ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        // SlidableAction(
                        //   onPressed: (BuildContext context) => controller.a,
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
                          onPressed: (BuildContext context) => controller.apiPostDelete(controller.items[index]),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.items[index].title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          SizedBox(height: 10,),
                          Text(controller.items[index].body!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                        ],
                      ),
                    ),
                  );
                },
              ),

              if(controller.isLoading.value) const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add,size: 30,),
      ),
    );
  }
}