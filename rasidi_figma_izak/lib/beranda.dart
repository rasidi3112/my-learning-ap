import 'package:flutter/material.dart';
import 'profile.dart';
import 'notifikasi.dart';
import 'message.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  // List data dummy
  final List<Map<String, dynamic>> _kategoriList = [
    {
      'id': 1,
      'title': 'Accounting',
      'courses': '20 Courses',
      'image': 'assets/images/accounting.jpg'
    },
    {
      'id': 2,
      'title': 'Biology',
      'courses': '15 Courses',
      'image': 'assets/images/biology.jpg'
    },
    {
      'id': 3,
      'title': 'Photography',
      'courses': '25 Courses',
      'image': 'assets/images/photograpy.webp'
    },
    {
      'id': 4,
      'title': 'Marketing',
      'courses': '18 Courses',
      'image': 'assets/images/marketing.webp'
    },
    {
      'id': 4,
      'title': 'Matematika',
      'courses': '18 Courses',
      'image': 'assets/images/matematika.png'
    },
    {
      'id': 5,
      'title': 'Design',
      'courses': '10 Courses',
      'image': 'assets/images/design.jpg'
    },
    {
      'id': 6,
      'title': 'Programming',
      'courses': '30 Courses',
      'image': 'assets/images/programing.jpg'
    },
    {
      'id': 7,
      'title': 'Data Science',
      'courses': '22 Courses',
      'image': 'assets/images/data-science.jpg'
    },
    {
      'id': 8,
      'title': 'Machine Learning',
      'courses': '12 Courses',
      'image': 'assets/images/machine_learning.jpg'
    },
    {
      'id': 9,
      'title': 'Cyber Security',
      'courses': '14 Courses',
      'image': 'assets/images/cyber-security.jpg'
    },
    {
      'id': 10,
      'title': 'Cloud Computing',
      'courses': '16 Courses',
      'image': 'assets/images/cloud-computing.jpg'
    },
    {
      'id': 11,
      'title': 'Artificial Intelligence',
      'courses': '20 Courses',
      'image': 'assets/images/ai.jpg'
    },
    {
      'id': 13,
      'title': 'Digital Marketing',
      'courses': '25 Courses',
      'image': 'assets/images/marketingg.avif'
    },
    {
      'id': 14,
      'title': 'Graphic Design',
      'courses': '15 Courses',
      'image': 'assets/images/grapic-design.jpg'
    },
    // Kategori kosong untuk mencapai batas maksimal
  ];

  // Fungsi buat nambah data baru
  void _tambahKategori(String title, String courses, String image) {
    if (_kategoriList.length < 15) {
      setState(() {
        _kategoriList.add({
          'id': _kategoriList.length == 0 ? 1 : _kategoriList.last['id'] + 1,
          'title': title,
          'courses': courses,
          'image': image,
        });
      });
    } else {
      // Tampilkan pesan kalo kategori udah maksimal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kategori sudah mencapai batas maksimal (15)')),
      );
    }
  }

  // Fungsi buat ngubah data
  void _ubahKategori(int id, String title, String courses, String image) {
    setState(() {
      final index =
          _kategoriList.indexWhere((kategori) => kategori['id'] == id);
      if (index >= 0) {
        _kategoriList[index] = {
          'id': id,
          'title': title,
          'courses': courses,
          'image': image,
        };
      }
    });
  }

  // Fungsi buat ngapus data
  void _hapusKategori(int id) {
    setState(() {
      _kategoriList.removeWhere((kategori) => kategori['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Stack(
          // Use Stack to overlay the bottom navigation bar
          children: [
            SingleChildScrollView(
              child: Container(
                width: 375,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    // Header Biru
                    Container(
                      margin: const EdgeInsets.only(
                          top: 12, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4E74F9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hallo,\nSelamat pagi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w700,
                                height: 1.30,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16.0),
                                    child: Icon(Icons.search,
                                        color: Color(0xFFB7B7B7)),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Search',
                                        style: TextStyle(
                                          color: const Color(0xFFB7B7B7),
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: DropdownButton<String>(
                                      value: 'All',
                                      icon: const Icon(Icons.arrow_drop_down,
                                          color: Color(0xFFB7B7B7)),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                        color: Color(0xFFB7B7B7),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      underline: Container(height: 0),
                                      onChanged: (String? newValue) {
                                        // Handle dropdown change
                                      },
                                      items: <String>['All']
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Tombol Tambah Kategori dan Edit Kategori
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Panggil fungsi buat nambah data
                              _tambahKategori('Kategori Baru', '0 Courses',
                                  'assets/images/default.jpg');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4D8AF0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Tambah Kategori'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Panggil fungsi buat ngubah data
                              if (_kategoriList.isNotEmpty) {
                                _ubahKategori(
                                    _kategoriList[0]['id'],
                                    'Accounting Updated',
                                    '25 Courses',
                                    'assets/images/accounting.jpg');

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Data berhasil diperbarui ')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Tidak ada data untuk diperbarui')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4D8AF0),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Edit Kategori'),
                          ),
                        ],
                      ),
                    ),

                    // Jelajahi Kategori
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jelajahi kategori',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigasi ke halaman "See All"
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeAllKategori(
                                    kategoriList: _kategoriList,
                                    tambahKategori: _tambahKategori,
                                    ubahKategori: _ubahKategori,
                                    hapusKategori: _hapusKategori,
                                  ),
                                ),
                              ).then((_) =>
                                  setState(() {})); // Refresh halaman setelah kembali
                            },
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                color: Color(0xFF4D8AF0),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 1.30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Kategori Cards
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 25, right: 25),
                      child: Column(
                        children: [
                          for (var kategori in _kategoriList.take(4))
                            // Tampilkan maksimal 4 kategori
                            _buildCategoryCard(
                              image: kategori['image'],
                              title: kategori['title'],
                              courses: kategori['courses'],
                              onHapus: () {
                                // Panggil fungsi buat ngapus data
                                _hapusKategori(kategori['id']);
                              },
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            100), // Add space for the bottom navigation bar
                  ],
                ),
              ),
            ),

            // Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: 375,
                height: 70, // Reduced height to match the image
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavigationItem(
                          icon: Icons.home,
                          text: '',
                          isActive: true,
                          context: context),
                      _buildNavigationItem(
                          icon: Icons.chat_bubble_outline,
                          text: '',
                          isActive: false,
                          context: context),
                      _buildNavigationItem(
                          icon: Icons.notifications_none,
                          text: '',
                          isActive: false,
                          context: context),
                      _buildNavigationItem(
                          icon: Icons.person_outline,
                          text: '',
                          isActive: false,
                          context: context,
                          navigateToProfile:
                              true), // Profile navigation
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String image,
    required String title,
    required String courses,
    required VoidCallback onHapus,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(8, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              courses,
              style: const TextStyle(
                color: Color(0xFF717171),
                fontSize: 13,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              onPressed: onHapus,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4D8AF0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Hapus'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String text,
    required bool isActive,
    required BuildContext context,
    bool navigateToProfile = false,
  }) {
    Color activeColor = const Color(0xFF4D8AF0);
    Color inactiveColor = Colors.grey;

    return GestureDetector(
      onTap: () {
        if (icon == Icons.person_outline) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        } else if (icon == Icons.chat_bubble_outline) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessagePage()),
          );
        } else if (icon == Icons.notifications_none) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotifikasiPage()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? const Color(0x474D8AEF) : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? activeColor : inactiveColor, size: 28),
            if (text.isNotEmpty)
              Text(
                text,
                style: TextStyle(
                  color: isActive ? activeColor : inactiveColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Halaman "See All"
class SeeAllKategori extends StatefulWidget {
  final List<Map<String, dynamic>> kategoriList;
  final Function(String, String, String) tambahKategori;
  final Function(int, String, String, String) ubahKategori;
  final Function(int) hapusKategori;

  SeeAllKategori({
    required this.kategoriList,
    required this.tambahKategori,
    required this.ubahKategori,
    required this.hapusKategori,
  });

  @override
  _SeeAllKategoriState createState() => _SeeAllKategoriState();
}

class _SeeAllKategoriState extends State<SeeAllKategori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Kategori'),
      ),
      body: ListView.builder(
        itemCount: widget.kategoriList.length,
        itemBuilder: (context, index) {
          final kategori = widget.kategoriList[index];
          return _buildCategoryCard(
            image: kategori['image'],
            title: kategori['title'],
            courses: kategori['courses'],
            onHapus: () {
              // Panggil fungsi buat ngapus data
              widget.hapusKategori(kategori['id']);
              Navigator.pop(
                  context); // Kembali ke halaman sebelumnya setelah menghapus
            },
            onEdit: () {
              // Tampilkan dialog buat edit kategori
              _showEditDialog(context, kategori);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Panggil fungsi buat nambah data
          widget.tambahKategori('Kategori Baru', '0 Courses',
              'assets/images/default.jpg');
          Navigator.pop(
              context); // Kembali ke halaman sebelumnya setelah menambah
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String image,
    required String title,
    required String courses,
    required VoidCallback onHapus,
    required VoidCallback onEdit,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 25,
            offset: Offset(8, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              courses,
              style: const TextStyle(
                color: Color(0xFF717171),
                fontSize: 13,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: onEdit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Edit'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: onHapus,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4D8AF0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Hapus'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi buat nampilin dialog edit kategori
  void _showEditDialog(BuildContext context, Map<String, dynamic> kategori) {
    TextEditingController _titleController =
        TextEditingController(text: kategori['title']);
    TextEditingController _coursesController =
        TextEditingController(text: kategori['courses']);
    TextEditingController _imageController =
        TextEditingController(text: kategori['image']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Kategori'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _coursesController,
                decoration: const InputDecoration(labelText: 'Courses'),
              ),
              TextField(
                controller: _imageController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                // Panggil fungsi buat ngubah data
                widget.ubahKategori(
                  kategori['id'],
                  _titleController.text,
                  _coursesController.text,
                  _imageController.text,
                );
                Navigator.of(context).pop();
                setState(() {}); // Refresh halaman
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}