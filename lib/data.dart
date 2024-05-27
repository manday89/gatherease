class Data {
  String imagePath;
  String namaTempat;
  String lokasi;
  int harga;
  double rating;

  Data({
    required this.imagePath,
    required this.namaTempat,
    required this.lokasi,
    required this.harga,
    required this.rating,
  });
}

var dataList = [
  Data(
    imagePath: 'assets/places1.png',
    namaTempat: 'New Sari Utama Convention Hall',
    lokasi: 'Kec. Kaliwates, Jember',
    harga: 2000000,
    rating: 5,
  ),
  Data(
    imagePath: 'assets/places2.png',
    namaTempat: 'Balai Serba Guna',
    lokasi: 'Kec. Kaliwates, Jember',
    harga: 2000000,
    rating: 5,
  ),
  Data(
    imagePath: 'assets/places3.png',
    namaTempat: 'Gedung Soetardjo',
    lokasi: 'Kec. Sumbersari, Jember',
    harga: 2000000,
    rating: 5,
  ),
  Data(
    imagePath: 'assets/places4.png',
    namaTempat: 'Gedung Serbaguna Soetrisno Widjaja',
    lokasi: 'Kec. Kaliwates, Jember',
    harga: 2000000,
    rating: 5,
  ),
  Data(
    imagePath: 'assets/places5.png',
    namaTempat: 'Pendopo Wahyawibawagraha Bupati Jember',
    lokasi: 'Kec. Kaliwates, Jember',
    harga: 2000000,
    rating: 5,
  ),
];
