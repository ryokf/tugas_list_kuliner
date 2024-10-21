import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const DetailPage({required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;

    void _onFavoriteButtonPressed() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Menu",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white),
            onPressed: () => _onFavoriteButtonPressed(),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.goNamed(
              'home',
            );
          },
        ),
        backgroundColor: Colors.brown[600],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.item['gambar']!,
                fit: BoxFit.cover,
                height: 250,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.item['nama']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.timer, size: 20, color: Colors.orange,),
                            SizedBox(height: 4),
                            Text(widget.item['waktubuka']!),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.local_fire_department, size: 20, color: Colors.orange),
                            SizedBox(height: 4),
                            Text(widget.item['kalori']!),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(Icons.monetization_on, size: 20, color: Colors.orange),
                            SizedBox(height: 4),
                            Text('Rp ${widget.item['harga']!}'),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(height: 8),
                    Text(
                      widget.item['detail']!,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          widget.item['gambarlain']!.length,
                          (index) {
                            final bahan = widget.item['gambarlain']![index];
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              margin: const EdgeInsets.only(right: 8),
                              child: ClipRRect(
                                child: Image.asset(bahan),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'Bahan:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 100,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          widget.item['bahan']!.length,
                          (index) {
                            final bahan = widget.item['bahan']![index];
                            final key = bahan.keys.first;
                            final value = bahan.values.first;
                            return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                margin: const EdgeInsets.only(right: 8),
                                width: 80,
                                height: 160,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        value,
                                        width: 80,
                                        height: 60,
                                      ),
                                    ),
                                    Text(
                                      key,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
