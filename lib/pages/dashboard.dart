import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_sales_lead/controller/leadController.dart';
import 'package:flutter_sales_lead/controller/userController.dart';
import 'package:get/get.dart';

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.29,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(child: Text("Sort Berdasarkan Sales")),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Text('0'),
                            ),
                          ),
                          Container(
                            width: 120,
                            child: DropdownButton(
                              hint: Text('Pilih Sales...'),
                              items: listItem
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ))
                                  .toList(),
                              value: selected,
                              onChanged: (value) => setState(() {
                                print(selected);
                                selected = value.toString();
                                print(selected);
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Pilih Periode'),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 3, 0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            // decoration: InputDecoration.collapsed(hintText: 'Date From',),
                            onTap: () {
                              // Below line stops keyboard from appearing
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2030));

                              // Show Date Picker Here
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.3),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            onTap: () {
                              // Below line stops keyboard from appearing
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2030));

                              // Show Date Picker Here
                            },
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Search'),
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.43,
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              // TextField(
              //   controller: profileC.nameC,
              //   textInputAction: TextInputAction.next,
              //   autocorrect: false,
              //   decoration: InputDecoration(
              //     labelText: "Full Name",
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // SizedBox(height: 15),
              TextField(
                controller: profileC.emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),labelText: 'Email',),
              ),
              SizedBox(height: 15),
              Obx(() => TextField(
                obscureText: profileC.hidden.value,
                controller: profileC.password,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye),onPressed: ()=>profileC.hidden.toggle(),),
                    border: OutlineInputBorder(),labelText: 'Password',),
                // onEditingComplete: () => profileC.login(
                //   // profileC.nameC.text,
                //   profileC.emailC.text,
                //   profileC.password.text,
                //   // profileC.phoneC.text,
                // ),
              ),),
              
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => profileC.login(
                  profileC.emailC.text,
                  profileC.password.text,
                ),
                child: Text("LOGIN", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          // child: ListView.builder(
          //     itemCount: 100,
          //     itemBuilder: (context, index) {

          //       return Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Card(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15),
          //             side: BorderSide(
          //               color: Colors.black,
          //             ),
          //           ),
          //           elevation: 16,
          //           shadowColor: Colors.grey,
          //           child: ListTile(
          //             // leading: const Icon(Icons.flight_land),
          //             title: Padding(
          //               padding: const EdgeInsets.symmetric(
          //                   vertical: 10, horizontal: 15),
          //               child: Text(
          //                 'New',
          //                 style: TextStyle(
          //                   fontSize: 20,
          //                   fontWeight: FontWeight.w600,
          //                   color: Colors.blueAccent,
          //                 ),
          //               ),
          //             ),
          //             subtitle: Container(
          //               child: Padding(
          //                 padding: const EdgeInsets.all(15.0),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.start,
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(vertical: 5),
          //                       child: Text(
          //                         faker.person.name(),
          //                         style: TextStyle(
          //                             fontSize: 22,
          //                             fontWeight: FontWeight.w500),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(vertical: 5),
          //                       child: Text(
          //                         'Company Name',
          //                         style: TextStyle(fontSize: 18),
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           const EdgeInsets.symmetric(vertical: 5),
          //                       child: Text(
          //                         'Sales :${faker.person.name()}',
          //                         style: TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             color: Colors.black,
          //                             fontSize: 18),
          //                       ),
          //                     ),
          //                     Text('06/26/2023 1:24 PM'),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             trailing: const Icon(Icons.add),
          //           ),
          //         ),
          //       );
          //     }),
        ),
      ],
    );
  }
}
