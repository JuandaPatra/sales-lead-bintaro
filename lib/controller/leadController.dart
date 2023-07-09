import 'package:get/get.dart';
import 'package:faker/faker.dart';
import '../models/lead.dart';

class LeadController extends GetxController{
  var faker = Faker();

  var total = 0.obs;


  var lead = Lead(leadName: 'Ahmad', salesName: "Joko",date: DateTime.now().toString()).obs;



}