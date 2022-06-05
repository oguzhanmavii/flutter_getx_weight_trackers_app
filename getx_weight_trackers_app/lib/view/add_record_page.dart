import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordScreen extends StatefulWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();
  void pickDate(BuildContext context) async {
    var initialDate = DateTime.now();
    _selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: initialDate.subtract(Duration(days: 365)),
            lastDate: initialDate.add(Duration(days: 30)),
            builder: (context, child) {
              return Theme(
                  data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme(
                    primary: Colors.black87,
                    primaryVariant: Colors.black,
                    secondary: Colors.yellow,
                    secondaryVariant: Colors.yellowAccent,
                    surface: Colors.blue,
                    background: Colors.blueAccent,
                    error: Colors.red,
                    onPrimary: Colors.white,
                    onSecondary: Colors.brown,
                    onSurface: Colors.black26,
                    onBackground: Colors.blueGrey,
                    onError: Colors.orange,
                    brightness: Brightness.light,
                  )),
                  child: child ?? const Text(''));
            }) ??
        _selectedDate;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Record"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text("Weight Card"),
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: NumberPicker(
              axis: Axis.horizontal,
              minValue: 50,
              maxValue: 150,
              value: _selectedValue,
              onChanged: (value) {
                setState(() {
                  _selectedValue = value;
                });
              },
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    FontAwesomeIcons.calendar,
                    size: 40,
                  ),
                  Expanded(
                      child: Text(
                    DateFormat('EEE,MMM d').format(_selectedDate),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.pink,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(
              "Note Card",
              style: TextStyle(fontSize: 28),
            )),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Save Record"),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )),
          ),
        ],
      ),
    );
  }
}
