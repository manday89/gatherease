import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  _LaporanPageState createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final _descriptionController = TextEditingController();
  final _resultController = TextEditingController();
  final _suggestionController = TextEditingController();

  bool _isSending = false;

  void _sendData() async {
    setState(() {
      _isSending = true;
    });

    setState(() {
      _isSending = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 22),
            Text(
              'Pelaporan Kegiatan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _isSending ? null : _sendData,
            child: _isSending
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Text(
                    'KIRIM',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balai Serba Guna',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/places2.png'),
                      width: 140,
                      height: 75,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gedung aula blok 01'),
                        Text('19 April 2024'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Kegiatan',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textAlignVertical: TextAlignVertical.top,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _resultController,
              decoration: const InputDecoration(
                labelText: 'Hasil Kegiatan',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textAlignVertical: TextAlignVertical.top,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _suggestionController,
              decoration: const InputDecoration(
                labelText: 'Kritik dan Saran',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
              textAlignVertical: TextAlignVertical.top,
            ),
          ],
        ),
      ),
    );
  }
}
