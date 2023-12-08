// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icare_tagum_app/Services/saving_concern_services.dart';
import 'package:icare_tagum_app/widgets/button_no_icon.dart';
import 'package:image_picker/image_picker.dart';

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
  final readConcern = ReadConcern();
  int _currentImageIndex = 0;

  List<File> selectedImages = [];
  final picker = ImagePicker();

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  Future<void> uploadConcern() async {
    List<String> downloadURLs = [];
    try {
      for (int index = 0; index < selectedImages.length; index++) {
        final storageRef = FirebaseStorage.instance.ref(
          'images/${selectedImages[index].path.split('/').last}',
        );
        final uploadTask = storageRef.putFile(selectedImages[index]);
        await uploadTask.whenComplete(() => null);
        final downloadURL = await storageRef.getDownloadURL();
        downloadURLs.add(downloadURL);
      }

      readConcern.addConcern(
        title: titleController.text,
        description: descriptionController.text,
        location: locationController.text,
        urgency: _selectedUrgency,
        imageURLs: downloadURLs,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Concern added successfully'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    } finally {
      Navigator.of(context).pop();
    }
  }

  Widget displaySelectedImages() {
    return SizedBox(
      height: 165,
      width: 355,
      child: selectedImages.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                // PageView for sliding images
                PageView.builder(
                  itemCount: selectedImages.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int newPageIndex) {
                    setState(() {
                      _currentImageIndex = newPageIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: kIsWeb
                          ? Image.network(
                              selectedImages[index].path,
                              fit: BoxFit.cover,
                            )
                          : Image.file(selectedImages[index],
                              fit: BoxFit.cover),
                    );
                  },
                ),

                // Dots for multiple images
                if (selectedImages.length > 1)
                  Positioned(
                    bottom: 11,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        selectedImages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 11,
                          height: 11,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentImageIndex
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
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
          if (selectedImages.length > 0) displaySelectedImages(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Urgency: ',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 15),
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
              Row(
                children: [
                  const Icon(Icons.add_photo_alternate),
                  TextButton(
                      onPressed: getImages,
                      child: const Text(
                        'Add Image',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ))
                ],
              ),
              // IconButton(
              //   onPressed: getImages,
              //   icon: const Icon(Icons.add_photo_alternate),
              //   iconSize: 35,
              // ),
            ],
          ),
          const SizedBox(height: 5),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.title,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Title',
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
                  color: Colors.green,
                  width: 1.9,
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: descriptionController,
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
          TextField(
            controller: locationController,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.location_pin,
                color: Colors.grey,
              ),
              contentPadding: const EdgeInsets.all(15),
              hintText: 'Location',
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
                  color: Colors.green,
                  width: 1.9,
                ),
              ),
            ),
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
                onTap: () async {
                  // Ask for confirmation
                  bool confirm = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Confirm Add Concern'),
                      content: const Text(
                          'Are you sure you want to add this concern?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(context, false), // Cancel
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true); // Confirm

                            // Show circular progress indicator
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          child: const Text('Confirm'),
                        ),
                      ],
                    ),
                  );

                  if (confirm) {
                    uploadConcern();
                  }
                },
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
