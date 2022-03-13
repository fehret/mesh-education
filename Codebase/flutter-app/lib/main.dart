import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool result = false;
  final List<double> _currentSliderValues = [
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0
  ];

  dynamic mapping;

  @override
  void initState() {
    super.initState();
    mapping = get_translation().then((value) {
      setState(() {
        mapping = value;
      });
    });
  }

  Future<dynamic> get_translation() async {
    final String response = await rootBundle.loadString('assets/studies.json');
    final data = await json.decode(response);
    return data;
  }

  Future<String> makeRequest(values) {
    String arg = "";
    for (var i = 0; i < 10; i++) {
      values[i] = values[i] / 10;
      arg = arg + "/" + values[i].toString();
    }
    Future<String> res = http
        .get(Uri.parse('https://hackathon.indorf-dev.de:80/infer' + arg))
        .then((value) {
      return value.body;
    });
    return res;
  }

  void _incrementCounter() {
    setState(() {
      result = !result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/check-mark.png",
          scale: 0.5,
        ),
        title: const Text("Studi-Check Interessenstest"),
      ),
      body: SingleChildScrollView(
        child: (result)
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Ergebnis: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: makeRequest(_currentSliderValues),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<String> snapshot,
                      ) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Text('Error');
                          } else if (snapshot.hasData) {
                            var decoded = json.decode(snapshot.data!);
                            int char = decoded['value'];
                            print(char);
                            print(mapping["" + char.toString()]);
                            var classes = mapping["" + char.toString()];
                            return Column(children: <Widget>[
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Container(
                                  height: 150,
                                  padding: EdgeInsets.all(16.0),
                                  child: DecoratedBox(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        classes['first'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25.0),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.amber),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 150,
                                  padding: EdgeInsets.all(16.0),
                                  child: DecoratedBox(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        classes['second'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25.0),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.green[200]),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 150,
                                  padding: EdgeInsets.all(16.0),
                                  child: DecoratedBox(
                                    child: Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                        classes['third'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 25.0),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        color: Colors.deepOrange),
                                  ),
                                ),
                              ),
                            ]);
                          } else {
                            return const Text('Empty data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      })
                ],
              ))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Findest du es interessant...",
                      style: TextStyle(fontSize: 22.0),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... ein eigenes Unternehmen zu gründen und dann auch zu führen?',
                    ),
                    Slider(
                      value: _currentSliderValues[0],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[0].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[0] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... Artikel und Beiträge für Medien (z.B. Zeitungen, Onlinemagazine, Radio etc.) zu verfassen?',
                    ),
                    Slider(
                      value: _currentSliderValues[1],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[1].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[1] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... rechtliche Fragestellungen zu bearbeiten?',
                    ),
                    Slider(
                      value: _currentSliderValues[2],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[2].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[2] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... Situationen und Abläufe systematisch zu beobachten und zu analysieren?',
                    ),
                    Slider(
                      value: _currentSliderValues[3],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[3].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[3] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... wissenschaftliche Experimente zu planen, durchzuführen und auszuwerten?',
                    ),
                    Slider(
                      value: _currentSliderValues[4],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[4].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[4] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... dich umfassend mit Kunst, Literatur oder Musik zu befassen?',
                    ),
                    Slider(
                      value: _currentSliderValues[5],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[5].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[5] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... Computernetzwerke einzurichten und zu betreuen?',
                    ),
                    Slider(
                      value: _currentSliderValues[6],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[6].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[6] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... Werbemittel (z.B. von Bildern, Anzeigen, Webseiten, Verpackungen etc.) grafisch zu gestalten?',
                    ),
                    Slider(
                      value: _currentSliderValues[7],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[7].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[7] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... handwerklich zu arbeiten?',
                    ),
                    Slider(
                      value: _currentSliderValues[8],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[8].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[8] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      '... Statistiken und Diagramme für verschiedene Geschäftsbereiche zu erstellen?',
                    ),
                    Slider(
                      value: _currentSliderValues[9],
                      max: 10,
                      divisions: 10,
                      label: _currentSliderValues[9].round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValues[9] = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: (result) ? "Zurück" : 'Absenden',
        child: (result) ? const Icon(Icons.arrow_back) : const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
