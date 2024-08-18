import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsDesa extends StatefulWidget {
  const MapsDesa({super.key});

  @override
  State<MapsDesa> createState() => _MapsDesaState();
}

class _MapsDesaState extends State<MapsDesa> {
  // Fungsi untuk membuka Google Maps pada koordinat tertentu
  Future<void> _openMap(String latitude, String longitude) async {
    final url = 'https://www.google.com/maps/?q=$latitude,$longitude';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Anda bisa mengakses lokasi lahan komoditi kopi pada Maps di bawah ini dengan cara klik ikon lokasi berwarna merah pada maps, kemudian anda akan terhubung ke google maps untuk informasi rute ke lokasi yang telah ditentukan sebelumnya, terimakasih',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white),
              ),
            ),
            InteractiveViewer(
              panEnabled: true, // Mengizinkan panning
              minScale: 0.5, // Skala minimum saat zoom out
              maxScale: 4.0, // Skala maksimum saat zoom in
              child: Stack(
                children: [
                  // Gambar yang akan ditampilkan di latar belakang
                  Image.asset(
                    'assets/MapsDesaKurra.png',
                    width: 325,
                    height: 250,
                  ),
                  // Posisi dan aksi ikon pertama
                  Positioned(
                    top: 40,
                    left: 90,
                    child: GestureDetector(
                      onTap: () {
                        _openMap('-3.273305', '119.301110');
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // Posisi dan aksi ikon kedua
                  Positioned(
                    top: 50,
                    right: 130,
                    child: GestureDetector(
                      onTap: () {
                        _openMap('-3.299710', '119.322562');
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // Posisi dan aksi ikon ketiga
                  Positioned(
                    bottom: 80,
                    left: 70,
                    child: GestureDetector(
                      onTap: () {
                        _openMap('-3.299311', '119.316790');
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  // Posisi dan aksi ikon keempat
                  Positioned(
                    bottom: 60,
                    right: 80,
                    child: GestureDetector(
                      onTap: () {
                        _openMap('-3.272137', '119.318939');
                      },
                      child: Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Desa Kurrak berada di Kecamatan Tapango, Polewali Mandar, Sulawesi Barat. Desa Kurrak merupakan desa pada ketinggian antara 300-1200 mdpl dengan luas 6,25 km2, memiliki kawasan hutan dan merupakan daerah paling tinggi dalam wilayah Kec. Tapango Kab. Polewali Mandar. Suhu rata-rata Desa Kurrak berkisar pada 23,50C, curah hujan rata-rata 1.678 mm/tahun dan kelembapannya berkisar 79,99% dan area perkebunan Kopi pada tahun 2020 di Desa Kurrak adalah 100 hektar seluruhnya.',
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
