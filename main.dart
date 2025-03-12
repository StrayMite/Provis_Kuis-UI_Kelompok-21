import 'package:flutter/material.dart';

void main() {
  runApp(SuperApp());
}

class SuperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UPI SuperApp',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: StartScreen(), // Screen pertama
    );
  }
}

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz 1 Kelompok 21'),
        centerTitle: true, // Menjadikan judul di tengah
        automaticallyImplyLeading: false, // Tidak ada tombol back
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _menuButton(context, 'Main Screen', MainScreen()),
            _menuButton(context, 'Mental Health', MentalHealthScreen()),
            _menuButton(context, 'Akademik', AkademikScreen()),
            _menuButton(context, 'Keuangan', KeuanganScreen()),
            _menuButton(context, 'Medsos', MedsosScreen()),
            _menuButton(context, 'E-learning', ELearningScreen()),
            _menuButton(context, 'Jadwal & Todo', JadwalTodoScreen()),
            _menuButton(context, 'Pesan & Group', PesanGroupScreen()),
            _menuButton(context, 'Notifikasi', NotifikasiScreen()),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Text(title),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'cari pengumuman, materi kuliah',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotifikasiScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, size: 30),
            onPressed: () {
              _showProfile(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Menambah jarak dari search bar ke pengumuman

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image, size: 50),
                                  Container(
                                    width: 80,
                                    height: 2,
                                    color: Colors.black,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Beasiswa Sampurna',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Beasiswa untuk siswa berprestasi.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Minimal mahasiswa semester 5.',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Tap untuk rincian',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kuliah hari ini ...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Desain Pemograman Berbasis Objek, 13.00 - 15.30, C-308',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 16),
                Text(
                  'Tugas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Analisis dan Desain Algoritma, WS-1, 23.59',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          
          Spacer(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _menuIconItem(Icons.favorite_border, 'Mental Health', context, MentalHealthScreen()),
                _menuIconItem(Icons.folder, 'Akademik', context, AkademikScreen()),
                _menuIconItem(Icons.cut, 'Keuangan', context, KeuanganScreen()),
              ],
            ),
          ),
          
          SizedBox(height: 16), // Menambah jarak dengan bottom navigation bar
          
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bottomNavItem(Icons.sentiment_satisfied_alt, 'Medsos', context, MedsosScreen()),
                _bottomNavItem(Icons.wb_sunny_outlined, 'E-learning', context, ELearningScreen()),
                _bottomNavItem(Icons.calendar_today_outlined, 'Jadwal & todo', context, JadwalTodoScreen()),
                _bottomNavItem(Icons.chat_bubble_outline, 'pesan & group', context, PesanGroupScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _menuIconItem(IconData icon, String title, BuildContext context, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        width: 80,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, color: Colors.purple),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, BuildContext context, Widget screen) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 24, color: Colors.grey[700]),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  void _showProfile(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.pinimg.com/736x/cc/4a/1c/cc4a1c4d77bf333de1c03b6b5c8535b6.jpg'),
              ),
              SizedBox(height: 16),
              Text(
                'Nama Pengguna',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'email@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk edit profil
                },
                child: Text('Edit Profil'),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Kesehatan Mental'),
