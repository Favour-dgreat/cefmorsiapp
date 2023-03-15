import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final Function(bool) callback;

  const CheckboxWidget({Key? key, required this.callback}) : super(key: key);

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _checkbox = true;

  @override
  Widget build(BuildContext context) {
    return   CheckboxListTile(
      title: const Text('Remember Password', style: TextStyle(color: Colors.grey),),
      value: _checkbox,
      onChanged: (value) {
        widget.callback(value!);
        setState(() => _checkbox = !_checkbox);},
    );
  }
}