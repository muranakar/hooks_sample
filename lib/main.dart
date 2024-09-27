// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'hooks_pages/use_state_page.dart';
import 'hooks_pages/use_effect_page.dart';
// その他のhooksページのインポート...

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hooks Samples',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HooksListPage(),
    );
  }
}

class HooksListPage extends HookWidget {
  final List<Map<String, dynamic>> hooksList = [
    {'name': 'useState', 'page': UseStatePage()},
    {'name': 'useEffect', 'page': UseEffectPage()},
    // その他のhooksを追加...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Hooks Samples')),
      body: ListView.builder(
        itemCount: hooksList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hooksList[index]['name']),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => hooksList[index]['page']),
            ),
          );
        },
      ),
    );
  }
}