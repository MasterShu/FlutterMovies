import 'package:flutter/material.dart';
import 'package:flutter_movies/demo/demo.dart';
import 'counter/counterView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Flutter'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('计数器'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CounterView(title: 'Counter',))),
            ),
            ListTile(leading: Icon(Icons.movie), title: Text('影院')),
            ListTile(
              leading: Icon(Icons.present_to_all),
              title: Text('小李子'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Demo())),
            ),
          ],
        ),
      ),
    );
  }

}
