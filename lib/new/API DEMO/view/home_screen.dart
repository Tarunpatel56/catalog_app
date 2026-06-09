import 'package:catalog_app/new/API%20DEMO/api_service.dart';
import 'package:catalog_app/new/API%20DEMO/model/singlepostmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  singlepostmodel singlePostModel = singlepostmodel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("flutter ")));
  }

  _getSinglePost() {
    ApiService().getSinglePostModel().then((value){

    })
  }
}
