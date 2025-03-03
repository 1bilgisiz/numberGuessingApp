import 'package:flutter/material.dart';
import 'package:sayitahminoyunu/tahminEkrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black,
        elevation: 10,
        title: const Text(
          "Anasayfa",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "TAHMİN OYUNU",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Image.asset("assets/images/zar_resim.png"),
            SizedBox(
              width: 200,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Tahminekrani()));
                },
                child: const Text(
                  "OYUNA BAŞLA",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
