import 'package:flutter/material.dart';
import 'package:flutter_practice/src/features/home/model/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<HomeModel> allModelData;

  @override
  void initState() {
    super.initState();
    allModelData = HomeModel.fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: allModelData.length,
        itemBuilder: (BuildContext context, int index) {
          HomeModel homeModel = allModelData[index];
          return ElevatedButton(
            onPressed: () {
              _onButtonPress(homeModel.route);
            },
            child: Text(homeModel.title),
          );
        },
      ),
    );
  }

  void _onButtonPress(String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
