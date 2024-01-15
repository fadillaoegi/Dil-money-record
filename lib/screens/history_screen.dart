import 'package:dilrecord_money/widgets/history_card_widget.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              HistoryCard(),
              HistoryCard(),
              HistoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
