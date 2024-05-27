import 'package:flutter/material.dart';
import 'package:gatherease/notif/laporan.dart';

class NotifPage extends StatefulWidget {
  const NotifPage({super.key});

  @override
  State<NotifPage> createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 430,
              height: 950,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 22,
                    top: 44,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: const Color(0xFFEDEDED)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.symmetric(vertical: 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 40,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          width: 230,
                          height: 32,
                          child: Text(
                            'Notifikasi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 100,
                    child: Column(
                      children: [
                        _buildNotification(
                          icon: Icons.notifications,
                          title: 'Selamat!',
                          message:
                              'Anda telah menyelesaikan kegiatan pada 19/04/24 kemarin. Segera lakukan pelaporan kegiatan sebagai referensi kegiatan selanjutnya!',
                          buildingName: 'Balai Serba Guna',
                          location: 'Jl. Merdeka No.1',
                          showDetailBox: true,
                          aditionalMessage:
                              'Selesaikan pelaporan kegiatan Anda, dan ditunggu kegiatan lainnya!',
                        ),
                        const SizedBox(height: 10),
                        _buildNotification(
                          icon: Icons.event,
                          title: 'Pengingat!',
                          message:
                              'Jangan lupa acara Anda di Balai Serba Guna.',
                        ),
                        const SizedBox(height: 10),
                        _buildNotification(
                          icon: Icons.notifications,
                          title: 'Selamat!',
                          message:
                              'Anda berhasil booking gedung Balai Serba Guna pada 19/04/24.',
                        ),
                      ],
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

  Widget _buildNotification({
    required IconData icon,
    required String title,
    required String message,
    String? buildingName,
    String? location,
    bool showDetailBox = false,
    String? aditionalMessage,
  }) {
    return Container(
      width: 322,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 178, 198, 194),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 27,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 14,
                        letterSpacing: 0.10,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Color(0xFF121212),
                        fontSize: 12,
                      ),
                    ),
                    if (aditionalMessage != null && !showDetailBox) ...[
                      const SizedBox(height: 5),
                      Text(
                        aditionalMessage,
                        style: const TextStyle(
                          color: Color(0xFF121212),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (showDetailBox) ...[
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LaporanPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/places2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            buildingName ?? '',
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            location ?? '',
                            style: const TextStyle(
                              color: Color(0xFF121212),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 85, 122, 113),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              'Pelaporan Kegiatan',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
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
            if (aditionalMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  aditionalMessage,
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}
