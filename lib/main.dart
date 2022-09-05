import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {

  List l = List.filled(9, "");
  int cnt = 0;
  int cheakwin = 0;
  String p1 = "X";
  String p2 = "O";
  String msg = "Game is Running....";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic_Tac_Toy"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      l = List.filled(9, "");
                      cnt=0;
                      cheakwin = 0;
                      msg="Game Is Running";
                      setState(() {});
                    },
                    child: Container(
                      color: Colors.yellowAccent,
                      margin: EdgeInsets.only(
                          left: 20, bottom: 10, top: 10, right: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "Reset",
                        style:
                            TextStyle(fontSize: 35, color: Colors.deepPurple),
                      ),
                    ),
                  )),
                  Expanded(child: Container()),
                  Expanded(
                    child: Container(
                      color: Colors.yellowAccent,
                      margin: EdgeInsets.only(
                          left: 30, bottom: 10, top: 10, right: 10),
                      alignment: Alignment.center,
                      child: Text(
                        msg,
                        style:
                            TextStyle(fontSize: 35, color: Colors.deepPurple),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(0), abc(1), abc(2)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(3), abc(4), abc(5)],
              )),
          Expanded(
              flex: 3,
              child: Row(
                children: [abc(6), abc(7), abc(8)],
              ))
        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(
        child: InkWell(
      onTap: cheakwin == 0
          ? () {
              if (l[i] == "") {
                if (cnt % 2 == 0) {
                  l[i] = p1;
                } else {
                  l[i] = p2;
                }
              }
              cnt++;
              win();
              setState(() {});
            }
          : null,
      child: Container(
        color: l[i] == ""
            ? Colors.brown
            : (l[i] == p1 ? Colors.deepPurple : Colors.greenAccent),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        child: Text(
          l[i],
          style: TextStyle(fontSize: 140, color: Colors.white),
        ),
      ),
    ));
  }

  win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1))
    {
      msg = "$p1 is Winner";
      cheakwin = 1;
    }
    else if ((l[0] == p2 && l[1] == p2 && l[2] == p2) ||
        (l[3] == p2 && l[4] == p2 && l[5] == p2) ||
        (l[6] == p2 && l[7] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[3] == p2 && l[6] == p2) ||
        (l[1] == p2 && l[4] == p2 && l[7] == p2) ||
        (l[2] == p2 && l[5] == p2 && l[8] == p2) ||
        (l[0] == p2 && l[4] == p2 && l[8] == p2) ||
        (l[2] == p2 && l[4] == p2 && l[6] == p2))
      {
        msg = "$p2 is Winner";
        cheakwin = 1;
      }
      else if (cnt > 8) {
      msg = "Draww.....";
    }
  }
}
