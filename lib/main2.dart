// //state management
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // import './screens/products_overview_screen.dart';
// // import './screens/product_detail_screen.dart';
// // import './providers/allProducts.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => AllProducts(),
// //       child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         title: 'MyShop',
// //         theme: ThemeData(
// //           primarySwatch: Colors.indigo,
// //           secondaryHeaderColor: Colors.amber,
// //           fontFamily: 'Lato',
// //         ),
// //         home: ProductsOverviewScreen() ,
// //         routes: {
// //           ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
// //         },
// //       ),
// //     );
// //   }
// // }


// // true project
// import 'package:flutter/material.dart';
// import 'package:flutter_sales_lead/pages/dashboard.dart';
// import 'package:flutter_sales_lead/pages/leads.dart';
// import 'package:flutter_sales_lead/pages/report.dart';
// import 'dart:core';
// import 'package:flutter/services.dart';
// import 'package:flutter_sales_lead/widgets/drawer.dart';
// import 'package:flutter_sales_lead/widgets/theme.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//       theme: MyThemeData(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final List<Widget> pages = const <Widget>[
//     LeadsPage(),
//     ReportPage(),
//     DashboardPage()
//   ];
//   int currentTab = 0;
//   final PageStorageBucket _bucket = PageStorageBucket();
//   @override
//   Widget build(BuildContext context) {
//     final mediaQueryHeight = MediaQuery.of(context).size.height;
//     final mediaQueryWidht = MediaQuery.of(context).size.width;

//     final myAppBar = AppBar(
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Image.asset(
//             'assets/images/bintaro-jaya-logo.png',
//             fit: BoxFit.contain,
//             height: mediaQueryWidht * 0.1,
//           ),
//           Container(
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(
//                   "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
//             ),
//           )
//         ],
//       ),
//     );

//     final bodyHeight = mediaQueryHeight -
//         myAppBar.preferredSize.height -
//         MediaQuery.of(context).padding.top;

//     return Scaffold(
//       appBar: myAppBar,
//       drawer: MyDrawer(),
//       body: PageStorage(
//         bucket: _bucket,
//         child: pages[currentTab],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentTab,
//         onTap: (int index) {
//           setState(() {
//             currentTab = index;
//           });
//         },
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.leaderboard),
//             label: 'Leads',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.analytics),
//             label: 'Report',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Dashboard',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class ColorBoxPage extends StatelessWidget {
// //   const ColorBoxPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemExtent: 250.0,
// //       itemBuilder: (BuildContext context, int index) => Container(
// //         padding: const EdgeInsets.all(10.0),
// //         child: Material(
// //           color: index.isEven ? Colors.cyan : Colors.deepOrange,
// //           child: Center(
// //             child: Text(index.toString()),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }





// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_sales_lead/pages/dashboard.dart';
// // import 'dart:core';

// // import 'package:flutter_sales_lead/pages/leads.dart';
// // import 'package:flutter_sales_lead/pages/report.dart';


// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
// //   runApp(MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //    final List<Widget> screens = [
// //       LeadsPage(),
// //       DashboardPage(),
// //       ReportPage(),
// //     ];
// //   @override
// //   Widget build(BuildContext context) {
// //     final mediaQueryHeight = MediaQuery.of(context).size.height;
// //     final mediaQueryWidht = MediaQuery.of(context).size.width;
 

// //     final myAppBar =AppBar(
// //           title: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Image.asset(
// //                 'assets/images/bintaro-jaya-logo.png',
// //                 fit: BoxFit.contain,
// //                 height: mediaQueryWidht * 0.1,
// //               ),
// //               Container(
// //                 child: CircleAvatar(
// //                   backgroundImage: NetworkImage(
// //                       "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
// //                 ),
// //               )
// //             ],
// //           ),
// //         );

// //     final bodyHeight = mediaQueryHeight -
// //         myAppBar.preferredSize.height -
// //         MediaQuery.of(context).padding.top;
// //     int currentTab = 0;

    

// //     final PageStorageBucket bucket = PageStorageBucket();
// //     Widget currentScreen = screens[0];

// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: myAppBar ,
// //         drawer: MyDrawer(),
// //         body: PageStorage(
// //           bucket: bucket,
// //           child: currentScreen,
// //         ),
// //         bottomNavigationBar: BottomAppBar(
// //           shape: CircularNotchedRectangle(),
// //           notchMargin: 10,
// //           child: Container(
// //             width: 100,
// //             height: 60,
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               crossAxisAlignment: CrossAxisAlignment.center,
// //               children: [
// //                 MaterialButton(
// //                   onPressed: () => (setState(() {
// //                     currentScreen = LeadsPage();
// //                     currentTab = 0;
// //                   })),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(
// //                         Icons.leaderboard,
// //                         color: currentTab == 0 ? Colors.blue : Colors.grey,
// //                       ),
// //                       Text(
// //                         'Leads',
// //                         style: TextStyle(
// //                             color: currentTab == 0 ? Colors.blue : Colors.grey),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 MaterialButton(
// //                   onPressed: () => (setState(() {
// //                     currentScreen = ReportPage();
// //                     currentTab = 1;
// //                     print(currentTab);
// //                   })),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(
// //                         Icons.analytics,
// //                         color: currentTab == 1 ? Colors.blue : Colors.grey,
// //                       ),
// //                       Text(
// //                         'Report',
// //                         style: TextStyle(
// //                             color: currentTab == 1 ? Colors.blue : Colors.grey),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 MaterialButton(
// //                   onPressed: () => (setState(() {
// //                     currentScreen = LeadsPage();
// //                     currentTab = 2;
// //                   })),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(
// //                         Icons.home,
// //                         color: currentTab == 2 ? Colors.blue : Colors.grey,
// //                       ),
// //                       Text(
// //                         'Dashboard',
// //                         style: TextStyle(
// //                             color: currentTab == 2 ? Colors.blue : Colors.grey),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //       // routes: {
// //       //   '/homepage': (context) => LeadsPage(),
// //       //   '/report': (context) => ReportPage(),
// //       //   '/dashboard': (context) => DashboardPage()
// //       // },
// //       theme: MyThemeData(),
// //     );
// //   }

// //   ThemeData MyThemeData() {
// //     return ThemeData(
// //         visualDensity: VisualDensity(horizontal: 4, vertical: 0),
// //         primarySwatch: Colors.amber,
// //         primaryColor: Colors.red,
// //         appBarTheme: AppBarTheme(
// //             backgroundColor: Colors.white,
// //             titleTextStyle: TextStyle(color: Colors.white)),
// //         textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black54)));
// //   }
// // }

// // class MyDrawer extends StatelessWidget {
// //   const MyDrawer({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //         child: Padding(
// //       padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
// //       child: Container(
// //         margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ListTile(
// //               onTap: () {},
// //               leading: CircleAvatar(
// //                 backgroundImage: NetworkImage(
// //                     "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
// //               ),
// //               contentPadding: EdgeInsets.all(10),
// //               title: Text("MY PROFILE"),
// //             ),
// //             Container(
// //               // height: 35,
// //               child: ListTile(
// //                 onTap: () {},
// //                 leading: Icon(Icons.home),
// //                 title: Align(
// //                   alignment: Alignment(-1.3, 0),
// //                   child: Text("Home"),
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               height: 35,
// //               child: ListTile(
// //                 onTap: () {},
// //                 leading: Icon(Icons.person),
// //                 title: Align(
// //                   alignment: Alignment(-1.3, 0),
// //                   child: Text("Profile"),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ));
// //   }
// // }
