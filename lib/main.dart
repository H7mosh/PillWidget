import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pillwidget/BillWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true
      ),
      home:const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController controller = TextEditingController();
  int length=0;
  List<String>? strList =  <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:const Text("Bill Widget",style: TextStyle(color: Colors.white)),
        elevation: 1.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:20.0 , left: 25.0 ,right:25.0),
                child: TextFormField(
                  onFieldSubmitted: (text){
                    if (kDebugMode) {
                      length = text.split(",").length;
                      strList = text.split(",");
                    }
                  },
                  autofocus: true,
                  enableSuggestions: true,
                  showCursor: true,
                  controller: controller,
                  decoration:InputDecoration(
                    hintText: "Write Medicine",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 2.0,
                  runSpacing: 2.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: [
                    for(var i in strList!)
                      BillWidget(text: i,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


