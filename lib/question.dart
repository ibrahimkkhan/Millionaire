import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Question extends StatefulWidget {
  final String question;
  final Map<String, double> answers;
  final bool complete;
  // final Total total;
  final PageController controller;
  Question(this.question, this.answers, this.complete, this.controller);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.01, left: 0.01),
            child: Center(
              child: Text(
                widget.question,
                style: GoogleFonts.raleway(
                    color: Color.fromRGBO(175, 163, 129, 1.0),
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,

              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              for (String answer in widget.answers.keys)
                Padding(
                  padding: EdgeInsets.only(top: width * 0.025),
                  child: SizedBox(
                    height: height * 0.05,
                    child: RaisedButton(
                      hoverColor: Colors.white,
                      color: Color.fromRGBO(175, 163, 129, 1.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(answer,
                            style: GoogleFonts.raleway(
                                fontSize: height * 0.035,
                                fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                
                      ),
                      onPressed: () {
                        widget.controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                        Total.total += widget.answers[answer];
                        var bar = context.read<Total>();
                        bar.answered();

                        // Total.totalAnswered += 0.05263;
                      },
                    ),
                  ),
                ),
            ],
          ),
          //  Padding(
          //         padding: EdgeInsets.only(bottom:height * 0.05),
          //         child: LinearProgressIndicator(backgroundColor: Colors.white,
          //         value: Total.totalAnswered,
          //         valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(175, 163, 129, 1.0),),
          //         ),
          //       ),
        ],
      ),
    );
  }
}
