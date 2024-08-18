import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormPetani extends StatefulWidget {
  const FormPetani({super.key});

  @override
  State<FormPetani> createState() => _FormPetaniState();
}

class _FormPetaniState extends State<FormPetani> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    CollectionReference petaniForm = firebase.collection('PetaniForm');

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("CONTACT APP"),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: petaniForm.get(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var alldata = snapshot.data!.docs;

            return alldata.isNotEmpty
                ? ListView.builder(
                    itemCount: alldata.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(alldata[index]['name'][0]),
                        ),
                        title: Text(alldata[index]['name'],
                            style: TextStyle(fontSize: 20)),
                        subtitle: Text(alldata[index]['phoneNumber'],
                            style: TextStyle(fontSize: 16)),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FormPage(
                                  id: snapshot.data!.docs[index].id,
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_rounded),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
          } else {
            return Center(child: Text("Loading...."));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({this.id});

  final String? id;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference? petaniForm;

  Future<void> getData() async {
    petaniForm = firebase.collection('PetaniForm');

    if (widget.id != null) {
      try {
        var data = await petaniForm!.doc(widget.id).get();
        var item = data.data() as Map<String, dynamic>;

        setState(() {
          nameController.text = item['name'];
          phoneNumberController.text = item['phoneNumber'];
          emailController.text = item['email'];
          addressController.text = item['address'];
        });
      } catch (e) {
        print("Error fetching document: $e");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONTACT FORM"),
        actions: [
          if (widget.id != null)
            IconButton(
              onPressed: () async {
                try {
                  await petaniForm!.doc(widget.id).delete();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                } catch (e) {
                  print("Error deleting document: $e");
                }
              },
              icon: Icon(Icons.delete),
            )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(padding: EdgeInsets.all(16.0), children: [
          SizedBox(height: 10),
          CircleAvatar(
            radius: 30,
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Name',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is Required!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            'Phone Number',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: "Phone Number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Phone Number is Required!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            'Email',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is Required!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          Text(
            'Address',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: addressController,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Address",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Address is Required!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  if (widget.id == null) {
                    await petaniForm!.add({
                      'name': nameController.text,
                      'phoneNumber': phoneNumberController.text,
                      'email': emailController.text,
                      'address': addressController.text
                    });
                  } else {
                    await petaniForm!.doc(widget.id).update({
                      'name': nameController.text,
                      'phoneNumber': phoneNumberController.text,
                      'email': emailController.text,
                      'address': addressController.text
                    });
                  }
                  final snackBar =
                      SnackBar(content: Text('Data saved successfully!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                } catch (e) {
                  print("Error saving data: $e");
                }
              }
            },
          ),
        ]),
      ),
    );
  }
}
