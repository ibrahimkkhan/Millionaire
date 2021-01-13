import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalPage extends StatelessWidget {
  final double total;
  const FinalPage(this.total);

  Widget result(double height, double width) {
    final double percentage = (total / 68.0) * 100;
    final String percentageAsString =
        percentage >= 100 ? "100" : percentage.toStringAsFixed(2);
    if (percentage.round() > 90 && percentage < 100) {
      return Text(
        "Hello Future Millionaire! According to your answers, you exhibit strengths that almost no people exhibit. You have habits of the Rich. Stastically speaking, you have $percentageAsString% chance of succeeding. You create your life and don't make excuses. You never give up and that's what will make you successful.",
        style: GoogleFonts.raleway(
          color: Colors.white,
          fontSize: height * 0.04
        ),
        textAlign: TextAlign.center,
      );
    } else if (percentage.round() > 80 && percentage < 90) {
      return 
          Text(
              "Hello Hustler! According to your answers, you exhibit strengths that most people don't. You have most habits of the Rich but you lack some skills. Stastically speaking, you have $percentageAsString% chance of succeeding. It's not the best but you are still ahead of most people. Hustle hard and you'll get there.",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: height * 0.04
              ));
    } else if (percentage.round() > 70 && percentage < 80) {
      return Text(
              "Hello Hustler! According to your answers, you exhibit some strengths which will help you get there. You have some habits of the Rich but you also lack some skills. Stastically speaking, you have $percentageAsString% chance of succeeding. It's not the best but you are still ahead of a lot of people. Plan your day ahead, spend your time judiciosuly and monitor your daily habits.",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.white, fontSize: height * 0.04));
    } else {
      return Text(
              "According to your answers, you exhibit some strengths which might help you get there. You have some habits of the Rich but you lack most skills that make the Rich stand out. Stastically speaking, you have $percentageAsString% chance of succeeding. Plan your day ahead, spend your time judiciosuly and monitor your daily habits. You must learn to replace your bad habits with good habits. You should be willing to learn and hustle until you don't get what you want. Best of luck!",
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                  color: Colors.white,fontSize: height * 0.04));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top:height * 0.15,left: width * 0.05, right:width * 0.05),
      child: Center(child: result(height, width),),
    );
  }
}
