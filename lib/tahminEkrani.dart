import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahminoyunu/sonucEkrani.dart';

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {
  var tfTahmin = TextEditingController();
  int rasgeleSayi = 0;
  int kalanHak = 5;
  String yonledirme = "";

  @override
  void initState() {
    super.initState();
    rasgeleSayi = Random().nextInt(101);
    print("Rasgele sayi : $rasgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        elevation: 10,
        title: const Text(
          "Tahmin Ekranı",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            Text(
              "Yardım : $yonledirme",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                    label: Text("tahmin giriniz..."),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ))),
              ),
            ),
            SizedBox(
              width: 200,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ))),
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });
                  int tahmin = int.parse(tfTahmin.text);
                  if (tahmin == rasgeleSayi) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sonucekrani(
                          sonuc: true,
                          rasgeleSayi2: rasgeleSayi,
                        ),
                      ),
                    );
                    return;
                  }
                  if (tahmin > rasgeleSayi) {
                    setState(() {
                      yonledirme = "tahmini Azalt";
                    });
                  }
                  if (tahmin < rasgeleSayi) {
                    setState(() {
                      yonledirme = "tahmini Artır";
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Sonucekrani(
                          sonuc: false,
                          rasgeleSayi2: rasgeleSayi,
                        ),
                      ),
                    );
                  }
                  tfTahmin.text = "";
                },
                child: const Text(
                  "TAHMİN ET",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
