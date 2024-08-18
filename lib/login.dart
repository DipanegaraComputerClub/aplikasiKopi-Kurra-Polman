import 'package:flutter/material.dart';
import 'package:kopi_oai/TamuLogin/homeTamu.dart';
import 'package:kopi_oai/no_telefon.dart';

class loginHome extends StatefulWidget {
  const loginHome({super.key});

  @override
  State<loginHome> createState() => _loginHomeState();
}

class _loginHomeState extends State<loginHome> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 50, 0, screenHeight * 0.9),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown[800],
                borderRadius: BorderRadius.circular(80),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 29, 20, 0),
                    child: Text(
                      "SELAMAT DATANG DI KOPI OAI",
                      style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.amber[50]),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Belajar Bertani dan Akses Informasi dengan Mudah",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[50]),
                      softWrap: false,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.15),
                  _buildButton(
                    context,
                    'Masuk Sebagai Tamu',
                    HomeTamu(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildButton(
                    context,
                    'Lanjutkan dengan No Telepon',
                    NoTelefon(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget targetPage) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Container(
      width: screenWidth * 0.5,
      height: screenSize.height * 0.07,
      decoration: BoxDecoration(
        color: Colors.amber[50],
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            },
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
