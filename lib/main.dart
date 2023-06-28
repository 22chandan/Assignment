import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, String>> athletes = [
    {
      'name': 'Abhishek',
      'level': 'Basic',
    },
    {
      'name': 'Tarun',
      'level': 'Intermediate',
    },
    {
      'name': 'Mohan',
      'level': 'Advanced',
    },
    {
      'name': 'Mohan',
      'level': 'Intermediate',
    },
    {
      'name': 'Raja',
      'level': 'Intermediate',
    },
    {
      'name': 'Raja',
      'level': 'Intermediate',
    },
    {
      'name': 'Raja',
      'level': 'Intermediate',
    },
    {
      'name': 'Raja',
      'level': 'Advanced',
    },
    {
      'name': 'Raja',
      'level': 'Advanced',
    },
    {
      'name': 'Raja',
      'level': 'Advanced',
    },
    {
      'name': 'Raja',
      'level': 'Basic',
    },
    {
      'name': 'Raja',
      'level': 'Basic',
    },
    {
      'name': 'Raja',
      'level': 'Basic',
    },
    {
      'name': 'Raja',
      'level': 'Basic',
    },
  ];

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _scrollPosition = _scrollController.position.pixels;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> levels = ['Basic', 'Intermediate', 'Advanced'];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("App Bar")),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: levels.map((level) {
                  return Column(
                    children: [
                      Container(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Text(
                          level,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.8,
                        width: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: athletes.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (athletes[index]['level'] == level) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(athletes[index]['name']!),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 14.0,
            child: LinearProgressIndicator(
              value:
                  _scrollPosition / _scrollController.position.maxScrollExtent,
              backgroundColor: Colors.grey,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
