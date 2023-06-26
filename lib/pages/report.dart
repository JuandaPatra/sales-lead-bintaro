import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({
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
          height: mediaQueryHeight * 0.10,
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  'Jadwal Laporan',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
        ),
        Container(
          height: mediaQueryHeight * 0.7,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    elevation: 16,
                    shadowColor: Colors.grey,
                    child: ListTile(
                      subtitle: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'cek',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Text(
                                  'Pengiriman Berikutnya dijadwalkan',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Ubah'),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors
                                            .blueAccent, // Background Color
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Download'),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors
                                            .blueAccent, // Background Color
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Hapus'),
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors
                                            .pinkAccent, // Background Color
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
