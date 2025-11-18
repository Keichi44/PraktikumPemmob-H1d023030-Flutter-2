
import 'package:flutter/material.dart';
import 'package:h1d023030_tugaas7/widgets/sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.code, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 20),
              const Text(
                'Aplikasi Kreatif',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Versi 1.0.0',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dibuat sebagai bagian dari Tugas 7 Pemrograman Mobile. Aplikasi ini adalah contoh implementasi navigasi, state management sederhana, dan UI dasar menggunakan Flutter.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const Divider(height: 40),
              const Text(
                'Hubungi Kreator',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.public, color: Colors.blue),
                    iconSize: 30,
                    onPressed: () => _launchURL('https://github.com'), // Ganti dengan URL GitHub Anda
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.email, color: Colors.redAccent),
                    iconSize: 30,
                    onPressed: () => _launchURL('mailto:user.kreatif@email.com'),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.link, color: Colors.green),
                    iconSize: 30,
                    onPressed: () => _launchURL('https://www.linkedin.com'), // Ganti dengan URL LinkedIn Anda
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
