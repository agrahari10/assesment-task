import 'dart:convert';
import 'package:assesment_tesk/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var datalist;
  bool isLoaded = false;

  void initState() {
    super.initState();
    getrequest().then((value) {
      setState(() {
        datalist = value;
        isLoaded = true;
        print(value);
      });
    });
  }

  getrequest() async {
    var url = Uri.parse(
        "https://run.mocky.io/v3/d53400a3-6126-495e-9d16-0b4414b537b3");
    http.Response response = await http.get(url);
    var modifiedResponse = response.body.toString() + '}';
    print(modifiedResponse);
    if (response.statusCode == 200) {
      return json.decode(modifiedResponse);
    } else {
      print('Request failed :${response.statusCode}');
      return json.decode(response.body);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BooksApp'),
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: datalist['clients'].length,
              itemBuilder: (BuildContext context, int index) {
                var data = datalist['clients'][index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Details(
                          data: data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey[300],
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name'],
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data['company'],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
