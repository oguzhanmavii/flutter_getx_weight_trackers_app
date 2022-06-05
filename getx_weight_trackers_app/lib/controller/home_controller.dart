import 'package:get/get.dart';
import 'package:getx_weight_trackers_app/models/record.dart';

class Controller extends GetxController {
  var records = <Record>[
    Record(weight: 80, dateTime: DateTime.now(), note: 'aaaa'),
    Record(weight: 83, dateTime: DateTime.now(), note: 'absadas'),
    Record(weight: 85, dateTime: DateTime.now(), note: 'adsa'),
    Record(weight: 87, dateTime: DateTime.now(), note: 'agfgfbd'),
    Record(weight: 89, dateTime: DateTime.now(), note: 'aaadsadsaa'),
    Record(weight: 91, dateTime: DateTime.now(), note: 'bbbbacdeexff'),
    Record(weight: 76, dateTime: DateTime.now(), note: 'dsagdsgwehrnfb'),
    Record(weight: 78, dateTime: DateTime.now(), note: 'dsadsfhbrd'),
  ].obs;

  void addRecord() {
    records.add(Record(weight: 83, dateTime: DateTime.now(), note: 'xxxxyyyy'));
    print(records.length);
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }
}
