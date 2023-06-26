import 'package:flutter/material.dart';
import 'package:flutter_sales_lead/pages/dashboard.dart';
import 'package:faker/faker.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({
    super.key,
    required this.mediaQueryWidht,
    required this.mediaQueryHeight,
  });
  final double mediaQueryWidht;
  final double mediaQueryHeight;

  @override
  Widget build(BuildContext context) {
    var faker = Faker();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
          width: mediaQueryWidht,
          height: mediaQueryHeight * 0.2,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                  'Leads',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Sort By',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Icon(
                            Icons.checklist,
                            color: Colors.black,
                          )
                        ]),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'Pilih Filter',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Icon(
                            Icons.checklist,
                            color: Colors.black,
                          )
                        ]),
                      )),
                ],
              )
            ],
          )),
        ),
        Container(
          height: mediaQueryHeight * 0.6,
          // padding: EdgeInsets.only(top: 30),
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    elevation: 16,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      // leading: const Icon(Icons.flight_land),
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
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
                      subtitle: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  faker.person.name(),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Company Name',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Sales :${faker.person.name()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                              Text('06/26/2023 1:24 PM'),
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
      ],
    );
  }
}
