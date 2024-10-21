import 'package:flutter/material.dart';

class MakananCard extends StatelessWidget {
  final String nama;
  final String deskripsi;
  final String harga;
  final String gambar;
  final VoidCallback onTap;

  MakananCard({
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.gambar,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[50],
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading:
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(gambar, width: 60, height: 60, fit: BoxFit.cover)),
        title: Text(nama, style: TextStyle(fontWeight: FontWeight.w500),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(deskripsi),
            Text(harga)
          ],
        ),
        trailing: Icon(Icons.restaurant, color: Colors.orange),
        onTap: onTap,
      ),
    );
  }
}