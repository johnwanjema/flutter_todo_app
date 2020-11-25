import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        primarySwatch: Colors.blue,
      ),
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    OnboardingPageState('onboard1', "Welcome to Task Manager"),
                    OnboardingPageState('onboard2', "Where work happens"),
                    OnboardingPageState('onboard3', "Tasks and Assignments"),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              ),
            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: 20000,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/path1.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: openLoginPage,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 100),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0,10),
                                blurRadius: 20,
                              spreadRadius: 3
                            )]
                          ),
                          child: Text(
                            'Get Started',style: TextStyle(
                            fontSize: 10
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Login',style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
              )
          ),
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(
        microseconds: 100,
      ),
      height: 10,
      width: (currentPage == index) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: (currentPage == index) ? Colors.black : Colors.grey,
      ),
    );
  }

  Column OnboardingPageState(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/$img.png'))),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: (Text(
            '$title',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          )),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: (Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          )),
        )
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value++;
    setState(() {});
  }

  openLoginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
  }
}
