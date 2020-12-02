import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppBar(
                elevation: 0,
                title: Text(
                  'Work List',
                  style: TextStyle(fontSize: 30),
                ),
                backgroundColor: Color(0xfff96060),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.short_text,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Container(
                height: 70,
                color: Color(0xfff96060),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Text('Today',style: TextStyle(
                              fontSize:10,
                              color: Colors.white
                          ),),
                        ) ,SizedBox(height: 10,),
                      Container(
                        height: 4,width: 120,color: Colors.white,
                      )
                      ],
                    ), Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Text('Monthly',style: TextStyle(
                              fontSize:10,
                              color: Colors.white
                          ),),
                        ) ,SizedBox(height: 10,),
                        Container(
                          height: 4,width: 120,color: Colors.white,
                        )
                      ],
                    )
                  ],
                ) ,
              )
            ],
          ),

        ],
      ),
    );
  }
}
