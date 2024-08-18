import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kopi_oai/profile/forum_diskusi.dart';
import 'package:kopi_oai/profile/profile_petani.dart';

class SamplePetani extends StatefulWidget {
  final String imagePath;
  final String name;

  const SamplePetani({
    Key? key,
    required this.imagePath,
    required this.name,
  }) : super(key: key);

  @override
  State<SamplePetani> createState() => _SamplePetaniState();
}

class _SamplePetaniState extends State<SamplePetani> {
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController VarietasController = TextEditingController();
  final TextEditingController namaController = TextEditingController();

  final PageController _pageController = PageController();
  int currentIndex = 0;

  List<Widget> screens = [ForumDiskusi(), ProfilePage1()];

  List<Map<String, String>> komoditiData = [
    {
      'description':
          'Memiliki lahan perkebunan kopi seluas satu hektar menunjukkan dedikasinya terhadap pertanian dan khususnya produksi kopi. Jenis kopi yang di tanam adalah kopi Arabika, yang dikenal dengan citarasa halus dan kompleksnya. Pengetahuan tentang berbagai faktor yang memengaruhi pertumbuhan tanaman kopi, seperti iklim, jenis tanah, dan cara pengelolaan lahan tentunya dapat meningkatkan kualitas komoditi yang dimiliki.',
    },
    {
      'description':
          'Natural Pada proses natural, buah kopi yang dikeringkan masih dalam berbentuk buah/ceri, lengkap dengan semua lapisan-lapisannya. Prosesnya yang natural dan alami ini akan membuat ceri terfermentasi secara natural pula karena kulit luar ceri akan terkelupas dengan sendirinya.',
    },
    {
      'description':
          'KOPI BUBUK Penyangraian adalah perpaduan antara suhu dan waktu untuk mengubah struktur dan sifat kimia dengan perlakukan panas yang bertujuan untuk membentuk aroma dan citarasa yang khas pada kopi seduhan. Pada proses penyangraian terjadi pengurangan kadar air yang disertai dengan penguapan senyawa volatil yang terkadung dalam biji kopi, sehingga ketika proses sangrai berlangsung akan tercium harumnya aroma kopi sangrai. ',
    },
  ];

  Widget buildPage(String description, double fontSize) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Deskripsi (jika diperlukan)
        Container(
          margin: EdgeInsets.symmetric(horizontal: fontSize * 1.0),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
            ),
          ),
        ),
        SizedBox(height: 16 * fem),
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5 * fem),
              width: 100 * fem,
              height: 40 * fem,
              decoration: BoxDecoration(color: Colors.brown),
              child: TextFormField(
                controller: namaController, // gunakan controller baru ini
                decoration: InputDecoration(
                  hintText: 'Nama',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10 * fem,
                      vertical: 10 * fem), // Menambahkan padding vertikal
                  hintStyle: TextStyle(color: Colors.white, fontSize: 12 * fem),
                ),
                style: TextStyle(fontSize: 12 * fem, color: Colors.white),
                textAlign: TextAlign
                    .center, // Menyusun teks secara horizontal di tengah
                textAlignVertical: TextAlignVertical
                    .center, // Menyusun teks secara vertikal di tengah
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5 * fem),
              width: 100 * fem,
              height: 40 * fem,
              decoration: BoxDecoration(color: Colors.brown),
              child: TextFormField(
                controller: hargaController,
                decoration: InputDecoration(
                  hintText: 'Harga',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10 * fem),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 12 * fem),
                ),
                style: TextStyle(fontSize: 12 * fem, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5 * fem),
              width: 100 * fem,
              height: 40 * fem,
              decoration: BoxDecoration(color: Colors.brown),
              child: TextFormField(
                controller: stokController,
                decoration: InputDecoration(
                  hintText: 'Stok',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10 * fem),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 12 * fem),
                ),
                style: TextStyle(fontSize: 12 * fem, color: Colors.white),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5 * fem),
              width: 80 * fem,
              height: 40 * fem,
              decoration: BoxDecoration(color: Colors.brown),
              child: TextFormField(
                controller: VarietasController,
                decoration: InputDecoration(
                  hintText: 'Varietas',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 9 * fem),
                  hintStyle: TextStyle(color: Colors.white, fontSize: 12 * fem),
                ),
                style: TextStyle(fontSize: 12 * fem, color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                String nama = namaController.text;
                String harga = hargaController.text;
                String stok = stokController.text;
                String varietas = VarietasController.text;

                if (harga.isEmpty ||
                    stok.isEmpty ||
                    varietas.isEmpty ||
                    nama.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Semua bidang harus diisi!'),
                  ));
                  return;
                }

                try {
                  await FirebaseFirestore.instance.collection('komoditi').add({
                    'harga': harga,
                    'stok': stok,
                    'varietas': varietas,
                    'nama': nama,
                    'timestamp': FieldValue.serverTimestamp(),
                  });

                  hargaController.clear();
                  stokController.clear();
                  VarietasController.clear();
                  namaController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Data berhasil disimpan!'),
                  ));
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Terjadi kesalahan: $error'),
                  ));
                }
              },
              height: 40 * fem,
              minWidth: 20 * fem,
              color: Colors.red.shade400,
              child: Text(
                'Simpan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12 * fem,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var fontSize = screenWidth * 0.04;

    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: IndexedStack(
        index: currentIndex,
        children: [
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: fontSize * 1.6,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.1),
                  Container(
                    height: screenWidth * 0.15,
                    width: screenWidth * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                height: screenHeight * 0.5,
                width: screenWidth * 1.2,
                decoration: BoxDecoration(
                  color: Color.fromARGB(96, 181, 181, 181),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: PageView(
                  controller: _pageController,
                  children: komoditiData.map((data) {
                    return buildPage(
                      data['description']!,
                      fontSize,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                height: screenHeight * 0.27,
                width: screenWidth * 11.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton(
                      context,
                      Icons.landscape,
                      'Lahan & \n Komoditi',
                      0,
                      screenWidth,
                      screenHeight,
                    ),
                    _buildIconButton(
                      context,
                      Icons.propane,
                      'Pengelolahan \n pra & pasca Panen',
                      1,
                      screenWidth,
                      screenHeight,
                    ),
                    _buildIconButton(
                      context,
                      Icons.production_quantity_limits,
                      'Produk \n Kopi',
                      2,
                      screenWidth,
                      screenHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
          screens[0], // Forum Diskusi
          screens[1], // Petani Profil
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Forum Diskusi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String label,
      int page, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        _pageController.jumpToPage(page);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: screenWidth * 0.2,
                height: screenWidth * 0.2,
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  shape: BoxShape.circle,
                ),
              ),
              Icon(
                icon,
                color: Colors.amber,
                size: screenWidth * 0.1,
              ),
            ],
          ),
          Text(
            textAlign: TextAlign.center,
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
