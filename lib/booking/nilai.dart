import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NilaiPage extends StatefulWidget {
  const NilaiPage({super.key});

  @override
  _NilaiPageState createState() => _NilaiPageState();
}

class _NilaiPageState extends State<NilaiPage> {
  double rating = 0;
  TextEditingController _nilaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nilai'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('KIRIM', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: const Text('Balai Serba Guna'),
              subtitle: const Text('Gedung aula blok 01\n19 April 2024'),
              trailing: Image.asset('assets/places2.png', width: 100),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Beri rating', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  setState(() {
                    this.rating = rating;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Keterangan', style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _nilaiController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Tambahkan keterangan',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
