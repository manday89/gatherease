import 'package:flutter/material.dart';

class FAQSPage extends StatelessWidget {
  const FAQSPage({super.key});

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
            SizedBox(width: 85),
            Text(
              'Faq',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: const [
          FAQTile(
            question:
                'Bagaimana cara mencari gedung atau tempat untuk acara saya di Gatherease?',
            answer:
                'Anda dapat mencari gedung atau tempat dengan menggunakan fitur pencarian di aplikasi kami. Masukkan detail acara Anda, dan kami akan memberikan rekomendasi tempat yang sesuai.',
          ),
          FAQTile(
            question:
                'Apa saja informasi yang perlu saya siapkan sebelum melakukan pemesanan gedung melalui Gatherease?',
            answer:
                'Informasi yang perlu disiapkan meliputi tanggal acara, jumlah tamu, dan jenis acara. Pastikan Anda juga memiliki anggaran yang telah ditentukan.',
          ),
          FAQTile(
            question:
                'Bagaimana cara melakukan pembayaran untuk pemesanan gedung melalui Gatherease?',
            answer:
                'Pembayaran dapat dilakukan melalui berbagai metode yang tersedia di aplikasi kami, termasuk transfer bank dan pembayaran online lainnya.',
          ),
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const FAQTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
