// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:icare_tagum_app/widgets/button_no_icon.dart';
import 'package:icare_tagum_app/widgets/write_sheet/textfield.dart';

import '../widgets/write_sheet/textform.dart';

class WriteConcernSheet extends StatefulWidget {
  const WriteConcernSheet({super.key});

  @override
  State<WriteConcernSheet> createState() => _WriteConcernSheetState();
}

class _WriteConcernSheetState extends State<WriteConcernSheet> {
  String _selectedUrgency = 'Low';
  List<String> urgency = ['Low', 'High'];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();

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
          WriterTextField(
            controller: titleController,
            hintext: 'Title',
            icon: Icon(Icons.title),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              textFieldTitle('Urgency: '),
              const SizedBox(width: 25),
              DropdownButton<String>(
                value: _selectedUrgency,
                items: urgency.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    _selectedUrgency = item!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          WriteTextFormField(controller: descriptionController),
          const SizedBox(height: 11),
          const SizedBox(
            height: 7,
          ),
          WriterTextField(
            controller: locationController,
            hintext: 'Location',
            icon: Icon(Icons.location_pin),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonWithoutIcon(
                onTap: () => Navigator.pop(context),
                bgColor: Colors.grey,
                buttonText: 'Cancel',
                curvedSize: 15,
                txtColor: Colors.white,
              ),
              ButtonWithoutIcon(
                onTap: () => Navigator.pop(context),
                bgColor: Colors.green,
                buttonText: 'Confirm',
                curvedSize: 15,
                txtColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
