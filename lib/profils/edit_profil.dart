import 'package:flutter/material.dart';
import 'package:gatherease/profils/edit_alamat.dart';
import 'package:gatherease/profils/edit_nama.dart';
import 'package:gatherease/profils/edit_password.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
            SizedBox(width: 53),
            Text(
              'Edit Profil',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    Icons.camera_alt,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildProfileItem(
              context,
              title: 'Nama',
              value: 'Fadhila Amalia',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditNamePage()),
                );
              },
            ),
            const Divider(),
            buildProfileItem(
              context,
              title: 'Alamat',
              value: 'Atur Sekarang',
              valueColor: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditAddressPage()),
                );
              },
            ),
            const Divider(),
            buildProfileItem(
              context,
              title: 'Password',
              value: '***********',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditPasswordPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileItem(BuildContext context,
      {required String title,
      required String value,
      Color? valueColor,
      required VoidCallback onTap}) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(color: valueColor ?? Colors.black),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}
