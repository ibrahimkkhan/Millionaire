import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Bar extends StatefulWidget {
  Bar({Key key}) : super(key: key);

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    var total = context.watch<Total>();
 
    print("In here");
        return LinearProgressIndicator(
          backgroundColor: Colors.white,
          value: total.totalAnswered,
          valueColor: AlwaysStoppedAnimation<Color>(
            Color.fromRGBO(175, 163, 129, 1.0),
          ),
        );
     
  }
}