actions: [
  SizedBox(height: 20),
  ElevatedButton(
    onPressed: () {
      // Navigasi ke halaman konseling atau fitur lainnya
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple, // Warna latar belakang ungu
      foregroundColor: Colors.white, // Warna teks putih
    ),
    child: Text('Hubungi Konselor'),
  ),
],

      ),
  
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '1. Miliki Pola Hidup Sehat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Pola hidup yang sehat terdiri dari pola makan sehat dan aktivitas fisik teratur, yang tidak hanya bermanfaat bagi kesehatan fisik, tapi juga mental.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Pola Makan Sehat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Makanlah makanan yang mengandung nutrisi lengkap dan seimbang termasuk: Karbohidrat, Protein, Buah dan sayur. Karbohidrat meningkatkan serotonin yang menenangkan suasana hati, dan asam lemak omega-3 meningkatkan fungsi kognitif otak.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Aktivitas Fisik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lakukan aktivitas fisik secara rutin minimal 30 menit setiap hari, seperti berjalan kaki, berkebun, atau mengerjakan pekerjaan rumah tangga.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '2. Kelola Stres dengan Baik',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Kenali stres yang dapat dihindari dan tidak dapat dihindari. Pelajari teknik-teknik meredakan stres seperti yoga, meditasi, teknik pernapasan, dan relaksasi.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '3. Cukup Beristirahat',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Luangkan waktu untuk beristirahat agar tidak mengalami burnout. Pastikan tidur cukup di jam yang teratur.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '4. Tetap Terhubung dengan Orang Lain',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Pertahankan hubungan yang baik dengan keluarga dan teman. Membantu orang lain juga bisa meningkatkan kepercayaan diri.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '5. Sediakan Waktu untuk Diri Sendiri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Lakukan hobi, self-care, dan refleksi diri untuk menjaga kesehatan mental.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '6. Menerima Diri dan Menetapkan Tujuan yang Realistis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Menerima kelebihan dan kekurangan diri sendiri dapat meningkatkan harga diri dan membantu menetapkan tujuan yang realistis.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '7. Cari Hal-hal yang Patut Disyukuri',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Rasa syukur dapat meningkatkan kesejahteraan mental. Tuliskan hal-hal yang disyukuri setiap hari.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '8. Hindari Alkohol, Rokok, dan Obat Terlarang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Zat adiktif hanya memberikan efek sementara dan menimbulkan ketergantungan.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '9. Bicarakan Perasaanmu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Membuka diri dan berbicara dengan orang lain dapat membantu mengatasi permasalahan dan meningkatkan kesejahteraan mental.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                '10. Minta Bantuan',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Jika perasaan yang dialami terlalu berat, jangan ragu mencari dukungan dari tenaga profesional atau kelompok dukungan.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JadwalKuliahScreen extends StatelessWidget {
  const JadwalKuliahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Kuliah'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Senin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildJadwalItem('07.00 - 08.40', 'Big Data Platform', 'S-304'),
            _buildJadwalItem('13.00 - 15.30', 'Desain Pemrograman Berbasis Objek', 'C-308'),
            _buildJadwalItem('15.30 - 18.50', 'Proyek Konsultasi', 'B-205'),
            SizedBox(height: 20),
            Text(
              'Selasa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildJadwalItem('07.00 - 09.30', 'Analisa dan Desain Algoritma', 'C-107'),
            _buildJadwalItem('09.30 - 12.00', 'Pemrograman Visual dan Piranti Bergerak', 'C-302'),
            SizedBox(height: 20),
            Text(
              'Kamis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildJadwalItem('09.30 - 12.00', 'Metodologi Penelitian', 'B-205'),
            _buildJadwalItem('15.30 - 18.30', 'Sistem Operasi', 'C-303'),
          ],
        ),
      ),
    );
  }

  Widget _buildJadwalItem(String waktu, String matkul, String ruangan) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            waktu,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            matkul,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            ruangan,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class NilaiSemesterScreen extends StatelessWidget {
  const NilaiSemesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Semester'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNilaiItem('Struktur Data', '4.0'),
            _buildNilaiItem('Data Mining', '3.7'),
            _buildNilaiItem('Jaringan Komputer', '4.0'),
            _buildNilaiItem('Machine Learning', '3.6'),
            _buildNilaiItem('AI', '4.0'),
            _buildNilaiItem('Sistem Informasi', '3.4'),
          ],
        ),
      ),
    );
  }

  Widget _buildNilaiItem(String matkul, String nilai) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            matkul,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            nilai,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class AkademikScreen extends StatelessWidget {
  const AkademikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data mata kuliah
    final List<Map<String, dynamic>> mataKuliah = [
      {'no': 1, 'thnSmt': '2023-1', 'kode': 'HU300', 'mataKuliah': 'PENGANTAR PENDIDIKAN', 'sks': 2, 'nilai': 3.8},
      {'no': 2, 'thnSmt': '2023-1', 'kode': 'IK100', 'mataKuliah': 'ALGORITMA DAN PEMROGRAMAN 1', 'sks': 3, 'nilai': 3.5},
      {'no': 3, 'thnSmt': '2023-1', 'kode': 'IK110', 'mataKuliah': 'KALKULUS', 'sks': 3, 'nilai': 4.0},
      {'no': 4, 'thnSmt': '2023-1', 'kode': 'IK130', 'mataKuliah': 'LOGIKA INFORMATIKA', 'sks': 3, 'nilai': 3.7},
      {'no': 5, 'thnSmt': '2023-1', 'kode': 'IK200', 'mataKuliah': 'ARSITEKTUR DAN ORGANISASI KOMPUTER', 'sks': 3, 'nilai': 3.8},
      {'no': 6, 'thnSmt': '2023-1', 'kode': 'IK260', 'mataKuliah': 'TEORI BAHASA DAN AUTOMATA', 'sks': 3, 'nilai': 3.7},
      {'no': 7, 'thnSmt': '2023-1', 'kode': 'KU100', 'mataKuliah': 'PENDIDIKAN AGAMA ISLAM', 'sks': 2, 'nilai': 4.0},
      {'no': 8, 'thnSmt': '2023-1', 'kode': 'KU105', 'mataKuliah': 'PENDIDIKAN KEWARGANEGARAAN', 'sks': 2, 'nilai': 3.7},
      {'no': 9, 'thnSmt': '2023-1', 'kode': 'KU106', 'mataKuliah': 'PENDIDIKAN BAHASA INDONESIA', 'sks': 2, 'nilai': 4.0},
      {'no': 10, 'thnSmt': '2023-2', 'kode': 'IK160', 'mataKuliah': 'ALGORITMA DAN PEMROGRAMAN 2', 'sks': 3, 'nilai': 3.5},
      {'no': 11, 'thnSmt': '2023-2', 'kode': 'IK170', 'mataKuliah': 'SISTEM BASIS DATA', 'sks': 3, 'nilai': 3.0},
      {'no': 12, 'thnSmt': '2023-2', 'kode': 'IK220', 'mataKuliah': 'SISTEM KONTROL', 'sks': 3, 'nilai': 3.7},
      {'no': 13, 'thnSmt': '2023-2', 'kode': 'IK230', 'mataKuliah': 'DESIGN DAN PEMROGRAMAN WEB', 'sks': 3, 'nilai': 4.0},
      {'no': 14, 'thnSmt': '2023-2', 'kode': 'IK270', 'mataKuliah': 'REKAYASA PERANGKAT LUNAK', 'sks': 3, 'nilai': 4.0},
      {'no': 15, 'thnSmt': '2023-2', 'kode': 'IK310', 'mataKuliah': 'KRIPTOGRAFI', 'sks': 2, 'nilai': 3.4},
      {'no': 16, 'thnSmt': '2023-2', 'kode': 'KU110', 'mataKuliah': 'PENDIDIKAN PANCASILA', 'sks': 2, 'nilai': 4.0},
      {'no': 17, 'thnSmt': '2024-1', 'kode': 'IK207', 'mataKuliah': 'JARINGAN KOMPUTER', 'sks': 3, 'nilai': 3.7},
      {'no': 18, 'thnSmt': '2024-1', 'kode': 'IK217', 'mataKuliah': 'SISTEM INFORMASI', 'sks': 3, 'nilai': 3.4},
      {'no': 19, 'thnSmt': '2024-1', 'kode': 'IK240', 'mataKuliah': 'STRUKTUR DATA', 'sks': 3, 'nilai': 3.7},
      {'no': 20, 'thnSmt': '2024-1', 'kode': 'IK280', 'mataKuliah': 'KECERDASAN BUATAN', 'sks': 3, 'nilai': 3.5},
      {'no': 21, 'thnSmt': '2024-1', 'kode': 'IK320', 'mataKuliah': 'GRAFIKA KOMPUTER DAN MULTIMEDIA', 'sks': 3, 'nilai': 4.0},
      {'no': 22, 'thnSmt': '2024-1', 'kode': 'IK500', 'mataKuliah': 'MACHINE LEARNING', 'sks': 3, 'nilai': 3.4},
      {'no': 23, 'thnSmt': '2024-1', 'kode': 'IK505', 'mataKuliah': 'DATA MINING AND WAREHOUSE', 'sks': 3, 'nilai': 3.4},
      {'no': 24, 'thnSmt': '2024-1', 'kode': 'KU300', 'mataKuliah': 'SEMINAR PENDIDIKAN AGAMA ISLAM', 'sks': 2, 'nilai': 3.4},
    ];

    // Hitung total SKS dan total SKS x Nilai
    int totalSKS = 0;
    double totalSKSxNilai = 0;

    for (var mk in mataKuliah) {
      totalSKS += (mk['sks'] as num).toInt();
      totalSKSxNilai += mk['sks'] * mk['nilai'];
    }

    // Hitung IPK
    double ipk = totalSKSxNilai / totalSKS;

    return Scaffold(
  appBar: AppBar(title: const Text('Akademik')),
  body: Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              border: TableBorder.all(color: Colors.grey),
              columns: const [
                DataColumn(label: Text('No', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Semester', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Kode', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Mata Kuliah', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('SKS', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: mataKuliah.map((mk) {
                return DataRow(cells: [
                  DataCell(Text('${mk['no']}')),
                  DataCell(Text(mk['thnSmt'])),
                  DataCell(Text(mk['kode'])),
                  DataCell(Text(mk['mataKuliah'])),
                  DataCell(Text('${mk['sks']}')),
                  DataCell(
                    Text(
                      '${mk['nilai']}',
                      style: TextStyle(
                        color: mk['nilai'] >= 3.5 ? Colors.green :
                               mk['nilai'] >= 3.0 ? Colors.blue : Colors.red,
                      ),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
      const Divider(),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total SKS: $totalSKS',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Jumlah Mutu: ${totalSKSxNilai.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'IPK: ${ipk.toStringAsFixed(2)} / Sangat Memuaskan',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: ipk >= 3.5 ? Colors.green : Colors.blue
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  ),
);
  }
}

class KeuanganScreen extends StatelessWidget {
  const KeuanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data riwayat transaksi
    final List<Map<String, String>> riwayatTransaksi = [
      {'tanggal': 'Juli 2023', 'jumlah': 'Rp 1.500.000', 'keterangan': 'Pembayaran UKT'},
      {'tanggal': 'Desember 2023', 'jumlah': 'Rp 4.000.000', 'keterangan': 'Beasiswa'},
      {'tanggal': 'Januari 2024', 'jumlah': 'Rp 1.500.000', 'keterangan': 'Pembayaran UKT'},
      {'tanggal': 'Februari 2024', 'jumlah': 'Rp 250.000', 'keterangan': 'Tarik Uang'},
      {'tanggal': 'Maret 2024', 'jumlah': 'Rp 75.000', 'keterangan': 'Potongan Admin'},
      {'tanggal': 'Juni 2024', 'jumlah': 'Rp 4.000.000', 'keterangan': 'Beasiswa'},
      {'tanggal': 'Juli 2024', 'jumlah': 'Rp 1.500.000', 'keterangan': 'Pembayaran UKT'},
      {'tanggal': 'Agustus 2024', 'jumlah': 'Rp 300.000', 'keterangan': 'Tarik Uang'},
      {'tanggal': 'September 2024', 'jumlah': 'Rp 50.000', 'keterangan': 'Potongan Bank'},
      {'tanggal': 'Desember 2024', 'jumlah': 'Rp 4.000.000', 'keterangan': 'Beasiswa'},      
      {'tanggal': 'Januari 2025', 'jumlah': 'Rp 1.500.000', 'keterangan': 'Pembayaran UKT'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Keuangan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Saldo
            Card(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Saldo Anda',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp 6.825.000',
                      style: TextStyle(fontSize: 24, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),

            // Tagihan
            Card(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Tagihan Bulan Ini',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rp 1.500.000',
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Pembayaran UKT untuk Juni 2025',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _showMetodePembayaran(context);
                      },
                      child: Text('Bayar Sekarang'),
                    ),
                  ],
                ),
              ),
            ),

            // Riwayat Transaksi
            Text(
              'Riwayat Transaksi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: riwayatTransaksi.length,
              itemBuilder: (context, index) {
                final transaksi = riwayatTransaksi[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(transaksi['tanggal']!),
                    subtitle: Text(transaksi['jumlah']!),
                    trailing: Text(
                      transaksi['keterangan']!,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showMetodePembayaran(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildMetodePembayaranOption('Bank Mandiri'),
              _buildMetodePembayaranOption('Bank BRI'),
              _buildMetodePembayaranOption('Bank BCA'),
              _buildMetodePembayaranOption('Bank BSI'),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMetodePembayaranOption(String namaBank) {
    return ListTile(
      leading: Icon(Icons.account_balance),
      title: Text(namaBank),
      onTap: () {
        print('Pilih $namaBank');
      },
    );
  }
}

class MedsosScreen extends StatelessWidget {
  const MedsosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Sosial'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildPost('Ana', 'https://i.pinimg.com/736x/cc/4a/1c/cc4a1c4d77bf333de1c03b6b5c8535b6.jpg', 'Yang bener aja!'),
          _buildPost('Yaiyalah', 'https://i.pinimg.com/736x/67/ac/b3/67acb3dd66f3dc350744396df086e206.jpg', 'Hari ini sangat menyenangkan!'),
          _buildPost('Malazz', 'https://i.pinimg.com/736x/fa/76/19/fa7619d852ec2ea4478ae7ad6fac301b.jpg', 'Kerja bagus'),
          _buildPost('Do__ne', 'https://i.pinimg.com/736x/71/91/de/7191de7a115e49e7762aaa56f710be85.jpg', 'Malas dah'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan fungsi untuk add post
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildPost(String username, String imagePath, String content) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: Text(username[0]),
              ),
              SizedBox(width: 10),
              Text(username, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Text(content),
          SizedBox(height: 10),
          Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.red); // Icon error jika gagal
            },
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
              IconButton(icon: Icon(Icons.comment), onPressed: () {}),
              IconButton(icon: Icon(Icons.share), onPressed: () {}),
            ],
          ),
        ],
      ),
    ),
  );
}

}

