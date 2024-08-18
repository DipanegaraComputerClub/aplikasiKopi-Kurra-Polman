import 'package:flutter/material.dart';

class ProfiDessa extends StatefulWidget {
  const ProfiDessa({super.key});

  @override
  State<ProfiDessa> createState() => _ProfiDessaState();
}

class _ProfiDessaState extends State<ProfiDessa> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                buildPage(
                  'assets/images/profilDesa5.jpeg',
                  'Kurrak adalah kelurahan di kecamatan Polewali, Kabupaten Polewali Mandar, Sulawesi Barat, Indonesia. Program tanaman kopi robusta dan kopi arabika menjadi inovasi Desa Kurrak Kecamatan Tapango Kabupaten Polewali Mandar. Hasilnya dinikmati warga Desa Kurrak dan menjadi sumber penghasilan masyarakat setempat.',
                  0,
                  context,
                ),
                buildPage(
                  'assets/images/profilDesa2.jpeg',
                  'Saat ini kopi Kurrak sudah menembus pasar Nasional yakni Jakarta, Pulau Jawa, Kalimantan, Sulawesi, dan beberapa daerah lainnya. Selain itu, beberapa pengunjung dari lintas daerah juga sudah datang berkunjung ke kebun Kopi Kurrak yang berbatasan dengan Kabupaten Mamasa.',
                  1,
                  context,
                ),
                buildPage(
                  'assets/images/profilDesa3.jpeg',
                  'Kopi Kurrak saat ini juga sudah menjadi oleh-oleh khas Polewali Mandar yang biasanya diborong oleh pengunjung yang datang dari luar daerah dan provinsi di Indonesia. Selain harga yang terjangkau, Kopi Kurrak ini memiliki rasa khas yang membuatnya laris terjual.',
                  2,
                  context,
                ),
                buildPage(
                  'assets/images/profilDesa4.jpeg',
                  'Kurrak adalah kelurahan di kecamatan Polewali, Kabupaten Polewali Mandar, Sulawesi Barat, Indonesia. Program tanaman kopi robusta dan kopi arabika menjadi inovasi Desa Kurrak Kecamatan Tapango Kabupaten Polewali Mandar. Hasilnya dinikmati warga Desa Kurrak dan menjadi sumber penghasilan masyarakat setempat.',
                  3,
                  context,
                ),
              ],
            ),
          ),
          buildCircleIndicator(),
        ],
      ),
    );
  }

  Widget buildPage(
      String imagePath, String text, int index, BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var fontSize = screenWidth * 0.04;
    var imageSize = screenWidth * 0.8;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(screenWidth * 0.05),
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: imageSize,
                  height: imageSize,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: screenHeight * 0.0),
              child: Image.asset(
                'assets/KopiOAI.png',
                width: screenWidth * 0.15,
                height: screenHeight * 0.15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCircleIndicator() {
    var iconSize = MediaQuery.of(context).size.width * 0.05;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (i) {
            return GestureDetector(
              onTap: () {
                _pageController.jumpToPage(i);
              },
              child: CircleAvatar(
                radius: iconSize * 0.6,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.circle,
                  size: iconSize,
                  color: _pageController.hasClients &&
                          _pageController.page?.round() == i
                      ? Colors.black
                      : Colors.black.withOpacity(0.5),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
