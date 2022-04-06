

import 'package:get/get.dart';
import 'package:pattern_getx/models/post_model.dart';
import 'package:pattern_getx/services/http_service.dart';


class HomeController extends GetxController {
  var isLoading = false.obs;
  var posts = [].obs;

  Future apiPostList() async {
    isLoading(true);

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null) {
      posts.value = Network.parsePostList(response);
    }else{
      posts.value = [];
    }

    isLoading(false);
  }

  void apiPostDelete(Post post) async {
    isLoading(true);

    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
  }

  // void _apiUpdatePost(Post post) async {
  //   var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => UpdatePage(post: post,)));
  //   if(result != null) {
  //   }
  // }
  //
  // void _apiCreatePost() async {
  //   var result = await Navigator.of(context).pushNamed(DetailPage.id);
  //   if (result != null && result == true) {
  //     _apiPostList();
  //   }
  // }
}