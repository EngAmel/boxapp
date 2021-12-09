import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int? size;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Box of Boxes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget box = Container(
  height: 50,
  width: 50,
  padding: EdgeInsets.all(5),
  margin: EdgeInsets.all(5),
  color: Colors.cyanAccent,
);
List<Widget>? row = [];
List<List<Widget>>? mybox = [];

class _MyHomePageState extends State<MyHomePage> {
  void _drowBOX() {
    row!.clear();
    mybox!.clear();
    size = 3;
    for (int i = 0; i < size!; i++) {
      for (int j = 0; j < size!; j++) {
        row!.add(box);
      }
      mybox!.add(<Widget>[]);
      for (int y = 0; y < size!; y++) {
        mybox![i].add(row![y]);
      }
      row!.clear();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Box of Box'),
        leading: IconButton(
          onPressed: _drowBOX,
          icon: const Icon(Icons.power_outlined),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            size != null ? Text('Box size $size') : Container(),
            mybox!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        child: Row(children: mybox![index]),
                      ),
                      itemCount: mybox!.length,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
