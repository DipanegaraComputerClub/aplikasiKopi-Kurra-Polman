import 'package:flutter/material.dart';
import 'package:kopi_oai/screens/DataPetani.dart';
import 'package:kopi_oai/screens/statistikPetani.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateTampilan extends StatefulWidget {
  const UpdateTampilan({Key? key}) : super(key: key);

  @override
  State<UpdateTampilan> createState() => _UpdateTampilanState();
}

class _UpdateTampilanState extends State<UpdateTampilan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/KopiOAI.png',
              width: 30,
            ),
            SizedBox(height: 20), // Spacer

            ElevatedButton(
              onPressed: () {
                const Link = "https://youtu.be/W8CtenNH1XY?si=hV4JWnyXeeuETTaG";
                launchUrl(Uri.parse(Link), mode: LaunchMode.inAppBrowserView);
              },
              child: Text('PROSES PENGOLAHAN BIJI KOPI '),
            ),
            ElevatedButton(
              onPressed: () {
                const Link = "https://youtu.be/ND6C02r0jq8?si=NqR0la5O5PePj2rA";
                launchUrl(Uri.parse(Link), mode: LaunchMode.inAppBrowserView);
              },
              child: Text('PENGELOLAAN PASCA PANEN KOPI'),
            ),
            ElevatedButton(
              onPressed: () {
                const Link =
                    "https://polewalimandarkab.beta.bps.go.id/id/publication/2023/09/26/aaed0166e58e4aef262bf85b/kecamatan-tapango-dalam-angka-2023.html";
                launchUrl(Uri.parse(Link), mode: LaunchMode.inAppBrowserView);
              },
              child: Text('BADAN PUSAT STATISTIK POLEWALI MANDAR'),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataPetani()));
                  },
                  child: Text('DATA PETANI'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatistikPetani()));
                  },
                  child: Text('STATISTIK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://www.youtube.com/watch?v=ND6C02r0jq8';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
