// ignore_for_file: public_member_api_docs, sort_constructors_first
// a form with validation for 8 subjects

import 'package:flutter/material.dart';

import 'data.dart';
import 'display.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  final _key = GlobalKey<FormState>();
  final _math = TextEditingController();
  final _eng = TextEditingController();
  final _kisw = TextEditingController();
  final _bio = TextEditingController();
  final _chem = TextEditingController();
  final _phy = TextEditingController();
  final _hist = TextEditingController();
  final _geo = TextEditingController();
  final _cre = TextEditingController();
  late List<TextEditingController> subjectsCont = [
    _math,
    _eng,
    _kisw,
    _bio,
    _chem,
    _phy,
    _hist,
    _geo,
    _cre,
  ];
  @override
  Widget build(BuildContext context) {
    // Scaffold - Padding - Form - Column - TextFormField(8)- Buton
    return Scaffold(
      appBar: AppBar(
        title: Text('Score sheet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
              key: _key,
              child: Column(
                children: [
                  // Here - TextField
                  Column(
                    children: List.generate(subjects.length, (index) {
                      return TextField(
                        controller: subjectsCont[index],
                        lable: subjects[index],
                      );
                    }),
                  ),

                  // Button
                  OutlinedButton(
                      onPressed: () {
                        // Check Validation
                        var isValid = _key.currentState!
                            .validate(); //knows whether the form is valid
                        if (isValid) {
                          // SUBMIT / Proceede
                          // double - math results
                          //   key    value
                          Map<String, int> results = {
                            'Maths': int.parse(_math.text),
                            'English': int.parse(_eng.text),
                            'Kiswahili': int.parse(_kisw.text),
                            'Biology': int.parse(_bio.text),
                            'Chemistry': int.parse(_chem.text),
                            'Physics': int.parse(_phy.text),
                            'History': int.parse(_hist.text),
                            'CRE': int.parse(_cre.text),
                            'Geography': int.parse(_geo.text),
                          };
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Results(
                                        results: results,
                                      )));
                        } else {
                          // not Valid.
                          return;
                        }
                      },
                      child: const Text('Grade'))
                ],
              )),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  const TextField({
    Key? key,
    required this.controller,
    required this.lable,
  });

  final TextEditingController controller;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // storage point
      decoration: InputDecoration(labelText: lable),
      // validation
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      maxLength: 2,
      validator: (value) {
        // checking to ensure the value provided is a number.
        if (value!.isEmpty || int.tryParse(value) == null) {
          return '$lable Is Not Valid';
        } else {
          return null;
        }
      },
    );
  }
}