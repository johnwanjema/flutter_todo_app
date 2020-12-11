import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class NewCheckList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir'
      ),
      home: newCheckList(),
    );
  }
}

class newCheckList extends StatefulWidget {
  @override
  _newCheckListState createState() => _newCheckListState();
}

class _newCheckListState extends State<newCheckList> {
  bool checked = false;
  List<int>  selectedList = [];
   @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: Text(
          'New Checklist',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: 30,
              color: Color(0xfff96060),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
                width: size.width,
                color: Colors.black.withOpacity(.8),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                color: Colors.white,
              ),
              width: size.width,
              height: size.height * .85,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Lorem ispium',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CheckboxListTile(
                              title: Text('List item 1'),controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value){
                                setState(() {
                                  if(value){
                                    selectedList.add(1);
                                  }else{
                                    selectedList.remove(1);
                                  }
                                });
                              },
                              value: selectedList.contains(1),
                            ),
                            CheckboxListTile(
                              title: Text('List item 2'),controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value){
                                setState(() {
                                  if(value){
                                    selectedList.add(2);
                                  }else{
                                    selectedList.remove(2);
                                  }
                                });
                              },
                              value: selectedList.contains(2),
                            ),
                            CheckboxListTile(
                              title: Text('List item 3'),controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (bool value){
                                setState(() {
                                  if(value){
                                    selectedList.add(3);
                                  }else{
                                    selectedList.remove(3);
                                  }
                                });
                              },
                              value: selectedList.contains(3),
                            ),
                            Text(
                              'Colour',
                              style: TextStyle(fontSize: 18),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                color: Color(0xfff96060),
                              ),
                              child: Center(
                                child: Text(
                                  'Add CheckList',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
