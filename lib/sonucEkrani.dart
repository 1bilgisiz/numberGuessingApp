import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Sonucekrani extends StatefulWidget {
  late bool sonuc;

  late int rasgeleSayi2;
  Sonucekrani({super.key, required this.sonuc, required this.rasgeleSayi2});
  @override
  State<Sonucekrani> createState() => _SonucekraniState();
}

class _SonucekraniState extends State<Sonucekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        elevation: 10,
        title: const Text(
          "Sonuç Ekranı",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.sonuc
                ? Image.asset("assets/images/mutlu_resim.png")
                : Image.asset("assets/images/uzgun_resim.png"),
            Text(
              widget.sonuc ? "KAZANDINIZ" : "KAYBETTİNİZ",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Tahmin Edilen Sayı : ${widget.rasgeleSayi2}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                width: 200,
                height: 80,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "TEKRAR DENE",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
