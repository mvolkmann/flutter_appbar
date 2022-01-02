import 'package:flutter/material.dart';
import 'about_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'widget_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Structure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The default text color of TextButton widgets in an AppBar is
    // ColorScheme.primary which is the same as the AppBar background color.
    // This makes them invisible.
    // The recommended color is ColorScheme.onPrimary.
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    final actions = <Widget>[
      TextButton(
        child: Text('Action #1'),
        onPressed: () => print('got action 1 press'),
        style: buttonStyle,
      ),
      TextButton(
        child: Text('Action #2'),
        onPressed: () => print('got action 2 press'),
        style: buttonStyle,
      ),
    ];

    final leading = TextButton(
      child: Text('Leading'),
      onPressed: () => print('got leading press'),
      style: buttonStyle,
    );

    final tabBar = TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(Icons.info), text: 'About'),
        Tab(icon: Icon(Icons.home), text: 'Home'),
        Tab(icon: Icon(Icons.settings), text: 'Settings'),
      ],
    );

    var appBar = AppBar(
      actions: actions,
      bottom: tabBar,
      centerTitle: true,
      //flexibleSpace: Text('This app demonstrates using a TabBar.'),
      leading: leading,
      title: Text('My Title'),
    );

    var scaffold = Scaffold(
        appBar: appBar,
        body: TabBarView(children: [
          AboutPage().center,
          HomePage().center,
          SettingsPage().center,
        ]));

    return DefaultTabController(child: scaffold, length: 3);
  }
}
