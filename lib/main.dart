import 'package:flutter/material.dart';
import 'NQueens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NQueens',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NQueens Solution Count'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int N = 0;

  // Create new instance of nqueens
  NQueens nQueens = new NQueens();

  // UI of the application
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Enter the board size"),
              keyboardType: TextInputType.number,
              onChanged: (boardSize) {
                // convert the text input to integer
                int num = int.parse(boardSize);
                setState(() {
                  N = num;
                });
              },
            ),
            RaisedButton(
              child: Text("Calculate Number of Solutions"),
              onPressed: () {
                nQueens.enumerate(N);
                setState(() {
                  _counter = nQueens.solutionCount;
                });
              },
            ),
            Text(
              'Your chessboard has this number of unique solutions:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}
