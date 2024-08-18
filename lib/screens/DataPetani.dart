import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataPetani extends StatefulWidget {
  const DataPetani({super.key});

  @override
  State<DataPetani> createState() => _DataPetaniState();
}

class _DataPetaniState extends State<DataPetani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('komoditi').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Terjadi kesalahan'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Tidak ada data'));
          }

          final komoditiList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: komoditiList.length,
            itemBuilder: (context, index) {
              final komoditi = komoditiList[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    komoditi['varietas'][0].toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                title: Text(
                  komoditi['nama'],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Varietas: ${komoditi['varietas']}, Harga: Rp.${komoditi['harga']}, Stok: ${komoditi['stok']}Kg',
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
