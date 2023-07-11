import 'package:flutter/material.dart';
import 'package:flutter_sales_lead/controller/leadController.dart';
import 'package:flutter_sales_lead/controller/userController.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> listItem = [
    "Manajer",
    "Sales 1",
    "Sales 2",
    "Sales 3",
    "Sales 4"
  ];

  String? selected;

  final totalC = Get.put(LeadController(), tag: 'total');

  final profileC = Get.put(UserController());

  var dateFrom = TextEditingController();
  var dateToInput = TextEditingController();
  late DateTime dateTo;

  final myControllerDateFrom = TextEditingController();
  final myControllerDateTo = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDateFrom(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var dateTime = DateTime.parse(selectedDate.toString());
        var formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
        myControllerDateFrom.text = formate1;
      });
    }
  }

  Future<void> _selectDateTo(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var dateTime = DateTime.parse(selectedDate.toString());
        var formate1 = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
        myControllerDateTo.text = formate1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.29,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text("Sort Berdasarkan Sales"),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: DropdownButton(
                                hint: const Text('Pilih Sales...'),
                                items: listItem
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                value: selected,
                                onChanged: (value) => setState(() {
                                  selected = value.toString();
                                }),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Pilih Periode'),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 3, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 10),
                              controller: myControllerDateFrom,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Date From',
                                  fillColor: Colors.transparent,
                                  hintStyle: TextStyle(fontSize: 10),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                              onTap: () {
                                // Below line stops keyboard from appearing
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                _selectDateFrom(context);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: TextFormField(
                              style: const TextStyle(fontSize: 10),
                              controller: myControllerDateTo,
                              decoration: const InputDecoration.collapsed(
                                  hintText: 'Date to',
                                  fillColor: Colors.transparent,
                                  hintStyle: TextStyle(fontSize: 10),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red))),
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                _selectDateTo(context);
                              },
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue),
                          ),
                          child: const Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Center(
            child: SfFunnelChart(
              series: FunnelSeries<SalesData, String>(
                  explode: true,
                  explodeIndex: 1,
                  height: '100%',
                  width: '95%',
                  neckHeight: '0%',
                  neckWidth: '40%',
                  gapRatio: 0.1,
                  // Bind data source
                  dataSource: <SalesData>[
                    SalesData('Jan', 40),
                    SalesData('Feb', 38),
                    SalesData('Mar', 44),
                    SalesData('Apr', 58),
                    SalesData('May', 67)
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(isVisible: false)),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
