import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<dynamic> posts = [];
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Load Data'),
          onPressed: () async {
            Dio dio = Dio();
            Response res =
            await dio.get('https://jsonplaceholder.typicode.com/posts');
            setState(() {
            posts = res.data;
            });
          },
        ),
        body: posts.isEmpty
            ? Center(
                child: Text('press the button to get load data'),
              )
            : Center(
                child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.pinkAccent),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(posts[index]['title']),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
