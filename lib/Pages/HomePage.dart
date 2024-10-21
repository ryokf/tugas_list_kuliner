import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_list_kuliner/Components/MakananCard.dart';
import 'package:tugas_list_kuliner/Data/MakananData.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner Nusantara',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.brown[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list_alt),
                SizedBox(width: 4),
                Text('List Kuliner',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: listMakanan.length,
                itemBuilder: (context, index) {
                  final item = listMakanan[index];
                  return MakananCard(
                    nama: item['nama']!,
                    deskripsi: item['deskripsi']!,
                    harga: item['harga']!,
                    gambar: item['gambar']!,
                    onTap: () {
                      context.goNamed(
                        'detail',
                        extra: item,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


