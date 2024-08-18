import 'package:flutter/material.dart';

class StatistikPetani extends StatefulWidget {
  const StatistikPetani({super.key});

  @override
  State<StatistikPetani> createState() => _StatistikPetaniState();
}

class _StatistikPetaniState extends State<StatistikPetani> {
  // Contoh data per bulan
  final Map<String, int> dataPerBulan = {
    'Jan': 300,
    'Feb': 250,
    'Mar': 400,
    'Apr': 500,
    'Mei': 450,
    'Jun': 350,
    'Jul': 600,
    'Agu': 700,
    'Sep': 650,
    'Okt': 500,
    'Nov': 550,
    'Des': 750,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      appBar: AppBar(
        title: const Text('Statistik Petani Per Bulan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Jumlah Panen per Bulan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: dataPerBulan.length,
                itemBuilder: (context, index) {
                  String bulan = dataPerBulan.keys.elementAt(index);
                  int jumlah = dataPerBulan[bulan]!;
                  return StatistikBar(bulan: bulan, jumlah: jumlah);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatistikBar extends StatelessWidget {
  final String bulan;
  final int jumlah;

  const StatistikBar({
    required this.bulan,
    required this.jumlah,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            bulan,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Container(
                  height: 24,
                  width: MediaQuery.of(context).size.width * (jumlah / 1000),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text('$jumlah kg'),
        ],
      ),
    );
  }
}
