import 'package:flutter/material.dart';
import 'package:gatherease/booking/nilai.dart';

void main() {
  runApp(const MaterialApp(
    home: BookingPage(),
  ));
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _isDipesanSelected = true;

  void _toggleSelection(bool isDipesan) {
    setState(() {
      _isDipesanSelected = isDipesan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Booking',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toggleSelection(true);
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Dipesan',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: _isDipesanSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: _isDipesanSelected
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        if (_isDipesanSelected)
                          Container(
                            height: 4.0,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _toggleSelection(false);
                  },
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              'Selesai',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: !_isDipesanSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: !_isDipesanSelected
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        if (!_isDipesanSelected)
                          Container(
                            height: 4.0,
                            color: Colors.green,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: _isDipesanSelected
                  ? const <Widget>[
                      BookingItem(
                        title: 'Balai Serba Guna',
                        subtitle: 'Gedung aula blok 01',
                        date: '19 April 2024',
                        totalPrice: 'Rp2.000.000',
                        imageUrl: 'assets/places2.png',
                        isCompleted: false,
                      ),
                    ]
                  : const <Widget>[
                      BookingItem(
                        title: 'Balai Serba Guna',
                        subtitle: 'Gedung aula blok 02',
                        date: '19 April 2024',
                        totalPrice: 'Rp2.000.000',
                        imageUrl: 'assets/places2.png',
                        isCompleted: true,
                      ),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookingItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final String date;
  final String totalPrice;
  final String imageUrl;
  final bool isCompleted;

  const BookingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.totalPrice,
    required this.imageUrl,
    required this.isCompleted,
  });

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  bool _isTapped = false;

  void _handleTap() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          color: Colors.white,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        widget.imageUrl,
                        width: 140,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.subtitle,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.date,
                            style: const TextStyle(fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Total Pesanan: ${widget.totalPrice}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.isCompleted)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Berikan penilaian bagi kami atas kunjungan Anda',
                          style: TextStyle(
                              fontSize: 10.5, color: Colors.grey[700]),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NilaiPage()),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF52796F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Nilai',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (_isTapped)
                Container(
                  height: 1.0,
                  color: Colors.black,
                  margin: const EdgeInsets.only(top: 4.0),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
