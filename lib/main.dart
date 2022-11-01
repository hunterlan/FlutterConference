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
      title: 'Conferences',
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
      home: const Scaffold(
        body: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _login = '';
  String _password = '';

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }

    return null;
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      if (_login != 'admin' && _password != 'admin') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Auth failed'),
              backgroundColor: Colors.red,
          )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Conferences',
              style: TextStyle(
                fontFamily: 'Lato', fontSize: 48
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val) => setState(() => _login = val),
                    validator: (value) => validator(value),
                    decoration: const InputDecoration(
                        hintText: 'Put your login here'
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) => setState(() => _password = val),
                    validator: (value) => validator(value),
                    decoration: const InputDecoration(
                      hintText: 'Put your password here',
                    ),
                    obscureText: true,
                  )
                ],
              )
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: login, child: const Text('Sign in')),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: const Text(
                  'Made by Kostiantyn Sharykin',
                  style: TextStyle(
                    fontFamily: 'Lato', fontSize: 24)),
            )
          ],
        )
    );
  }
}
