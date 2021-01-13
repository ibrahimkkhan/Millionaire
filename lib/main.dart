import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:millionaire/finalpage.dart';
import 'package:millionaire/progressbar.dart';
import 'package:millionaire/question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Total(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Millionaire Test',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "The Unicorn Startup"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController();

  bool start = false;
  List<String> question = [
    "Do you have a mentor?",
    "Do you keep up with current events?",
    "Do you smoke?",
    "Do you drink?",
    "What’s your relationship status?",
    "What age did you make your first profit?",
    "What are you most likely to do in your free time?",
    "What are you most likely to say?",
    "Which of the following would describe you best?",
    "Which of the following would describe you best?",
    "Which of the following would describe you best?",
    "Which of the following would describe you best?",
    "Which of the following would describe you best?",
    "If you were given \$500 right now, what are you most likely to do with it?",
    "Which of the following is your response to criticism?",
    "You are stuck on a Math problem. What are you most likely to do?",
    "What’s the biggest reason stopping you from starting a business?",
    "After you start your business, you consistently lose money. What are you most likely to do?",
    "Your business failed and you have to shut down your business. What follows?"
  ];
  Map<int, Map<String, double>> answers = {
    1: {"Yes": 3, "No": 1},
    2: {"Yes": 3, "No": 1},
    3: {"Yes": 0.5, "No": 0},
    4: {"Occasionally": 1.5, "Never": 0, "Everyday": 1},
    5: {"Committed": 2, "Single": 2, "Divorced": 0.5},
    6: {
      "< 8": 6,
      "9 - 12": 5,
      "13 - 17": 3.5,
      "17 - 22": 2.5,
      "22+": 1.5,
      "Never made a profit": 0
    },
    7: {
      "Reading/Researching": 4,
      "Socializing": 2,
      "Entertainment (Netflix/Youtube/Instagram)": 0
    },
    8: {
      "I ‘choose’ to be rich": 2,
      "I ‘want’ to be rich": 0,
      "I ‘wish’ to be rich": 0,
      "I ‘have’ to be rich": 2
    },
    9: {
      "I am a good student": 4,
      "I am an average student": 3,
      "I am a bad student": 2,
      "I am a terrible student": 1,
      "I am an Overachiever": 6
    },
    10: {
      "I don’t plan my day ahead of time": 1,
      "I plan my day but fail to follow through it": 2,
      "I plan my day and follow through most of it": 4,
      "I plan my day and follow it to the second": 7
    },
    11: {"Introvert": 1, "Extrovert": 3, "Depends on how I am feeling": 2},
    12: {
      "I know a lot of things": 2,
      "I know one thing and I am the best at it": 3,
      "I am confused about what I know": 0
    },
    13: {
      "Success is in my control": 3,
      "Success is in God’s control": 1.5,
      "Success only comes to those who are lucky": 0.5
    },
    14: {"Save": 2, "Spend": 0, "Invest": 4},
    15: {
      "Disagree and don’t think about it": 0,
      "Disagree but think about it later": 2,
      "Agree but don’t think about it later": 1,
      "Agree and think about it later": 4
    },
    16: {
      "Give Up": 0,
      "Search for the exact question online": 1,
      "Keep reworking the problem": 3,
      "Re-learn the study material and try again": 4
    },
    17: {
      "Don’t have an idea": 1,
      "Don’t know where to start": 1,
      "Don’t have the capital to start": 2,
      "Waiting for the perfect time": 0,
      "Already executed all my ideas": 4
    },
    18: {
      "Close the business because I don't want to keep losing money": 1.5,
      "Continue and hope for the best": 0,
      "Analyze the problems and make necessary changes": 3
    },
    19: {
      "Keep thinking about the business and why it failed": 0,
      "Execute the same business idea again and try not to repeat the old mistakes":
          1,
      "Move on to the next thing and not think about the failed business": 4,
      "Move on to the next thing and try not to repeat old mistakes": 3
    }
  };

  void _addQuestions() {
    setState(() {
      start = true;
    });
  }
  //  static Total total = Total();
// AFA381 (Gold)
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Image.asset("lib/assets/TUS_Logo.PNG"),
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
        textAlign: TextAlign.center,
            style: GoogleFonts.cinzel(
              color: Color.fromRGBO(175, 163, 129, 1.0),
              fontSize: height * 0.06,
            )),
      ),
      body: start == false
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Text(
                    "Welcome to the Millionaire Test",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cinzel(
                        color: Colors.white,
                        fontSize: height * 0.045,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: width * 0.25, right: width * 0.25),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        // text: "Welcome to the Millionaire Test",
                        // style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: height * 0.03,
                        //     fontFamily: "Cizel",
                        //     fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "This test uses looks at your habits and decisions and determines whether you have the spark to be a ",
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: height * 0.03,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "Millionaire. ",
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: height * 0.035,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Answer truthfully and you'll know!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        color: Color.fromRGBO(175, 163, 129, 1.0),
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.03),
                  ),
                  SizedBox(
                    height: height * 0.07,
                  ),
                  SizedBox(
                    height: height * 0.05,
                    width: width * 0.2,
                    child: RaisedButton(
                        hoverColor: Colors.white,
                        color: Color.fromRGBO(175, 163, 129, 1.0),
                        child: Text(
                          "Start",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.cinzel(
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: _addQuestions),
                  ),
                   SizedBox(
                    height: height * 0.07,
                  ),
                  
                ],
              ),
            )
          : Column(
            children: [
              FinalPage(Total.total)
              // Bar(),
              // Expanded(
              //   child: PageView.builder(
              //     itemBuilder: (context, index) => index < 19
              //         ? Column(children: [
              //               Question(question.elementAt(index),
              //               answers.values.elementAt(index), true, controller),
              //         ])
              //         : FinalPage(Total.total),
              //     controller: controller,
              //     itemCount: 20,
              //   ),
              // ),
             
            ],
                    
          ),
    );
  }
}

class Total extends ChangeNotifier{
  static double total = 30;
  // double get totalAnswered => 0;
  // set totalAnswered(double value) => value;
  double totalAnswered = 0;
  

  void answered(){
    print("In answered");
    totalAnswered += 0.05263;
    notifyListeners();
  }
}
