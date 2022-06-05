import 'package:flutter/material.dart';
import 'package:getx_weight_trackers_app/controller/home_controller.dart';
import 'package:getx_weight_trackers_app/models/record.dart';
import 'package:getx_weight_trackers_app/widgets/record_list_tile.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;

    return Obx(() => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: _controller.addRecord, icon: Icon(Icons.add))
            ],
            centerTitle: true,
            title: Text("History"),
          ),
          body: _controller.records.isEmpty
              ? Center(
                  child: Container(
                    child: Text("Lütfen Bir Kayıt Giriniz"),
                  ),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  children: _controller.records
                      .map((record) => RecordListTile(record: record))
                      .toList()),
        ));
  }
}
