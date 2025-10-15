import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({Key? key}) : super(key: key);

  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  File? _image;

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 375,
              height: 812,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  // Bottom Navigation Bar
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: 375,
                      height: 98,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x269E9E9E),
                            blurRadius: 10,
                            offset: Offset(0, -2),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(CupertinoIcons.home),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(CupertinoIcons.chat_bubble),
                            onPressed: () {},
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFCDDEFB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(CupertinoIcons.bell_fill, color: Color(0xFF4E74F9)),
                                const SizedBox(width: 8),
                                const Text(
                                  'Notification',
                                  style: TextStyle(
                                    color: Color(0xFF4E74F9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(CupertinoIcons.person),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Top Navigation Bar
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 375,
                      height: 113,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            width: 375,
                            height: 44,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 336.33,
                                  top: 17.33,
                                  child: Opacity(
                                    opacity: 0.35,
                                    child: Container(
                                      width: 22,
                                      height: 11.33,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 1),
                                          borderRadius: BorderRadius.circular(2.67),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 338.33,
                                  top: 19.33,
                                  child: Container(
                                    width: 18,
                                    height: 7.33,
                                    decoration: ShapeDecoration(
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(1.33),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 21,
                                  top: 7.33,
                                  child: SizedBox(
                                    width: 54,
                                    child: const Text(
                                      '9:41',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Notification',
                                  style: TextStyle(
                                    color: Color(0xFF161C2B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: IconButton(
                                    icon: const Icon(CupertinoIcons.settings),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image Display Area
                  Positioned(
                    left: 0,
                    top: 150,
                    child: GestureDetector(
                      onTap: _getImage,
                      child: Container(
                        width: 375,
                        height: 300,
                        color: Colors.grey[200],
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 375,
                                height: 300,
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              ),
                      ),
                    ),
                  ),

                  // "No notification, yet!" Text
                  Positioned(
                    left: 57,
                    top: 472,
                    child: SizedBox(
                      width: 262,
                      child: const Text(
                        'No notification, yet!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF161C2B),
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}