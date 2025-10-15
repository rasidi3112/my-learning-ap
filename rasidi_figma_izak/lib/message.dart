
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5), // Background color
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  width: 375,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Header
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 375,
                          height: 84,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(CupertinoIcons.back, color: Colors.black), // Use CupertinoIcons for iOS style
                              const Icon(CupertinoIcons.search, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 50,
                        child: SizedBox(
                          width: 54,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),

                      // Profile List
                      Positioned(
                        top: 84,
                        left: 0,
                        right: 0,
                        bottom: 98,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            _buildProfileItem(
                              name: 'Dr. Ana Bell',
                              description: 'Massachusetts Institute of Technology',
                              image: 'assets/images/ana5_2.jpg',
                              hasButton: true,
                            ),
                            _buildSectionTitle('Staff available for Dr. Ana Bell'),
                            _buildProfileItem(
                              name: 'Ahmad Rasidi',
                              description: 'C.E.O Platform pembelajaran',
                              image: 'assets/images/ganteng.jpeg',
                            
                            ),
                            _buildProfileItem(
                              name: 'Warren Buffett',
                              description: 'Bapak Investor Dunia',
                              image: 'assets/images/pic75532c9d27eebd5707e826f9b7b6167e.jpg',
                            ),
                            _buildProfileItem(
                              name: 'Lars Bak',
                              description: 'Admin',
                              image: 'assets/images/Lars_Bak.png',
                            ),
                            _buildProfileItem(
                              name: 'Albert Einsten',
                              description: 'Class Teacher',
                              image: 'assets/images/einstein-225x300.jpg',
                            ),
                            _buildProfileItem(
                              name: 'Elon Musk',
                              description: 'Admin',
                              image: 'assets/images/ELON MUSK.png',
                            ),
                            _buildProfileItem(
                              name: 'Bj. Habibie',
                              description: 'Class Teacher',
                              image: 'assets/images/Habibie-750x470.jpg',
                            ),
                          ],
                        ),
                      ),

                      // Bottom Navigation Bar
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Container(
                          width: 375,
                          height: 98,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x26CCCCCC),
                                blurRadius: 8,
                                offset: Offset(0, -2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(CupertinoIcons.home, size: 30, color: Colors.grey), // Use CupertinoIcons for iOS style
                              Icon(CupertinoIcons.chat_bubble, size: 30, color: Colors.grey),
                              Icon(CupertinoIcons.bell, size: 30, color: Colors.grey),
                              Icon(CupertinoIcons.person, size: 30, color: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileItem({
    required String name,
    required String description,
    required String image,
    bool hasButton = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: image.startsWith('http')
                    ? NetworkImage(image)
                    : AssetImage(image) as ImageProvider,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF161C2B),
                        fontSize: 14,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w500,
                        height: 1.30,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Color(0xFF6F6F79),
                        fontSize: 12,
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              if (hasButton)
                Container(
                  width: 36,
                  height: 36,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF4E74F9),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Icon(CupertinoIcons.arrow_clockwise, color: Colors.white), // Use CupertinoIcons for iOS style
                ),
              if (!hasButton)
                const Icon(CupertinoIcons.chat_bubble, color: Colors.black),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFE9E9F1),
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4E74F9),
                fontSize: 14,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w500,
                height: 1.30,
              ),
            ),
          ),
        ),
        const Divider(
          color: Color(0xFFE9E9F1),
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}