import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Baru"),
      ),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: const Center(
            child: Text("Masih Dalam Pengemban HEHEH"),
          )),
    );
  }
}
