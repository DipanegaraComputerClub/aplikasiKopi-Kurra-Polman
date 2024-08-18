import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kopi_oai/home/DashboardUtama.dart';

class NoTelefon extends StatefulWidget {
  const NoTelefon({Key? key}) : super(key: key);

  @override
  State<NoTelefon> createState() => _NoTelefonState();
}

class _NoTelefonState extends State<NoTelefon> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _nama = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    _nama.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Masukkan nama:',
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              style: TextStyle(color: Colors.white),
              controller: _nama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Masukkan nama',
                hintStyle: TextStyle(color: Colors.white),
              ),
              // Hapus inputFormatters atau gunakan yang sesuai untuk teks
            ),
            Text(
              'Masukkan nomor telepon:',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Contoh: 08123456789',
                hintStyle: TextStyle(color: Colors.white),
                errorText: _errorText,
              ),
              style: TextStyle(color: Colors.white), // Warna teks putih
              onChanged: (value) {
                setState(() {
                  _errorText = validatePhoneNumber(value);
                });
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty && _nama.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(nama: _nama.text),
                    ),
                  );
                } else {
                  setState(() {
                    _errorText = 'Nama dan nomor telepon harus diisi';
                  });
                }
              },
              child: Center(child: Text('LOGIN')),
            ),
          ],
        ),
      ),
    );
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }
    // Contoh validasi sederhana, bisa disesuaikan dengan kebutuhan
    if (value.length < 10) {
      return 'Nomor telepon minimal 10 digit';
    }
    return null;
  }
}
