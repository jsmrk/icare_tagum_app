// ignore_for_file: sized_box_for_whitespace

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
    return Container(
      padding: const EdgeInsets.all(19),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.add_photo_alternate),
            iconSize: 115,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              textFieldTitle('Urgency: '),
              const SizedBox(width: 25),
              Container(
                width: 150,
                child: DropdownButton(
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'low',
                      child: Text('Low'),
                    ),
                    DropdownMenuItem(
                      value: 'high',
                      child: Text('High'),
                    ),
                  ],
                  value: _dropdownValue,
                  onChanged: urgencyDropdown,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          textFieldTitle('Description: '),
          const SizedBox(
            height: 7,
          ),
          TextFormField(
            maxLines: 7,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Write Report Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                    color: Colors.grey,
                    width: 3.0), // Thicker border when focused
              ),
            ),
          ),
          const SizedBox(height: 15),
          textFieldTitle('Location: '),
          const SizedBox(
            height: 7,
          ),
          textField('Type Location'),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWithoutIcon(
                navigateTo: () => Navigator.pop(context),
                bgColor: Colors.grey,
                buttonText: 'Cancel',
                curvedSize: 15,
                txtColor: Colors.white,
              ),
              ButtonWithoutIcon(
                navigateTo: () => Navigator.pop(context),
                bgColor: Colors.green,
                buttonText: 'Confirm',
                curvedSize: 15,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
