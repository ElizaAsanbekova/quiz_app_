import 'package:flutter/material.dart';
import 'package:quiz_app_/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int correct = 0;
int incorrect = 0;
int index = 0;
List<question> comp = [
  question(suroo: 'Kyrgyzstanda 7 oblast bar?', joop: true),
  question(suroo: 'Naryn daryiasynda krokodilder zhashait?', joop: false),
  question(suroo: 'Burana Oshto zhaigashkan?', joop: false),
  question(suroo: 'KRde 7 mln kalk bar?', joop: true),
  question(suroo: 'Токтогул озунчобу?', joop: false),
  question(suroo: 'Акаев тунгуч президент?', joop: true),
];

class _HomePageState extends State<HomePage> {
  List<Widget> icons = [];

  basuu(bool wahldesNutzers) {
    if (wahldesNutzers == comp[index].joop) {
      icons.add(
        Icon(
          Icons.check,
          color: Colors.green,
          size: 50,
        ),
      );
      correct++;
    } else if (wahldesNutzers != comp[index].joop) {
      icons.add(
        Icon(
          Icons.cancel,
          color: Colors.red,
          size: 50,
        ),
      );
    }
    index = index + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text('Tapshyrma 7'),
        ),
      ),
      backgroundColor: Colors.black,
      body: index < comp.length
          ? Center(
              child: Column(
                children: [
                  Text(
                    '${comp[index].suroo}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        basuu(true);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                          child: Text(
                        'true',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        basuu(false);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Center(
                          child: Text(
                        'false',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                      decoration: BoxDecoration(color: Colors.red),
                    ),
                  ),
                  Row(
                    children: icons,
                  )
                ],
              ),
            )
          : Center(
              child: Column(
                children: [
                  Text(
                    "Keine mehr Fragen",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Row(
                    children: icons,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (index == comp.length) {
                          index = 0;
                          icons = [];
                          correct = 0;
                        }

                        print('basyldy');
                      });
                    },
                    child: Text(
                      "restart",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Text(
                    "${comp.length}/$correct",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Column(
                    children: [
                      if (correct <= 2)
                        Image.asset('assets/images/crazy.jpg')
                      else if (correct < comp.length)
                        Image.asset('assets/images/3.jpg')
                      else if (correct == comp.length)
                        Image.asset('assets/images/great.jpeg')
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
