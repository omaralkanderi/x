import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      theme: ThemeData(dialogTheme: DialogTheme(backgroundColor: Color.fromARGB(181, 255, 255, 255))),
      debugShowCheckedModeBanner: false,
      home: HomePage1(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
   HomePage({super.key,required this.player1,required this.player2});
 String player1;
    String player2;
  @override
  State<HomePage> createState() => _HomePageState(player1:player1, player2:player2);
}

class _HomePageState extends State<HomePage> {
 _HomePageState({required this.player1,required this.player2}) ;
    String player1;
    String player2;
  var myStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  bool oturn = true;
  List<String> displayxo = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  int oscore = 0;
  int xscore = 0;
  int filledboxes=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$player2",
                        style: myStyle,
                      ),
                      Text(
                        xscore.toString(),
                        style: myStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$player1",
                        style: myStyle,
                      ),
                      Text(
                        oscore.toString(),
                        style: myStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 116, 115, 115))),
                    child: Center(
                        child: Text(
                      displayxo[index],
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    )),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //     child: Container(
          //   color: Colors.amber,
          // )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oturn && displayxo[index] == "") {
        displayxo[index] = "o";
        filledboxes++;
      } else if (!oturn && displayxo[index] == "") {
        displayxo[index] = "x";
                filledboxes++;

      }
      oturn = !oturn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[2] == displayxo[0] &&
        displayxo[0] != "") {
      _check(displayxo[0]);
    }
    if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != "") {
      _check(displayxo[3]);
    }
    if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != "") {
      _check(displayxo[6]);
    }
    if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != "") {
      _check(displayxo[0]);
    }
    if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != "") {
      _check(displayxo[1]);
    }
    if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != "") {
      _check(displayxo[2]);
    }
    if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != "") {
      _check(displayxo[2]);
    }
    if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != "") {
      _check(displayxo[0]);
    }
    if(filledboxes==9){showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("draw"),
          actions: [
            ElevatedButton(
              
                onPressed: () {
                  _playagain();
                  Navigator.pop(context);
                  
                },
                child: Text("play again"))
          ],
        );
      },
    );

    }
  }

  void _check(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("winner is:$winner"),
          actions: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                onPressed: () {
                  _playagain();
                  Navigator.pop(context);
                },
                child: Text("play again"))
          ],
        );
      },
    );
    if (winner == "o") {
      oscore++;
    } else {
      xscore++;
    }
  }

  void _playagain() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = "";
      }
      oturn=true;
      filledboxes=0;
    });
  }
}

