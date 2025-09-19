import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Pemula',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // State variables = data yang bisa berubah
  // List kosong untuk menyimpan semua tasks
  List<String> tasks = [];
  // Controller untuk mengontrol TextField (ambil text, clear, dll)
  TextEditingController taskController = TextEditingController();

  // Function untuk menambah task baru ke dalam list
  void addTask() {
    // Ambil text dari TextField dan hapus spasi di awal/akhir
    String newTask = taskController.text.trim();

    // Validasi: cek apakah input tidak kosong
    if (newTask.isNotEmpty) {
      // setState() WAJIB untuk update UI setelah ubah data
      setState(() {
        // Tambah task baru ke dalam list
        tasks.add(newTask);
      });

      // Clear input field setelah berhasil menambah
      taskController.clear();

      // Print untuk debug - lihat perubahan di console
      debugPrint('Task ditambahkan: $newTask');
      debugPrint('Total tasks sekarang: ${tasks.length}');
      debugPrint('Semua tasks: $tasks');
    } else {
      // Tampilkan pesan jika user coba submit input kosong
      debugPrint('Task tidak boleh kosong!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      // Body halaman dengan padding di semua sisi
      body: Padding(
        // Jarak 16 pixel dari semua tepi layar
        padding: const EdgeInsets.all(16.0),
        // Column = susun widget anak secara vertikal
        child: Column(
          // Daftar widget yang disusun vertikal
          children: [
            // Container = kotak untuk styling dan layout
            Container(
              // Padding di dalam container
              padding: const EdgeInsets.all(16.0),
              // Dekorasi container (warna, bentuk, dll)
              decoration: BoxDecoration(
                // Warna background abu-abu terang
                color: Colors.grey[100],
                // Sudut melengkung dengan radius 12 pixel
                borderRadius: BorderRadius.circular(12.0),
              ),
              // Isi container
              child: Column(
                // Daftar widget di dalam container
                children: [
                  // TextField = input field yang bisa diketik user
                  TextField(
                    // Controller untuk mengontrol TextField
                    controller: taskController,
                    // Styling dan decorasi input field
                    decoration: InputDecoration(
                      // Text yang muncul saat input kosong
                      hintText: 'Ketik task baru di sini...',
                      // Border outline di sekitar input
                      border: OutlineInputBorder(
                        // Sudut border melengkung
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // Icon di sebelah kiri input
                      prefixIcon: const Icon(Icons.edit),
                    ),
                  ),
                  // Jarak kosong vertikal 12 pixel
                  const SizedBox(height: 12),
                  // SizedBox untuk mengatur lebar button
                  SizedBox(
                    // Button ambil lebar penuh container
                    width: double.infinity,
                    // Button dengan efek elevasi
                    child: ElevatedButton(
                      // Function yang dijalankan saat button ditekan
                      onPressed: addTask,
                      // Styling button
                      style: ElevatedButton.styleFrom(
                        // Warna background button
                        backgroundColor: Colors.blue,
                        // Warna text/icon button
                        foregroundColor: Colors.white,
                        // Padding atas-bawah 15 pixel
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        // Bentuk button dengan sudut bulat
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // Isi button
                      child: const Text(
                        'Add Task',
                        // Styling text: ukuran 16, tebal
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Jarak vertikal setelah form
            const SizedBox(height: 20),
            // Text counter untuk menampilkan jumlah tasks
            Text(
              'Total Tasks: ${tasks.length}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            // Jarak vertikal sebelum area list
            const SizedBox(height: 20),
            // Expanded mengambil sisa ruang yang tersedia di Column
            Expanded(
              // Container untuk styling area list
              child: Container(
                // Lebar penuh
                width: double.infinity,
                // Padding di dalam container
                padding: const EdgeInsets.all(16),
                // Dekorasi container: border dan border radius
                decoration: BoxDecoration(
                  // Border abu-abu di sekeliling
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  // Sudut melengkung
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // Conditional rendering: tampil berbeda jika kosong vs ada isi
                child: tasks.isEmpty
                    ? // Tampilan jika list kosong
                      Center(
                        // Column untuk susun icon dan text vertikal
                        child: Column(
                          // Center semua content di tengah
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon inbox kosong
                            Icon(
                              Icons.inbox_outlined,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            // Jarak vertikal
                            const SizedBox(height: 16),
                            // Text utama
                            Text(
                              'Belum ada task',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            // Jarak kecil
                            const SizedBox(height: 8),
                            // Text penjelasan
                            Text(
                              'Tambahkan task pertamamu di atas!',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      )
                    : // Tampilan jika ada tasks: ListView untuk scroll
                      ListView.builder(
                        // Jumlah item yang akan dibuat
                        itemCount: tasks.length,
                        // Function yang dipanggil untuk membuat setiap item
                        itemBuilder: (context, index) {
                          // Return widget untuk item ke-index
                          return Padding(
                            // Jarak bawah antar item
                            padding: const EdgeInsets.only(bottom: 8.0),
                            // Container untuk styling setiap item
                            child: Container(
                              // Dekorasi container: warna, border, shadow
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                // Shadow untuk efek elevated
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              // ListTile dengan design yang lebih baik
                              child: ListTile(
                                // Leading: container custom untuk nomor urut
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  // Dekorasi: background biru, bentuk lingkaran
                                  decoration: BoxDecoration(
                                    color: Colors.blue[100],
                                    shape: BoxShape.circle,
                                  ),
                                  // Center nomor urut di tengah container
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                // Title dengan styling yang lebih jelas
                                title: Text(
                                  tasks[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                // Subtitle dengan info tambahan
                                subtitle: Text(
                                  'Task #${index + 1} • Belum selesai',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.radio_button_unchecked,
                                  color: Colors.grey[400],
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}