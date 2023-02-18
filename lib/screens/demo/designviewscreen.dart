import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'formcontroller.dart';
import 'formscreen.dart';

class ViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing List View Data From second page to first page"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GetBuilder<FormController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.userList.length,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(controller.userList[index].cmt),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Episode5(),
                ),
              );
            },
            child: Text("Go to Form"),
          ),
        ],
      ),
    );
  }
}