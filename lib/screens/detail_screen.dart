import 'package:dilrecord_money/themes/colors.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 200.0,
        // leading: Text("29 Jun 2022"),
        title: const Text("29 Jun 2022"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_downward,
                color: ColorApps.green,
                size: 30.0,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(20.0),
        child: const Column(
          children: [],
        ),
      ),
    );
  }
}
