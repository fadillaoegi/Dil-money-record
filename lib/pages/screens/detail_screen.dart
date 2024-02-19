import 'package:dilrecord_money/themes/colors.dart';
import 'package:dilrecord_money/themes/fonts.dart';
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
        margin: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total",
              style: primary2700.copyWith(fontSize: 20.0),
            ),
            Text(
              "Rp.300.000, 00",
              style: primary2700.copyWith(fontSize: 30.0),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                endIndent: 140.0,
                indent: 140.0,
                color: ColorApps.primary2,
                thickness: 8.0,
              ),
            ),
            const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListDetailInOut(),
                  ListDetailInOut(),
                  ListDetailInOut(),
                  ListDetailInOut(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListDetailInOut extends StatelessWidget {
  const ListDetailInOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "1. ",
                style: black400.copyWith(fontSize: 20.0),
              ),
              Text(
                "Permen",
                style: black400.copyWith(fontSize: 20.0),
              ),
            ],
          ),
          Text(
            "Rp.4.000.000",
            style: black400.copyWith(fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
