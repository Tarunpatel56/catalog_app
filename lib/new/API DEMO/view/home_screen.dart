import 'package:catalog_app/new/API%20DEMO/api_service.dart';
import 'package:catalog_app/new/API%20DEMO/model/singlepostmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isReady = false;
  singlepostmodel singlePostModel = singlepostmodel();
  _getSinglePost() {
    isReady = true;
    ApiService()
        .getSinglePostModel()
        .then((value) {
          setState(() {
            singlePostModel = value!;
            isReady = false;
          });
        })
        .onError((error, stackTrace) {
          print(error);
          setState(() {
            isReady = false;
          });
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    _getSinglePost();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("flutter ")),
    body: isReady == true?
    Center(child: CircularProgressIndicator(),): 
    Column(children: [
      Text(singlePostModel.userId.toString()),
         Text(singlePostModel.title.toString()),
            Text(singlePostModel.body.toString())
          // Test(SinglePostModel.)
    ],)
    );
    
  }

  
}
