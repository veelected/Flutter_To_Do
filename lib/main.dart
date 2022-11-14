import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do App',
      home: const MyHomePage(title: 'Task Left:'),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          cardColor: Colors.blueGrey,
          textTheme: TextTheme()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int x = 0;
  int y = 1;
  String controlClear = '';

  List<String> autoFillVar = [
    'car',
    'vladimir',
    'batmobile',
    'An object in motion stays in motion'
  ];

  void _incrementCounter() {
    setState(() {
      print('incrementb' + _list.first);
    });
  }

  List<String> _list = ['Car','Vladimir','Batmobile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Task Manager"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
              child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Card(
                        color: Colors.blueGrey,
                        child: ListTile(
                          leading: Icon(
                            Icons.check_circle_outline_sharp,
                            size: 24,
                            color: Colors.white,
                          ),
                          title: (Text(
                            _list[index].toUpperCase(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                          onTap: () {
                            setState(() {
                              _list.removeAt(index);
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              _list.removeAt(index);
                            });
                          },
                        ));
                  }),
            ),
            flex: 3,
          ),
          Center(
            child: Flexible(
              child: Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.red,
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        icon: Icon(Icons.send,color: Colors.white,),
                        labelText: 'Enter Task Below:',
                        labelStyle: TextStyle(color: Colors.white,fontSize:24,),
                      ),
                      controller: TextEditingController(
                          text: (controlClear).toString()),
                      onSubmitted: (String newText) {
                        setState(() {
                          if (x <= -1) {
                            x++;
                            print(x);
                          }

                          if (newText.isNotEmpty) {
                            SemanticsService.announce(
                                '\$' + newText, Directionality.of(context));
                            _list.add(newText);
                            newText = '';
                            TextEditingController(text: controlClear);
                          }
                        });
                      })),
              flex: 1,
            ),
          ),
        ],
      ),
    );
  } //Widget
} //Class Wid
// get homepage
