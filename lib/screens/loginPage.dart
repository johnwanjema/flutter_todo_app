import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome Back',
              style: TextStyle(fontSize: 35),
            ),
            Text(
              'Sign In to continue Back',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'User Name',
              style: TextStyle(fontSize: 23,),
            ),
            TextField(
              decoration: InputDecoration(
                 hintText: 'John Wanjema'
              ),
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 23,),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Enter Password'
              ),
              style: TextStyle(
                  fontSize: 20
              ),

            ),
            
          ],
        ),
      ),
    );
  }
}
