import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sales_lead/pages/dashboard.dart';
import 'dart:core';

import 'package:flutter_sales_lead/pages/leads.dart';
import 'package:flutter_sales_lead/pages/report.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidht = MediaQuery.of(context).size.width;

    final myAppBar =AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/bintaro-jaya-logo.png',
                fit: BoxFit.contain,
                height: mediaQueryWidht * 0.1,
              ),
              Container(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                ),
              )
            ],
          ),
        );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    int currentTab = 0;

    final List<Widget> screens = [
      LeadsPage(),
      DashboardPage(),
      ReportPage(),
    ];

    final PageStorageBucket bucket = PageStorageBucket();
    Widget currentScreen = screens[0];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: myAppBar ,
        drawer: MyDrawer(),
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            width: 100,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () => (setState(() {
                    currentScreen = LeadsPage();
                    currentTab = 0;
                  })),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.leaderboard,
                        color: currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Leads',
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () => (setState(() {
                    currentScreen = ReportPage();
                    currentTab = 1;
                    print(currentTab);
                  })),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.analytics,
                        color: currentTab == 1 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Report',
                        style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () => (setState(() {
                    currentScreen = LeadsPage();
                    currentTab = 2;
                  })),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 2 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // routes: {
      //   '/homepage': (context) => LeadsPage(),
      //   '/report': (context) => ReportPage(),
      //   '/dashboard': (context) => DashboardPage()
      // },
      theme: MyThemeData(),
    );
  }

  ThemeData MyThemeData() {
    return ThemeData(
        visualDensity: VisualDensity(horizontal: 4, vertical: 0),
        primarySwatch: Colors.amber,
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(color: Colors.white)),
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black54)));
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
              ),
              contentPadding: EdgeInsets.all(10),
              title: Text("MY PROFILE"),
            ),
            Container(
              // height: 35,
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.home),
                title: Align(
                  alignment: Alignment(-1.3, 0),
                  child: Text("Home"),
                ),
              ),
            ),
            Container(
              height: 35,
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.person),
                title: Align(
                  alignment: Alignment(-1.3, 0),
                  child: Text("Profile"),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
