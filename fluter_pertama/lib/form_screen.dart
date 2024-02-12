import 'package:fluter_pertama/helpers/size_helper.dart';
import 'package:fluter_pertama/output_form_screeen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();
  final _ScaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController namaControler = TextEditingController();
  TextEditingController jkControler = TextEditingController();
  TextEditingController tgllahirControler = TextEditingController();
  TextEditingController agamaControler = TextEditingController();
  String _pilihAgama = " ";
  final List<String> agama = [
    "Islam",
    "Protestand",
    "Khatolik",
    "Budha",
    "Atheis"
  ];

  void initState() {
    tgllahirControler.text = '';
    super.initState();
  }

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
                        Text("Formulir Biodata"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: namaControler,
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
                          height: 10,
                        ),
                        TextFormField(
                          controller: jkControler,
                          decoration: InputDecoration(
                            hintText: "Jenis Kelamin",
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
                          controller: tgllahirControler,
                          decoration: InputDecoration(
                            hintText: "Tanggal Lahir",
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
                                  DateFormat('yyyy-mm-dd').format(pickedDate);
                              setState(() {
                                tgllahirControler.text = tgl;
                              });
                            } else {
                              print("Tanggal Todal Di pilih");
                            }
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                              hintText: "Agama",
                              labelText: "Pilih Agama",
                              border: OutlineInputBorder()),
                          items: agama.map((String items) {
                            int index = 0;
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _pilihAgama = newValue!;
                            });
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
      String nama = namaControler.text;
      String jk = jkControler.text;
      String agama = agamaControler.text;
      String tgllahir = tgllahirControler.text;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputFormScreen(
            nama: nama,
            jk: jk,
            tglLahir: tgllahir,
            agama: agama,
          ),
        ),
      );
    }
  }
}
