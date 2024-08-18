import 'package:flutter/material.dart';
import 'package:kopi_oai/profile/sample_petani.dart';

class PetaniData {
  final String imagePath;
  final String name;
  final int age;

  PetaniData({required this.imagePath, required this.name, required this.age});
}

class Petani extends StatefulWidget {
  const Petani({Key? key}) : super(key: key);

  @override
  State<Petani> createState() => _PetaniState();
}

class _PetaniState extends State<Petani> {
  final List<PetaniData> petaniList = [
    PetaniData(
        imagePath: 'assets/images/petani1.jpeg', name: 'Rahmat', age: 37),
    PetaniData(
        imagePath: 'assets/images/petani2.jpeg',
        name: 'Muhamma Rinaldi',
        age: 45),
    PetaniData(
        imagePath: 'assets/images/petani3.jpeg', name: 'Farhan', age: 32),
    PetaniData(
        imagePath: 'assets/images/petani4.jpeg', name: 'Abd Hafiz', age: 40),
    PetaniData(imagePath: 'assets/images/petani5.jpeg', name: 'Hasir', age: 35),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 8),
          Image.asset('assets/KopiOAI.png', height: 50, width: 60),
          Expanded(
            child: ListView.builder(
              itemCount: petaniList.length,
              itemBuilder: (BuildContext context, int index) {
                PetaniData petani = petaniList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SamplePetani(
                          imagePath: petani.imagePath,
                          name: petani.name,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SizedBox(
                          height: 90,
                          child: Container(
                            width: 320,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.orangeAccent, width: 1),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(petani.imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        petani.name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${petani.age} Tahun',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
