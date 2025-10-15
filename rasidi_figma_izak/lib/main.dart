import 'package:flutter/material.dart';
import 'login.dart'; // <--- Tambahkan ini untuk mengimpor halaman login



//Menjadi titik awal aplikasi. Menggunakan runApp untuk meluncurkan widget utama FigmaToCodeApp

void main() {
  runApp(const FigmaToCodeApp());
}


/*Menggunakan MaterialApp untuk mendefinisikan tema dan struktur dasar aplikasi.
Scaffold menyediakan kerangka dasar untuk tampilan dan menampilkan Frame1641*/

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: ListView(children: [
          Frame1641(),
        ]),
      ),
    );
  }
}






class Frame1641 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 375,
          height: 761,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              // Ellipse Biru Kecil
              Positioned(
                left: 319,
                top: 406,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2CB4EC),
                    shape: OvalBorder(),
                  ),
                ),
              ),

              // Ellipse Kuning Kecil
              Positioned(
                left: 65,
                top: 176,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFD037),
                    shape: OvalBorder(),
                  ),
                ),
              ),

              // Lingkaran Merah Besar
              Positioned(
                left: 90,
                top: 220,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE74C3C),
                    shape: OvalBorder(),
                  ),
                ),
              ),

              // Teks Selamat Datang
              Positioned(
                left: 37,
                top: 463,
                child: SizedBox(
                  width: 301,
                  child: Text(
                    'Selamat Datang ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              // Deskripsi bawah
              Positioned(
                left: 43,
                top: 557,
                child: SizedBox(
                  width: 290,
                  child: Text(
                    'Bergabunglah dengan kami dalam menciptakan pengalaman belajar yang inspiratif.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              // Tombol Mulai dengan GestureDetector
              Positioned(
                left: 21,
                top: 669,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    width: 335,
                    height: 54,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 335,
                            height: 54,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF4E74F9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3D000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x1E000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 145,
                                  top: 16,
                                  child: Text(
                                    'Mulai ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 300,
                          top: 19,
                          child: Container(
                            width: 16,
                            height: 16,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(),
                            child: Stack(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
