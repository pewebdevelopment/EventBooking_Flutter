// import 'dart:math';
//
// import 'package:bubble_chart/bubble_chart.dart';
// import 'package:flutter/material.dart';
//
//
//
// class BubblePage extends StatefulWidget {
//   const BubblePage({Key? key}) : super(key: key);
//
//   @override
//   _BubblePageState createState() => _BubblePageState();
// }
//
// class _BubblePageState extends State<BubblePage> {
//   List<BubbleNode> childNode = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _addNewNode();
//     // Timer.periodic(Duration(milliseconds: 500), (_) {
//     //   _addNewNode();
//     // });
//   }
//
//   _addNewNode() {
//     setState(() {
//       Random random = Random();
//       BubbleNode node = BubbleNode.leaf(
//         value: max(1, random.nextInt(10)),
//         options: BubbleOptions(
//           color: () {
//             Random random = Random();
//             return Colors.primaries[random.nextInt(Colors.primaries.length)];
//           }(),
//         ),
//       );
//       node.options?.onTap = () {
//         setState(() {
//           node.value += 1;
//           // childNode.remove(node);
//         });
//       };
//       childNode.add(node);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: BubbleChartLayout(
//           padding: 10,
//           children: [
//             BubbleNode.node(
//               padding: 15,
//               children: childNode,
//               options: BubbleOptions(color: Colors.black),
//             ),
//             BubbleNode.node(
//               padding: 15,
//               children: [
//                 BubbleNode.leaf(
//                   value: 5,
//                   options: BubbleOptions(
//                     color: () {
//                       Random random = Random();
//                       return Colors
//                           .primaries[random.nextInt(Colors.primaries.length)];
//                     }(),
//                   ),
//                 )
//               ],
//               options: BubbleOptions(color: Colors.black),
//             ),
//           ],
//           duration: Duration(milliseconds: 500),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Text("+"),
//         onPressed: () {
//           _addNewNode();
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class lanPage extends StatelessWidget {

  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];

  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('title'.tr),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr,style: TextStyle(fontSize: 15),),
            SizedBox(height: 10,),
            Text('message'.tr,style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Text('subscribe'.tr,style: TextStyle(fontSize: 20),),

            ElevatedButton(onPressed: (){
              buildLanguageDialog(context);
            }, child: Text('changelang'.tr)),
          ],
        )
    );
  }
}