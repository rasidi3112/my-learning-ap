import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'beranda.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Changed to LoginPage
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Shared Preferences instance
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Load saved preferences (if any)
  _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _phoneNumberController.text = prefs.getString('phoneNumber') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
    });
  }

  // Save user credentials to Shared Preferences
  _saveCredentials(String phoneNumber, String email) async {
    await prefs.setString('phoneNumber', phoneNumber);
    await prefs.setString('email', email);
  }

  // Validate user credentials (dummy validation)
  bool _validateCredentials(String phoneNumber, String email) {
    // Replace with your actual authentication logic
    return phoneNumber.isNotEmpty && email.contains('@');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      Container(
                        width: 375,
                        height: 812,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 375,
                                height: 44,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '9:41',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Opacity(
                                          opacity: 0.35,
                                          child: Container(
                                            width: 22,
                                            height: 11.33,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              border: Border.all(color: Colors.black, width: 1),
                                              borderRadius: BorderRadius.circular(2.67),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Container(
                                          width: 18,
                                          height: 7.33,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(1.33),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 67,
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 111,
                              child: SizedBox(
                                width: 335,
                                child: Text(
                                  'Login dulu semeton\natau Sign In',
                                  style: const TextStyle(
                                    color: Color(0xFF161C2B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 211,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nomor Telepon',
                                    style: TextStyle(
                                      color: Color(0xFF161C2B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 335,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: const Color(0xFFE9E9F1)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.phone_android, color: Color(0xFFA3A3AE)),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: TextField(
                                              controller: _phoneNumberController,
                                              decoration: const InputDecoration(
                                                hintText: '+62 8 XXXXXXXXXX',
                                                hintStyle: TextStyle(color: Color(0xFFA3A3AE)),
                                                border: InputBorder.none,
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 315,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      color: Color(0xFF161C2B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: 335,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: const Color(0xFFE9E9F1)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.email, color: Color(0xFFA3A3AE)),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: TextField(
                                              controller: _emailController,
                                              decoration: const InputDecoration(
                                                hintText: 'example@gmail.com',
                                                hintStyle: TextStyle(color: Color(0xFFA3A3AE)),
                                                border: InputBorder.none,
                                              ),
                                              keyboardType: TextInputType.emailAddress,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 423,
                              child: Container(
                                width: 335,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4E74F9),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.24),
                                      offset: const Offset(0, 2),
                                      blurRadius: 2,
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      offset: const Offset(0, 0),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    String phoneNumber = _phoneNumberController.text;
                                    String email = _emailController.text;

                                    if (_validateCredentials(phoneNumber, email)) {
                                      _saveCredentials(phoneNumber, email);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Beranda()),
                                      );
                                    } else {
                                      // Show error message
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Invalid credentials. Please check your input.'),
                                        ),
                                      );
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 500,
                              child: Container(
                                width: 335,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4E74F9),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.24),
                                      offset: const Offset(0, 2),
                                      blurRadius: 2,
                                    ),
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.12),
                                      offset: const Offset(0, 0),
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    // Implement Sign In logic here
                                    // For example, navigate to a registration page
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 16.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 121,
                              bottom: 20,
                              child: Container(
                                width: 134,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}