import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'File read and write'),
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
  String filecontents = "no Data";

  final mycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                hintText: "Enter Text to Write",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RaisedButton(
                child: Text("Write Data",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: Colors.lightGreen,
                onPressed: () {
                  FileUtils.saveToFile(mycontroller.text);
                },
              ),
            ),
            RaisedButton(
                child: Text("Read Data",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                color: Colors.lightGreen,
                onPressed: () {
                  FileUtils.readFromFile().then((contents) {
                    setState(() {
                      filecontents = contents;
                    });
                  });
                }),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blue,
                  child: Text(
                    filecontents,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
