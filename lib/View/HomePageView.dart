import 'package:flutter/material.dart';
import 'package:memove_practice/View/MemoEditView.dart';
import 'package:memove_practice/Model/MemosModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  @override
  HomePageViewState createState() => HomePageViewState();
}

class HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: ElevatedButton(
          onPressed: () {
            //버튼 눌릴 때
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: CircleBorder(),
            fixedSize: Size.fromRadius(25),
          ),
          child: Text('목록'),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              //버튼 눌릴 때
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: CircleBorder(),
              fixedSize: Size.fromRadius(25),
            ),
            child: Text('기타'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MemosModel.cntMemo(),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 80,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        alignment: Alignment.center,
                        child: Text(MemosModel.getMemo(i).text.str),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MemoEditView();
                    },
                  ).then((value) {
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: CircleBorder(),
                  fixedSize: Size.fromRadius(25),
                ),
                child: Text('+'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}