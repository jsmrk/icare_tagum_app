import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/button_no_icon.dart';

class WriteConcernSheet extends StatefulWidget {
  const WriteConcernSheet({super.key});

  @override
  State<WriteConcernSheet> createState() => _WriteConcernSheetState();
}

class _WriteConcernSheetState extends State<WriteConcernSheet> {
  String _dropdownValue = 'low';

  void urgencyDropdown(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  Widget textFieldTitle(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget textField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.9,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.add_photo_alternate),
          iconSize: 75,
        ),
        textFieldTitle('Urgency: '),
        DropdownButton(items: const [
          DropdownMenuItem(
            value: 'low',
            child: Text('Low'),
          ),
          DropdownMenuItem(
            value: 'high',
            child: Text('High'),
          ),
        ], value: _dropdownValue, onChanged: urgencyDropdown),
        textFieldTitle('Description: '),
        textField('Report Description'),
        textFieldTitle('Location: '),
        textField('Report Description'),
        Row(
          children: [
            ButtonWithoutIcon(
              navigateTo: () => Navigator.pop(context),
            ),
          ],
        ),
      ],
    );
  }
}