class ELearningScreen extends StatelessWidget {
  const ELearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi Pembelajaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMateriItem('Big Data Platform', 'Lihat Selengkapnya'),
              _buildMateriItem('Desain Pemrograman Berbasis Objek', 'Lihat Selengkapnya'),
              _buildMateriItem('Proyek Konsultasi', 'Lihat Selengkapnya'),
              _buildMateriItem('Analisa dan Desain Algoritma', 'Lihat Selengkapnya'),
              _buildMateriItem('Pemrograman Visual dan Piranti Bergerak', 'Lihat Selengkapnya'),
              _buildMateriItem('Metodologi Penelitian', 'Lihat Selengkapnya'),
              _buildMateriItem('Sistem Operasi', 'Lihat Selengkapnya'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMateriItem(String matkul, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            matkul,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            link,
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class JadwalTodoScreen extends StatelessWidget {
  const JadwalTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal & To-Do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian To-Do
            Text(
              'Tugas Mendatang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTugasCard(
                      matkul: 'Analisis dan Desain Algoritma',
                      tugas: 'WS-1',
                      deadline: '23.59',
                      context: context,
                    ),
                    SizedBox(height: 8),
                    _buildTugasCard(
                      matkul: 'Desain Pemrograman Berbasis Objek',
                      tugas: 'TP3',
                      deadline: '15.00',
                      context: context,
                    ),
                    SizedBox(height: 8),
                    _buildTugasCard(
                      matkul: 'Metodologi Penelitian',
                      tugas: 'Tugas 5',
                      deadline: '23.50',
                      context: context,
                    ),
                    SizedBox(height: 24),

                    // Tombol Tambah Tugas
                    ElevatedButton.icon(
                      onPressed: () {
                        // Tambahkan fungsi untuk menambah tugas baru
                      },
                      icon: Icon(Icons.add),
                      label: Text('Tambah Tugas Baru'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),

                    SizedBox(height: 32), // Jarak sebelum bagian Jadwal

                    // Navigasi ke Jadwal Kuliah
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: Colors.blue),
                      title: Text('Jadwal Kuliah'),
                      subtitle: Text('Lihat jadwal kuliah Anda'),
                      tileColor: Colors.blue.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => JadwalKuliahScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTugasCard({
    required String matkul,
    required String tugas,
    required String deadline,
    required BuildContext context,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    matkul,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Deadline: $deadline',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'Tugas: $tugas',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: () {
                    // Add functionality to mark as done
                  },
                  icon: Icon(Icons.check_circle_outline),
                  label: Text('Tandai Selesai'),
                ),
                SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () {
                    // Add functionality to edit task
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PesanGroupScreen extends StatelessWidget {
  const PesanGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
      ),
      body: ListView(
        children: [
          _buildChatItem('Mahasiswa Bimbingan', 'PENGUMUMAN! ISIKAN DAT................', true),
          _buildChatItem('Grup Kelas', 'Kalender Akademik juga nggak............', false),
          _buildChatItem('Raka', 'Makasih bro', false),
          _buildChatItem('Kana', 'skill issue', false),
          _buildChatItem('Akira', 'Gampang aja ini mah', false),
          _buildChatItem('Rian', 'Ditunggu', false),
        ],
      ),
    );
  }

  Widget _buildChatItem(String name, String message, bool pinned) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: pinned ? FontWeight.bold : FontWeight.normal),
      ),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: pinned ? Icon(Icons.push_pin, color: Colors.grey) : null,
      onTap: () {
        // Tambahkan navigasi ke chat
      },
    );
  }
}

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildNotifikasiItem(
              'Pengingat Tugas TP3',
              'Desain Pemrograman Berbasis Objek',
              'Deadline: 15.00',
            ),
            // Anda bisa menambahkan notifikasi lainnya di sini
          ],
        ),
      ),
    );
  }

  Widget _buildNotifikasiItem(String judul, String deskripsi, String deadline) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              deskripsi,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              deadline,
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
