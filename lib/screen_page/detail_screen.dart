import 'package:flutter/material.dart';
import 'package:kamusfrench_indo/models/model_kata.dart';

class PageDetail extends StatelessWidget {
  final Datum? data;

  const PageDetail(this.data, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data!.kosakata, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        children: [
          ListTile(
            title: Text(data?.terjemahan ?? "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              data?.ket ?? "",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
