import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CatatanPage(),
  ));
}

class CatatanPage extends StatefulWidget {
  const CatatanPage({super.key});

  @override
  _CatatanPageState createState() => _CatatanPageState();
}

class _CatatanPageState extends State<CatatanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Catatan Kegiatan',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Balai Serba Guna',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/places2.png',
                        width: 140,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Gedung aula blok 01',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '19 April 2024',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Deskripsi Kegiatan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lokakarya Strategi Pengembangan Pariwisata Jember, yang bertujuan untuk merumuskan strategi pengembangan pariwisata di Jember, dan meningkatkan sinergi pengembangan pariwisata di Jember.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hasil Kegiatan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1. Pemahaman bersama: pertukaran informasi yang bermanfaat antar peserta dan pihak pemerintah tentang kondisi saat ini dan potensi pariwisata Jember.\n2. Rekomendasi Kebijakan: Merumuskan rencana aksi untuk promosi pariwisata yang lebih agresif dan inklusif, dan mengidentifikasi target pengunjung.\n3. Strategi Lembaga: Merumuskan strategi yang menciptakan sinergi antara pihak pemerintah dan pengembang pariwisata yang terlibat dalam pengembangan pariwisata di Jember.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Kritik dan Saran',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Untuk kegiatan serupa di masa mendatang, sebaiknya alokasi waktu acara lebih diperpanjang. Jika terdapat materi dan dokumentasi perlu dibuat secara digital, dan meng-follow up yang terstruktur acara.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
