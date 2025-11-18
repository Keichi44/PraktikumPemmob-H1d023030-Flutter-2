import 'package:flutter/material.dart';
import 'package:h1d023030_tugaas7/widgets/sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const SideMenu(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.blueAccent.shade100,
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang Kembali!',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Ini adalah ruang kreatifmu. Jelajahi fitur-fitur yang tersedia.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Text(
              'Aktivitas Terbaru',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildFeatureCard(
                context,
                icon: Icons.lightbulb_outline,
                title: 'Ide Baru',
                subtitle: '2 Proyek',
                color: Colors.amber,
              ),
              _buildFeatureCard(
                context,
                icon: Icons.bar_chart,
                title: 'Statistik',
                subtitle: 'Lihat Progres',
                color: Colors.lightGreen,
              ),
              _buildFeatureCard(
                context,
                icon: Icons.group,
                title: 'Kolaborasi',
                subtitle: '5 Tim',
                color: Colors.purpleAccent,
              ),
              _buildFeatureCard(
                context,
                icon: Icons.settings,
                title: 'Pengaturan',
                subtitle: 'Kustomisasi',
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
        required String title,
        required String subtitle,
        required Color color}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Anda mengetuk $title'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 10),
              Text(
                title,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
