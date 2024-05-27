import 'package:flutter/material.dart';
import 'package:gatherease/history/catatan.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextFormField(
              readOnly: true,
              autofocus: false,
              keyboardType: TextInputType.text,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Color(0xff878787),
                ),
                contentPadding: const EdgeInsets.only(left: 10),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff878787),
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Nama Gedung',
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(.2), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(.2), width: 1.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Harus diisi';
                }
                return null;
              },
            ),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFF2F2F2),
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: const [
                  HistoryItem(
                    title: 'Balai Serba Guna',
                    subtitle: 'Kec. Kaliwates, Jember',
                    date: '1 Minggu yang lalu',
                    rating: 5.0,
                    imageUrl: 'assets/places2.png',
                    isCompleted: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final double rating;
  final String imageUrl;
  final bool isCompleted;

  const HistoryItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.rating,
    required this.imageUrl,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: const TextStyle(
                            fontSize: 9.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    if (isCompleted)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFF52796F), // button background color
                          foregroundColor: Colors.white, // button text color
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const CatatanPage();
                          }));
                        },
                        child: const Text(
                          'Catatan Kegiatan',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nama Gedung'),
      ),
      body: const Center(
        child: Text('This is the Search Page'),
      ),
    );
  }
}
