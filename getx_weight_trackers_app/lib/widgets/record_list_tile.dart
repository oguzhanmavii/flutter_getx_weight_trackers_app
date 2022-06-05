import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_weight_trackers_app/controller/home_controller.dart';
import 'package:getx_weight_trackers_app/models/record.dart';
import 'package:intl/intl.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({
    Key? key,
    required this.record,
  }) : super(key: key);
  final Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: ListTile(
          leading: _buildDate(),
          title: Center(child: _buildWeight()),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {
                    _controller.deleteRecord(record);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildDate() => Text(DateFormat('EEE,MMM d').format(record.dateTime));

  Text _buildWeight() => Text(
        '${record.weight}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
}
