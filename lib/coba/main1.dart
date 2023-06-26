import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:core';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidht = MediaQuery.of(context).size.width;

    final myAppBar = AppBar(
      title: Text('sales lead'),
      centerTitle: true,
    );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
      home: Scaffold(
          appBar: myAppBar,
          body: MyHomePage(
              isLandscape: isLandscape,
              mediaQueryWidht: mediaQueryWidht,
              bodyHeight: bodyHeight)),
      theme: ThemeData(
          // brightness: Brightness.dark,
          visualDensity: VisualDensity(horizontal: 4, vertical: 0),
          primarySwatch: Colors.amber,
          primaryColor: Colors.red,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.black54,
              titleTextStyle: TextStyle(color: Colors.white)),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.red))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.isLandscape,
    required this.mediaQueryWidht,
    required this.bodyHeight,
  });

  final bool isLandscape;
  final double mediaQueryWidht;
  final double bodyHeight;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

DateTime dateNow = DateTime.now();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: (widget.isLandscape)
            ? Column(
                children: [
                  Container(
                    width: widget.mediaQueryWidht,
                    height: widget.bodyHeight * 0.5,
                    color: Colors.amber,
                  ),
                  Container(
                    height: widget.bodyHeight * 0.5,
                    padding: EdgeInsets.only(top: 30),
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text('halo'),
                          );
                        }),
                  )
                ],
              )
            : Column(
                children: [
                  Container(
                    width: widget.mediaQueryWidht,
                    height: widget.bodyHeight * 0.3,
                    color: Colors.amber,
                  ),
                  Container(
                    height: widget.bodyHeight * 0.1,
                    child: OutlinedButton(
                        onPressed: () => showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2030))
                            .then((value) => setState(() {
                                  // dateNow =  n;
                                })),
                        child: Text('Calender')),
                  ),
                  Container(
                    height: widget.bodyHeight * 0.2,
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              height: 100,
                              color: Colors.purple,
                              child: Text('Ini adalah row 1'),
                            )),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              height: 100,
                              color: Colors.green,
                              child: Text(dateNow.toString()),
                            )),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Container(
                              height: 100,
                              color: Colors.tealAccent,
                              child: Text('Ini adalah row 1'),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    height: widget.bodyHeight * 0.4,
                    padding: EdgeInsets.only(top: 30),
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(),
                            title: Text('halo'),
                          );
                        }),
                  )
                ],
              ));
  }
}
