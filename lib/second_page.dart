import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  Function onSubmit;
  SecondPage(this.onSubmit);
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var subTitleController = TextEditingController();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Form Page")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            TextField(
              controller: subTitleController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                onSubmit(
                  titleController.value.text,
                  subTitleController.value.text,
                );
                Navigator.of(context).pop();
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
