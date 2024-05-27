import 'package:flutter/material.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({super.key});

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final TextEditingController kecamatanController = TextEditingController();
  final TextEditingController kabupatenController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();

  @override
  void dispose() {
    kecamatanController.dispose();
    kabupatenController.dispose();
    provinsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Alamat'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Logika untuk menyimpan data alamat
              print('Kecamatan: ${kecamatanController.text}');
              print('Kabupaten: ${kabupatenController.text}');
              print('Provinsi: ${provinsiController.text}');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: kecamatanController,
              decoration: const InputDecoration(
                labelText: 'Kecamatan',
                hintText: 'Masukkan Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: kabupatenController,
              decoration: const InputDecoration(
                labelText: 'Kabupaten',
                hintText: 'Masukkan Alamat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: provinsiController,
              decoration: const InputDecoration(
                labelText: 'Provinsi',
                hintText: 'Masukkan Alamat',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
