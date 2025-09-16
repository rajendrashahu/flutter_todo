import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:todo_app/second_page.dart';
import 'second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var data = ["Task1", "Task2", "Task3"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO App UI"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return SecondPage(addItem);
                  },
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () {
              addItem("Demo");
            },
            child: Text("Demo"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            for (int i = 0; i <= data.length - 1; i++) ...{TodoCard(data[i])},
          ],
        ),
      ),
    );
  }

  addItem(String item) {
    setState(() {
      data.add(item);
    });
  }
}

class TodoCard extends StatefulWidget {
  String title;
  String sub_title;
  TodoCard(this.title, {this.sub_title = ""});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  Color? cardColor;
  List<Color> colorList = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.blueGrey,
  ];
  @override
  void initState() {
    int index = Random().nextInt(colorList.length);
    cardColor = colorList[index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      padding: EdgeInsets.only(left: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [Text(widget.title), Text("Subtitle")]),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
