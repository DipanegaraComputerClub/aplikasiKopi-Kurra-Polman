import 'package:flutter/material.dart';
import 'package:kopi_oai/MapsDesa.dart';
import 'package:kopi_oai/screens/tampilanPetani.dart';
import 'package:kopi_oai/screens/cuaca.dart';
import 'package:kopi_oai/screens/update.dart';
import 'package:marquee/marquee.dart';

class Dashboard extends StatefulWidget {
  final String nama;

  const Dashboard({Key? key, required this.nama}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Map<String, dynamic>> containerData = [
    {
      'text': 'Container 1',
      'image': 'assets/icon/profil_desa.png',
      'route': '/ProfiDessa',
      'isLeft': true
    },
    {
      'text': 'Container 2',
      'image': 'assets/icon/petani.png',
      'route': '/Petani',
      'isLeft': false
    },
    {
      'text': 'Container 3',
      'image': 'assets/icon/cuaca.png',
      'route': '/Cuaca',
      'isLeft': true
    },
    {
      'text': 'Container 4',
      'image': 'assets/icon/update.png',
      'route': '/UpdateTampilan',
      'isLeft': false
    },
  ];

  Widget getScreenByRoute(String route) {
    switch (route) {
      case '/ProfiDessa':
        return MapsDesa();
      case '/Petani':
        return Petani();
      case '/Cuaca':
        return Cuaca();
      case '/UpdateTampilan':
        return UpdateTampilan();
      default:
        return Dashboard(nama: widget.nama);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    var containerWidth = screenWidth * 0.4;
    var containerHeight = screenHeight * 0.15;

    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView(
                  children: containerData.map((data) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                getScreenByRoute(data['route']),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: data['isLeft']
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.end,
                        children: [
                          if (data['text'] == 'Container 1')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  22, 12, 22, 10),
                              child: Text(
                                'Halo\n ${widget.nama}',
                                style: TextStyle(
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.amber[50]),
                              ),
                            ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: containerWidth,
                            alignment: data['isLeft']
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: SizedBox(
                              width: containerWidth,
                              height: containerHeight,
                              child: Image.asset(
                                data['image'],
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            height: 30,
            color: Colors.amber[50],
            child: Marquee(
              text:
                  'Informasi harga nasional komoditi Kopi hari ini Rabu 11/08/2024 | Kopi Arabika Berasan Rp.90.000 | Kopi Robusta Berasan Rp.40.000',
              style: TextStyle(color: Colors.brown[800]),
              scrollAxis: Axis.horizontal,
              blankSpace: 20.0,
              velocity: 50.0,
              pauseAfterRound: Duration(seconds: 0),
            ),
          ),
        ],
      ),
    );
  }
}
