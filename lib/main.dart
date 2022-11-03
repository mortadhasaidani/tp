import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _index = 0;
  var _icon = Icon(Icons.favorite_border);
  var _isFavorite = true;
  List<Widget> widgets = [Text("home selected"), Text("setting selected"), Text("profile selected")];
  void _change(int i) {
    setState(() {
      _index = i;
    });
  }

  void _changeIcon() {
    if(_isFavorite) {
      setState(() {
        _icon = Icon(Icons.favorite);
        _isFavorite = false;
      });
    } else {
      setState(() {
        _icon = Icon(Icons.favorite_border);
        _isFavorite = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: _changeIcon, icon: _icon)
        ],
      ),      bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'profile',
        ),
      ],
      onTap: _change,
    ),
      body: Center(
        child: widgets.elementAt(_index)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeIcon,
        child: _icon,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
