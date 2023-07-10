import 'package:flutter/material.dart';
import 'package:flutter_sales_lead/controller/leadController.dart';
import 'package:flutter_sales_lead/controller/userController.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LeadsPage extends StatelessWidget {
  final leadC = Get.put(LeadController());
  // final leadsC = Get.lazyPut(() => LeadController());
  final profileC = Get.put(UserController());

  List<String> listPipeline = [
    "New",
    "Pending Response",
    "Contacted",
    "Gallery Visit",
    "Negotiation",
    "Booked",
    "SPA Sign",
    "Lost"
  ];

  List<String> statusLead = ["Hot", "Warm", "Cold", "Close"];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: MediaQuery.of(context).size.height * 0.15,
          child: SizedBox(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  'Leads',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilterChip(
                        label: const SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Sort By',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Icon(
                                Icons.checklist,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        onSelected: (select) {
                          Get.dialog(AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            title: SizedBox(
                              // color: Colors.blueAccent,
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Sort By'),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(10, 10),
                                          // backgroundColor: Colors.red,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                            ),
                            content: SizedBox(
                              height: 100,
                              width: 300,
                              // color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: 4.0, // gap between lines
                                    children: <Widget>[
                                      FilterChip(
                                          padding: const EdgeInsets.all(10),
                                          label: const SizedBox(
                                            child: Text('Update Terakhir Naik'),
                                          ),
                                          onSelected: (select) {
                                            print(print);
                                          }),
                                      FilterChip(
                                          padding: EdgeInsets.all(10),
                                          label: const SizedBox(
                                            child:
                                                Text('Update Terakhir Turun'),
                                          ),
                                          onSelected: (select) {
                                            print(print);
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FilterChip(
                        label: const SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  'Pilih Filter',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              Icon(
                                Icons.checklist,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                        onSelected: (select) {
                          Get.dialog(AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            title: SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Filter Berdasarkan'),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(10, 10),
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close))
                                ],
                              ),
                            ),
                            content: SizedBox(
                              height: 400,
                              width: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text('Tahapan Lead Pipeline'),
                                  ),
                                  Wrap(
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: 4.0, // gap between lines
                                    children: listPipeline
                                        .map((e) => FilterChip(
                                            label: Container(
                                              child: Text(e),
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            onSelected: (e) {
                                              print(e);
                                            }))
                                        .toList(),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text('Status Lead'),
                                  ),
                                  Wrap(
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: 4.0, // gap between lines
                                    children: statusLead
                                        .map((e) => FilterChip(
                                            label: SizedBox(
                                              child: Text(e),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            onSelected: (e) {
                                              print(e);
                                            }))
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          ));
                        }),
                  ),
                ],
              )
            ],
          )),
        ),
        Obx(() => profileC.leadsPage.value == true
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.67,
                child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          elevation: 16,
                          shadowColor: Colors.grey,
                          child: ListTile(
                            onTap: () {
                              Get.dialog(AlertDialog(
                                content: Text('Index ke :$index'),
                              ));
                            },
                            title: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              child: Text(
                                'New',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ),
                            subtitle: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        '${leadC.lead.value.leadName}',
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        'Company Name',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        'Sales :${leadC.lead.value.salesName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 18),
                                      ),
                                    ),
                                    Text('${leadC.lead.value.date}'),
                                  ],
                                ),
                              ),
                            ),
                            trailing: const Icon(Icons.add),
                          ),
                        ),
                      );
                    }),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.67,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ListView.builder(
                      itemCount: 40,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            elevation: 16,
                            shadowColor: Colors.grey,
                            child: ListTile(
                              onTap: () {
                                Get.dialog(AlertDialog(
                                  content: Text('Index ke :$index'),
                                ));
                              },
                              title: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              subtitle: SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          '${leadC.lead.value.leadName}',
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(
                                          'Company Name',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          'Sales :${leadC.lead.value.salesName}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Text('${leadC.lead.value.date}'),
                                    ],
                                  ),
                                ),
                              ),
                              trailing: const Icon(Icons.add),
                            ),
                          ),
                        );
                      }),
                ),
              ))
      ],
    );
  }
}
