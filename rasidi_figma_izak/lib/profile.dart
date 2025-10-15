import 'package:flutter/material.dart';
import 'beranda.dart'; // Import Beranda

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Profilku',
                style: TextStyle(
                  color: Color(0xFF161C2B),
                  fontSize: 30,
                  fontFamily: 'Konkhmer Sleokchher',
                  fontWeight: FontWeight.bold, // ✅ diubah menjadi bold
                ),
              ),
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 47.5,
                backgroundImage: AssetImage(
                  'assets/images/eceee.jpeg',
                ),
              ),
              const SizedBox(height: 48),
              const Text(
                'Mohon maaf lagi mainmaintenance',
                style: TextStyle(
                  color: Color(0xFF161C2B),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(
                color: Colors.purple,
              ),
              const Spacer(),
              Container( // Wrap BottomNavigationBar with Container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x269E9E9E),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: const Color(0xFF4D8AF0),
                  unselectedItemColor: Colors.grey,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.chat_bubble_outline),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.notifications_none),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline),
                      label: '',
                    ),
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      // Navigate to Beranda if home icon is tapped
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Beranda()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Output: Judul 'Profilku' sekarang menggunakan fontWeight.bold agar tebal.

// Next suggestions:
// a. Implementasikan custom font di pubspec.yaml agar typography sesuai desain Figma.
// b. Tambahkan Hero animation di CircleAvatar untuk efek transisi ke halaman edit profil.