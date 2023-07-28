import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final textcon = TextEditingController();

  final textcon1 = TextEditingController();
  var myStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.grey[700],
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Colors.transparent,
        // backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("player O",style: myStyle,),
                      Container(decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 5)),
                        child: TextField(
                          controller: textcon,
                          decoration: InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text("player X",style: myStyle,),
                      Container(decoration:BoxDecoration(border: Border.all(color: Colors.black,width: 5) ,),
                        child: TextField(
                          controller: textcon1,
                          decoration: InputDecoration(border: OutlineInputBorder() ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 400,
              ),
            ],
          ),
          Expanded(
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 245, 89, 89),
                    side: BorderSide(
                        width: 4, color: const Color.fromARGB(255, 71, 66, 66)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      20,
                    ))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage(player1: textcon.text,player2: textcon1.text,);
                    },
                  ));
                },
                icon: Expanded(
                    child: Icon(
                  Icons.gamepad,
                  color: Colors.black,
                )),
                label: Text("Play",
                    style: TextStyle(fontSize: 40, color: Colors.black))),
          )
        ],
      ),
    );
  }
}
