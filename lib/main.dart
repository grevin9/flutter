import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Login(),
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
  bool isCheck = false;
  double opacity = 0.0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 26,
                  color: Colors.pink),
            ),
            isCheck == false ? Container() :Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Opacity(
              opacity: opacity,
              child: Text(
                'Hello World',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                _incrementCounter();
                setState(() {
                  opacity = 1.0;
                  isCheck = true;
                });
              },
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 34,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
