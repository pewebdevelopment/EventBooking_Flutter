import 'package:event/screens/demo/designviewscreen.dart';
import 'package:event/utils/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/liveController/live_controller.dart';
import 'formcontroller.dart';

class Episode5 extends StatefulWidget {
  @override
  _Episode5State createState() => _Episode5State();
}

class _Episode5State extends State<Episode5> {
  final form = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  // finding same instance if initialized controller
  FormController controller = Get.put(FormController());
  @override
  Widget build(BuildContext context) {



    // Widget bodyData() => DataTable(
    //   onSelectAll: (b) {},
    //   sortColumnIndex: 0,
    //   sortAscending: true,
    //   columns: <DataColumn>[
    //     DataColumn(label: Text("Name"), tooltip: "To Display name"),
    //     DataColumn(label: Text("Update"), tooltip: "Update data"),
    //   ],
    //   rows: controller.userList // accessing list from Getx controller
    //       .map(
    //         (user) => DataRow(
    //       cells: [
    //         DataCell(
    //           Text(user.name),
    //         ),
    //
    //         DataCell(
    //           IconButton(
    //             onPressed: () {
    //               controller.currentIndex =
    //                   controller.userList.indexOf(user);
    //               controller.updateTextControllers(user);
    //             },
    //             icon: Icon(
    //               Icons.edit,
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   )
    //       .toList(),
    // );
    Widget bodyData() => Column(
      children: <Widget>[
        Container(
          height: 100,
          child: GetBuilder<FormController>(
            builder: (controller) => ListView.builder(
              itemCount: controller.userList.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text(user.name),
                  Text(controller.userList[index].cmt),

                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => Episode5(),
        //       ),
        //     );
        //   },
        //   child: Text("Go to Form"),
        // ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Data add to List Table using Form"),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            // GetBuilder rebuilds when update() is called
            GetBuilder<FormController>(
              builder: (controller) => bodyData(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200),
              child: Form(
                key: form,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: controller.nameController,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        maxLines: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Name',
                          labelStyle: new TextStyle(
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: <Widget>[
                          Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text("Add"),
                                      onPressed: () {
                                        form.currentState!.save();
                                        controller.addUserToList(
                                          controller.nameController.text,

                                        );
                                      },
                                    ),
                                    TextButton(
                                      child: Text("Update"),
                                      onPressed: () {
                                        form.currentState!.save();
                                        controller.updateForm();
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    ElevatedButton(
                                      child: Text("Save and Exit"),
                                      onPressed: () {
                                        form.currentState!.save();
                                        controller.updateLanguageInformation();
                                        Get.to(ViewScreen());// all this function does is print the list
                                        // Navigator.pop(
                                        //     context); // don't need to pass anything here
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}