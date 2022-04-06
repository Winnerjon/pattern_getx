

import 'package:get/get.dart';
import 'package:pattern_getx/models/post_model.dart';
import 'package:pattern_getx/services/http_service.dart';


class MainController extends GetxController {
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async{
    isLoading.value = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null) {
      items.value = Network.parsePostList(response);
    }else{
      items.value = [];
    }

    isLoading.value = false;
  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading.value = true;

    var response = Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading.value = false;

    return response != null;
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