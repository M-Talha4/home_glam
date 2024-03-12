import 'package:get/get.dart';

class NotificationController extends GetxController {
  bool food = true;
  bool milk = true;
  bool sleep = false;
  bool doctorCheckup = false;
  bool play = false;
  bool vaccine = false;

  List<String> dialogList = [
    'Stop swaddling ',
    'Move baby to their own Room and what to buy',
    'When to start sleep training and different methods to do it',
    'When to stop dream feeding.',
    'When to buy night time diapers'
  ];



}
