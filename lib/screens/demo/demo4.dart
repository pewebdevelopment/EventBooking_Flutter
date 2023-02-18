import 'dart:math';

import 'package:event/utils/common_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

import 'demo3.dart';
import 'designviewscreen.dart';
import 'formcontroller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transformable List View Example',
      home: ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  Matrix4 getScaleDownMatrix(TransformableListItem item) {
    /// final scale of child when the animation is completed
    const endScaleBound = 0.3;

    /// 0 when animation completed and [scale] == [endScaleBound]
    /// 1 when animation starts and [scale] == 1
    final animationProgress = item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      final scale = endScaleBound + ((1 - endScaleBound) * animationProgress);

      paintTransform
        ..translate(item.size.width / 2)
        ..scale(scale)
        ..translate(-item.size.width / 2);
    }

    return paintTransform;
  }

  Matrix4 getRotateMatrix(TransformableListItem item) {
    /// rotate item to 90 degrees
    const maxRotationTurnsInRadians = pi / 2.0;

    /// 0 when animation starts and [rotateAngle] == 0 degrees
    /// 1 when animation completed and [rotateAngle] == 90 degrees
    final animationProgress = 1 - item.visibleExtent / item.size.height;

    /// result matrix
    final paintTransform = Matrix4.identity();

    /// animate only if item is on edge
    if (item.position != TransformableListItemPosition.middle) {
      /// rotate to the left if even
      /// rotate to the right if odd
      final isEven = item.index?.isEven ?? false;

      /// To select corner of the rotation
      final FractionalOffset fractionalOffset;
      final int rotateDirection;

      switch (item.position) {
        case TransformableListItemPosition.topEdge:
          fractionalOffset = isEven
              ? FractionalOffset.bottomLeft
              : FractionalOffset.bottomRight;
          rotateDirection = isEven ? -1 : 1;
          break;
        case TransformableListItemPosition.middle:
          return paintTransform;
        case TransformableListItemPosition.bottomEdge:
          fractionalOffset =
          isEven ? FractionalOffset.topLeft : FractionalOffset.topRight;
          rotateDirection = isEven ? 1 : -1;
          break;
      }

      final rotateAngle = animationProgress * maxRotationTurnsInRadians;
      final translation = fractionalOffset.alongSize(item.size);

      paintTransform
        ..translate(translation.dx, translation.dy)
        ..rotateZ(rotateDirection * rotateAngle)
        ..translate(-translation.dx, -translation.dy);
    }

    return paintTransform;
  }

  Matrix4 getWheelMatrix(TransformableListItem item) {
    /// rotate item to 36 degrees
    const maxRotationTurnsInRadians = pi / 5.0;
    const minScale = 0.6;
    const maxScale = 1.0;

    /// perception of depth when the item rotates
    const depthFactor = 0.01;

    /// offset when [animationProgress] == 0
    final medianOffset = item.constraints.viewportMainAxisExtent / 2;
    final animationProgress =
        1 - item.offset.dy.clamp(0, double.infinity) / medianOffset;
    final scale = minScale + (maxScale - minScale) * animationProgress.abs();

    /// alignment of item
    final translationOffset = FractionalOffset.center.alongSize(item.size);
    final rotationMatrix = Matrix4.identity()
      ..setEntry(3, 2, depthFactor)
      ..rotateX(maxRotationTurnsInRadians * animationProgress)
      ..scale(scale);

    final result = Matrix4.identity()
      ..translate(translationOffset.dx, translationOffset.dy)
      ..multiply(rotationMatrix)
      ..translate(-translationOffset.dx, -translationOffset.dy);

    return result;
  }

  late final transformMatrices = {
    'Scale': getScaleDownMatrix,
    // 'Rotate': getRotateMatrix,
    // 'Wheel': getWheelMatrix,
  };

  late String currentMatrix = transformMatrices.entries.first.key;
  final form = GlobalKey<FormState>();
  static var _focusNode = new FocusNode();
  // finding same instance if initialized controller
  FormController formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          // SafeArea(
          //   minimum: const EdgeInsets.symmetric(vertical: 8),
          //   child: Text('hello'),
          //   // CupertinoSegmentedControl<String>(
          //   //   // children: {
          //   //   //   // for (final matrixTitle in transformMatrices.keys)
          //   //   //   //   matrixTitle: Padding(
          //   //   //   //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //   //   //   //     child:
          //   //   //   //     Text(matrixTitle),
          //   //   //   //   ),
          //   //   // },
          //   //   groupValue: currentMatrix,
          //   //   onValueChanged: (value) {
          //   //     setState(() {
          //   //       currentMatrix = value;
          //   //     });
          //   //   },
          //   // ),
          // ),
          // TransformableListView.builder(
          //   // getTransformMatrix: matrix,
          //   getTransformMatrix: getScaleDownMatrix,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 300,
          //       margin: const EdgeInsets.symmetric(
          //         horizontal: 16,
          //         vertical: 4,
          //       ),
          //       decoration: BoxDecoration(
          //         color: index.isEven ? Colors.grey : Colors.blueAccent,
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       alignment: Alignment.center,
          //       child: Text(index.toString()),
          //     );
          //   },
          //   itemCount: 30,
          // ),
          GetBuilder<FormController>(
          builder: (controller) =>Container(
            height: 200,
          // color: Colors.red,
          margin: EdgeInsets.only(top: 400),
          child: TransformableListView.builder(
              controller: formController.scrollController1,
              padding: EdgeInsets.zero,
              getTransformMatrix: getScaleDownMatrix,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.to(MyHomeDemo());
                  },

                  child: Container(


                    height: 48,
                    margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                    // margin: const EdgeInsets.symmetric(
                    //   horizontal: 16,
                    //   vertical: 5,
                    // ),
                    decoration: BoxDecoration(
                      color:index.isEven ?Colors.blue:index==controller.secondIndex?Colors.white:Colors.green,
                      // color: index.isEven ? Colors.grey : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child:  Text(controller.userList[index].cmt),
                    // child: Text(index.toString()),
                  ),
                );
              },
            itemCount: controller.userList.length,
              // itemCount: 30,
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 600),
            child: Form(
              key: form,
              child: Container(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: formController.nameController,
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
                                      ScrollController();
                                      form.currentState!.save();
                                      formController.addUserToList(
                                        formController.nameController.text,

                                      );

                                      formController.updateTabIndex(ind:formController.userList.length+1);
                                      print('length====${formController.userList.length + 1}');
                                      // formController.secondColor(ind:formController.userList.length --);
                                      // print('second color====${formController.userList.length --}');
                                      formController.thirdColor(ind:formController.userList.length -1);
                                      // print('first color====${formController.userList.length -1}');
                                      // print('first====${formController.userList.length + 1}');

                                    },
                                  ),
                                  // TextButton(
                                  //   child: Text("Update"),
                                  //   onPressed: () {
                                  //     form.currentState!.save();
                                  //     controller.updateForm();
                                  //   },
                                  // ),
                                ],
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.end,
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: <Widget>[
                              //     ElevatedButton(
                              //       child: Text("Save and Exit"),
                              //       onPressed: () {
                              //         form.currentState!.save();
                              //         controller.updateLanguageInformation();
                              //         Get.to(ViewScreen());// all this function does is print the list
                              //         // Navigator.pop(
                              //         //     context); // don't need to pass anything here
                              //       },
                              //     ),
                              //   ],
                              // ),
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
      ///-------------

      // body: Stack(
      //   children: [
      //     Container(
      //       height: 300,
      //       color: Colors.red,
      //       child: ListView.builder(
      //         scrollDirection: controller.scrollDirection,
      //         // controller: controller.controller,
      //         itemCount: controller.userList.length,
      //         itemBuilder: (context, index) => _getRow(index,controller.userList[index].name),
      //
      //             // Text(controller.userList[index].name)
      //       ),
      //
      //
      //       // ListView(
      //       //   scrollDirection: controller.scrollDirection,
      //       //   controller: controller.controller,
      //       //   children: controller.randomList.map<Widget>((data) {
      //       //     return Padding(
      //       //       padding: EdgeInsets.all(8),
      //       //       child: _getRow(data[0],
      //       //         80,
      //       //         // math.max(data[1].toDouble(),
      //       //         //     50.0)
      //       //       ),
      //       //     );
      //       //   }).toList(),
      //       // ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 600),
      //       child: Form(
      //         key: form,
      //         child: Container(
      //           child: Column(
      //             children: <Widget>[
      //               TextFormField(
      //                 controller: controller.nameController,
      //                 focusNode: _focusNode,
      //                 keyboardType: TextInputType.text,
      //                 autocorrect: false,
      //                 maxLines: 1,
      //                 validator: (value) {
      //                   if (value!.isEmpty) {
      //                     return 'This field is required';
      //                   }
      //                   return null;
      //                 },
      //                 decoration: InputDecoration(
      //                   labelText: 'Name',
      //                   hintText: 'Name',
      //                   labelStyle: new TextStyle(
      //                       decorationStyle: TextDecorationStyle.solid),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Column(
      //                 children: <Widget>[
      //                   Center(
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: <Widget>[
      //                         Row(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: <Widget>[
      //                             TextButton(
      //                               child: Text("Add"),
      //                               onPressed: () {
      //                                 ScrollController();
      //                                 form.currentState!.save();
      //                                 controller.addUserToList(
      //                                   controller.nameController.text,
      //
      //                                 );
      //                                 controller.nextCounter();
      //
      //                                 // controller.updateTabIndex(ind:controller.userList.length);
      //
      //                               },
      //                             ),
      //                             // TextButton(
      //                             //   child: Text("Update"),
      //                             //   onPressed: () {
      //                             //     form.currentState!.save();
      //                             //     controller.updateForm();
      //                             //   },
      //                             // ),
      //                           ],
      //                         ),
      //                         // Row(
      //                         //   crossAxisAlignment: CrossAxisAlignment.end,
      //                         //   mainAxisAlignment: MainAxisAlignment.end,
      //                         //   children: <Widget>[
      //                         //     ElevatedButton(
      //                         //       child: Text("Save and Exit"),
      //                         //       onPressed: () {
      //                         //         form.currentState!.save();
      //                         //         controller.updateLanguageInformation();
      //                         //         Get.to(ViewScreen());// all this function does is print the list
      //                         //         // Navigator.pop(
      //                         //         //     context); // don't need to pass anything here
      //                         //       },
      //                         //     ),
      //                         //   ],
      //                         // ),
      //                       ],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: controller.nextCounter,
      //   tooltip: 'Increment',
      //   child: Text(controller.counter.toString()),
      // ),
    );
  }

  Widget _getRow(int index,String data ) {
    return formController.wrapScrollTag(
        index: index,
        child: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.topCenter,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 4),
              borderRadius: BorderRadius.circular(12)),
          child: Text('index: $data, '),
        ))
    ;
  }


}