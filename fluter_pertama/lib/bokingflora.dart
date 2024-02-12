import 'package:fluter_pertama/hasilflora.dart';
import 'package:fluter_pertama/helpers/size_helper.dart';
import 'package:fluter_pertama/output_form_screeen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FloraBoking extends StatefulWidget {
  const FloraBoking({Key? key}) : super(key: key);

  @override
  State<FloraBoking> createState() => _FloraBokingState();
}

class _FloraBokingState extends State<FloraBoking> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tglController = TextEditingController();
  String _pilihFlora = " ";
  final List<String> flora = [
    "Taman Bungeong Jeumpa",
    "Taman Kenanga",
    "Taman Anggrek Hitam",
    "Taman Rafflesia",
    "Taman Kantil"
  ];

  final Map<String, double> floraPrices = {
    "Taman Bungeong Jeumpa": 100000.0,
    "Taman Kenanga": 50000.0,
    "Taman Anggrek Hitam": 100000.0,
    "Taman Rafflesia": 70000.0,
    "Taman Kantil": 30000.0,
  };

  final Map<String, String> floraImages = {
    "Taman Bungeong Jeumpa": "assets/img/jema.jpg",
    "Taman Kenanga": "assets/img/kenanga.jpg",
    "Taman Anggrek Hitam": "assets/img/agh.jpg",
    "Taman Rafflesia": "assets/img/raflesia.jpg",
    "Taman Kantil": "assets/img/kantil.jpeg",
  };

  double selectedFloraPrice = 0;
  String selectedimage = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Formulir Boking"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: namaController,
                          decoration: InputDecoration(
                            hintText: "Nama Lengkap",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Data';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              hintText: "Tiket",
                              labelText: "Pilih Tiket",
                              border: OutlineInputBorder()),
                          items: flora.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _pilihFlora = newValue!;
                              selectedFloraPrice =
                                  floraPrices[_pilihFlora] ?? 0;
                              selectedimage = floraImages[_pilihFlora] ?? '';
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: jumlahController,
                          decoration: InputDecoration(
                            hintText: "Jumlah Tiket",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Data';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: tglController,
                          decoration: InputDecoration(
                            hintText: "Tanggal Boking",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Input Data';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String tgl =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                tglController.text = tgl;
                              });
                            } else {
                              print("Tanggal Tidak Dipilih");
                            }
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        SizedBox(
                          width: displayHeight(context) * 0.8,
                          height: displayHeight(context) * 0.075,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.white60)),
                              ),
                            ),
                            child: Text("Simpan"),
                            onPressed: () {
                              _submit();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      _formKey.currentState!.save();
      String nama = namaController.text;
      String jumlah = jumlahController.text;
      String tgl = tglController.text;
      String img = selectedimage;
      double totalHarga = double.parse(jumlah) * selectedFloraPrice;
      print(img);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputFloraScreen(
            nama: nama,
            jumlah: jumlah,
            tgl: tgl,
            flora: _pilihFlora,
            selectedFloraPrice: selectedFloraPrice,
            totalHarga: totalHarga,
            floraImage: img,
          ),
        ),
      );
    }
  }
}
