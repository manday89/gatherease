import 'package:flutter/material.dart';
import 'package:gatherease/data.dart';
import 'package:gatherease/notif/notifpage.dart';
import 'package:gatherease/pesan/detail.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lokasi Saat Ini',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xff878787),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xFF52796F),
                            ),
                            Text(
                              'Sumbersari, Jember',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0xff101010),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 30,
                              color: Color(0xFF52796F),
                            ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotifPage()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: const Color(0xffEDEDED)),
                        ),
                        child: const Badge(
                          backgroundColor: Color(0xffe74c3c),
                          smallSize: 12,
                          child: Icon(
                            Icons.notifications,
                            size: 27,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  readOnly: true,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SearchPage();
                    }));
                  },
                  decoration: InputDecoration(
                    prefixIcon: const SizedBox(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.search,
                        fill: 1,
                        size: 30,
                        color: Color(0xff878787),
                      ),
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: 100, minHeight: 10),
                    contentPadding: const EdgeInsets.only(left: 10),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff878787),
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
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
              const SizedBox(
                height: 3.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 20, bottom: 0),
                child: Text(
                  'Rekomendasi Untukmu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (
                  context,
                  i,
                ) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(itemIndex: i),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 10.0,
                            color: Color(0xfff2f2f2),
                          ),
                          bottom: BorderSide(
                            width: 2.0,
                            color: Color(0xfff2f2f2),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            dataList[i].imagePath,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        dataList[i].namaTempat,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Rp${NumberFormat('#,##0', 'ID').format(dataList[i].harga)}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF52796F),
                                            fontSize: 10.0,
                                          ),
                                        ),
                                        const Text(
                                          '/days',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff878787),
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  dataList[i].lokasi,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff878787),
                                    fontSize: 13.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      initialRating: dataList[i].rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 25,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '${dataList[i].rating}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: const Color(0xffEDEDED)),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 27,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: const SizedBox(
                        height: 20,
                        width: 20,
                        child: Icon(
                          Icons.search,
                          fill: 1,
                          size: 30,
                          color: Color(0xff878787),
                        ),
                      ),
                      constraints:
                          const BoxConstraints(maxHeight: 100, minHeight: 10),
                      contentPadding: const EdgeInsets.only(left: 20),
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff878787),
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Jember, Indonesia',
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(.2), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
