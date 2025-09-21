# 🧠 Tahap 3: State Management (60 menit)

**Welcome to Tahap 3!** Ini tahap paling penting! Kamu akan belajar bikin app yang "punya memori" - bisa simpan dan ubah data.

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ App yang bisa "ingat" data (state management)
- ✅ Input yang bisa disimpan ke list
- ✅ Button yang benar-benar add task (not just print)
- ✅ Validasi input (tidak bisa kosong)
- ✅ Clear input setelah add task

**Visual target:** Form yang bisa add task dan counter "Kamu punya X tasks".

## 💡 Konsep yang Dipelajari

- **StatefulWidget** - Widget yang bisa berubah-ubah
- **State** - Data yang bisa berubah dan mempengaruhi UI
- **setState()** - Function untuk update UI saat data berubah
- **List<String>** - Array untuk simpan banyak data
- **TextEditingController** - Kontroler untuk TextField

**Analogy:** StatelessWidget = foto (tidak berubah), StatefulWidget = video (bisa berubah setiap frame). setState() = tombol refresh untuk update tampilan.

---

## 📝 Step-by-Step Implementation

### Step 3.1: Convert ke StatefulWidget (12 menit)

**🎯 Goal:** Ubah `TodoListScreen` dari StatelessWidget jadi StatefulWidget.

**❗ IMPORTANT:** Ini step yang tricky, ikuti dengan hati-hati! Kita akan lakukan step by step.

#### Sub-step 3.1a: Change class declaration (3 menit)

**🔄 Change line:** `class TodoListScreen extends StatelessWidget {`
**➡️ To:** `class TodoListScreen extends StatefulWidget {`

#### Sub-step 3.1b: Add createState method (4 menit)

**🔄 Replace the `@override Widget build(...)` method with:**

```dart
// Override method untuk membuat state object
@override
// Function yang return instance dari state class
State<TodoListScreen> createState() => _TodoListScreenState();
```

#### Sub-step 3.1c: Create State class (5 menit)

**➕ Add this NEW class AFTER the closing `}` of TodoListScreen:**

```dart
// State class yang menyimpan data dan build UI
class _TodoListScreenState extends State<TodoListScreen> {
  // Override method build untuk membuat UI
  @override
  Widget build(BuildContext context) {
    // Return UI yang sama seperti Tahap 2
    return Scaffold(
      // AppBar di bagian atas
      appBar: AppBar(
        title: const Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      // Body dengan padding di semua sisi
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Column untuk layout vertikal
        child: Column(
          children: [
            // Container untuk area input form
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              // Column di dalam container
              child: Column(
                children: [
                  // Input field untuk ketik task
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik task baru di sini...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.edit),
                    ),
                  ),
                  // Jarak vertikal
                  const SizedBox(height: 12),
                  // Container untuk button
                  SizedBox(
                    width: double.infinity,
                    // Button untuk add task
                    child: ElevatedButton(
                      // Action saat button ditekan
                      onPressed: () {
                        debugPrint('Button ditekan!');
                      },
                      // Styling button
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      // Isi button: Row dengan icon dan text
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 8),
                          Text(
                            'Add Task',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
}
```

**💡 Pro Tip:** Copy seluruh UI code dari Tahap 2 - tidak ada yang berubah, cuma structurenya aja!

**🔍 Penjelasan Perubahan:**
- `class TodoListScreen extends StatefulWidget` - Sekarang bisa berubah-ubah
- `_TodoListScreenState createState()` - Buat object state
- `class _TodoListScreenState extends State<TodoListScreen>` - Class yang menyimpan data dan logic
- `Widget build(...)` - Function yang sama, tapi sekarang dalam State class

**✅ Checkpoint 3.1:**
- App masih running normal (tidak ada perubahan visual)
- No errors
- Hot reload works
- UI masih sama persis seperti sebelumnya

### Step 3.2: Tambah State Variables (8 menit)

**🎯 Goal:** Tambah variabel untuk menyimpan data tasks.

**📍 Lokasi:** Di dalam `_TodoListScreenState` class, SEBELUM `@override Widget build`

**➕ Tambah ini:**

```dart
// State class dengan variables untuk menyimpan data
class _TodoListScreenState extends State<TodoListScreen> {
  // State variables = data yang bisa berubah
  // List kosong untuk menyimpan semua tasks
  List<String> tasks = [];
  // Controller untuk mengontrol TextField (ambil text, clear, dll)
  TextEditingController taskController = TextEditingController();

  // Override method build untuk membuat UI
  @override
  Widget build(BuildContext context) {
    // ... build method tetap sama
  }
}
```

**🔍 Penjelasan:**
- `List<String> tasks = [];` - Array kosong untuk simpan tasks
- `TextEditingController taskController` - Objek untuk kontrol TextField
- Variables ini adalah "state" - data yang bisa berubah

**✅ Checkpoint 3.2:**
- App masih normal
- Variables tasks dan taskController sudah ada
- Belum ada perubahan fungsionalitas

### Step 3.3: Connect Controller ke TextField (10 menit)

**🎯 Goal:** Hubungkan controller ke TextField supaya kita bisa ambil text yang diketik user.

**📍 Lokasi:** Di dalam TextField widget

**🔄 Update TextField dengan menambah `controller:`**

```dart
// TextField dengan controller untuk ambil input user
TextField(
  // Hubungkan dengan controller untuk kontrol text
  controller: taskController,
  // Styling dan dekorasi input
  decoration: InputDecoration(
    hintText: 'Ketik task baru di sini...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    prefixIcon: Icon(Icons.edit),
  ),
),
```

**🔍 Penjelasan:**
- `controller: taskController` - Hubungkan TextField dengan controller
- Sekarang kita bisa ambil text dengan `taskController.text`
- Controller juga bisa clear input dengan `taskController.clear()`

**✅ Checkpoint 3.3:**
- TextField masih berfungsi normal
- Bisa ketik text seperti biasa
- Controller sudah connected (belum kelihatan bedanya)

### Step 3.4: Buat Function addTask (15 menit)

**🎯 Goal:** Buat function yang bisa ambil text dari input dan simpan ke list.

**📍 Lokasi:** Di dalam `_TodoListScreenState` class, SETELAH state variables dan SEBELUM build method

**➕ Tambah function ini:**

```dart
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
```

**🔍 Penjelasan Baris per Baris:**
- `String newTask = taskController.text.trim()` - Ambil text dan hapus spasi
- `if (newTask.isNotEmpty)` - Cek apakah tidak kosong
- `setState(() { ... })` - PENTING! Memberitahu Flutter untuk rebuild UI
- `tasks.add(newTask)` - Tambah ke array
- `taskController.clear()` - Kosongkan input
- `print(...)` - Debug info untuk development

**✅ Checkpoint 3.4:**
- Function addTask sudah ada
- Belum dipanggil dari manapun (belum ada efek)
- No errors

### Step 3.5: Connect Function ke Button (8 menit)

**🎯 Goal:** Hubungkan function addTask ke button supaya dipanggil saat ditekan.

**📍 Lokasi:** Di ElevatedButton, bagian onPressed

**🔄 Update onPressed:**

```dart
// Button untuk trigger function addTask
ElevatedButton(
  // Panggil function addTask saat button ditekan
  onPressed: addTask,
  // ... styling tetap sama
  child: Row(
    // ... child tetap sama
  ),
),
```

**Alternative syntax (sama aja):**
```dart
// Alternative: panggil function di dalam anonymous function
onPressed: () {
  // Call function addTask
  addTask();
},
```

**✅ Checkpoint 3.5:**
- Button sekarang call addTask instead of print
- Coba ketik sesuatu dan tekan button
- Input harus clear setelah ditekan
- Check debug console - harus ada print statements

**🧪 Test sekarang:**
1. Ketik "Belajar Flutter" di input
2. Tekan Add Task button
3. Input harus kosong
4. Debug console harus show: "Task ditambahkan: Belajar Flutter"
5. Coba add beberapa task lagi

### Step 3.6: Tampilkan Counter Tasks (7 menit)

**🎯 Goal:** Buat UI yang show berapa banyak tasks yang sudah ditambahkan.

**📍 Lokasi:** Di dalam Column, SETELAH Container form

**➕ Tambah setelah Container form:**

```dart
// Jarak vertikal antara form dan counter
SizedBox(height: 20),
// Text yang menampilkan jumlah tasks
Text(
  // Conditional text berdasarkan apakah list kosong atau tidak
  tasks.isEmpty
    ? 'Belum ada task. Yuk tambah yang pertama!'
    : 'Kamu punya ${tasks.length} task${tasks.length > 1 ? 's' : ''}',
  // Styling text
  style: TextStyle(
    fontSize: 16,
    // Warna berbeda: abu jika kosong, biru jika ada isi
    color: tasks.isEmpty ? Colors.grey[600] : Colors.blue[700],
    fontWeight: FontWeight.w500,
  ),
),
```

**🔍 Penjelasan:**
- `tasks.isEmpty ? 'A' : 'B'` - Conditional: jika kosong tampilkan A, kalau tidak B
- `${tasks.length}` - String interpolation: masukkan nilai variable ke string
- `task${tasks.length > 1 ? 's' : ''}` - Plural: "task" atau "tasks"
- `Color: tasks.isEmpty ? grey : blue` - Warna berbeda based on kondisi

**✅ Checkpoint 3.6:**
- Ada text di bawah form
- Saat belum ada task: "Belum ada task..."
- Setelah add task: "Kamu punya 1 task"
- Add lagi: "Kamu punya 2 tasks" (notice the 's')

---

## 🎊 Checkpoint Final Tahap 3

**🧪 Test Scenario Lengkap:**

1. **Empty State Test:**
   - [ ] App start → "Belum ada task. Yuk tambah yang pertama!"

2. **Add Task Test:**
   - [ ] Ketik "Belajar Flutter" → Add Task
   - [ ] Input clear automatically
   - [ ] Text berubah: "Kamu punya 1 task"

3. **Multiple Tasks Test:**
   - [ ] Add "Ngoding App" → "Kamu punya 2 tasks"
   - [ ] Add "Deploy ke PlayStore" → "Kamu punya 3 tasks"

4. **Validation Test:**
   - [ ] Tekan Add Task tanpa ketik apa-apa
   - [ ] Input tetap kosong, counter tidak berubah
   - [ ] Debug console: "Task tidak boleh kosong!"

5. **Spasi Test:**
   - [ ] Ketik "   " (spasi doang) → Add Task
   - [ ] Tidak ke-add (karena .trim() dan .isNotEmpty)

**Screenshot/Visual Check:**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║
╠══════════════════════════════╣
║ ┌──────────────────────────┐ ║
║ │ ✏️ [input kosong]       │ ║
║ │                          │ ║
║ │  [+] Add Task            │ ║
║ └──────────────────────────┘ ║
║                              ║
║   Kamu punya 3 tasks         ║  ← Counter dynamic
║                              ║
╚══════════════════════════════╝
```

## ⚠️ Common Mistakes & Solutions

**❌ Error: "setState() called during build"**
```dart
// ❌ Wrong: Call setState in build method
Widget build() {
  setState(() {}); // NEVER DO THIS!
}

// ✅ Correct: Call setState in event handlers
onPressed: () {
  setState(() {
    tasks.add(newTask);
  });
}
```

**❌ UI tidak update meski data berubah**
```dart
// ❌ Wrong: Lupa setState
tasks.add(newTask); // Data berubah tapi UI tidak

// ✅ Correct: Wrap dengan setState
setState(() {
  tasks.add(newTask); // UI akan update
});
```

**❌ TextField tidak clear setelah add**
```dart
// ❌ Wrong: Lupa clear controller
setState(() {
  tasks.add(newTask);
}); // Input masih ada text

// ✅ Correct: Clear controller
setState(() {
  tasks.add(newTask);
});
taskController.clear(); // Input jadi kosong
```

## 💾 Memory Management: Dispose Controller

**⚠️ Important:** TextEditingController harus di-dispose untuk menghindari memory leak.

**📍 Lokasi:** Di dalam `_TodoListScreenState` class, setelah function addTask

**➕ Tambah dispose method:**

```dart
@override
void dispose() {
  // Dispose controller untuk menghindari memory leak
  taskController.dispose();
  super.dispose();
}
```

**🔍 Penjelasan:**
- `dispose()` dipanggil otomatis saat widget dihancurkan
- `taskController.dispose()` membersihkan memory yang dipakai controller
- `super.dispose()` WAJIB dipanggil untuk clean up parent class
- Ini adalah Flutter best practice untuk semua controller/resource

**✅ Memory Management Check:**
- dispose() method sudah ada
- taskController.dispose() sudah dipanggil
- super.dispose() sudah dipanggil terakhir

## 🔍 Full Code Reference

<details>
<summary>Click to view full _TodoListScreenState class</summary>

```dart
class _TodoListScreenState extends State<TodoListScreen> {
  // State variables
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  // Function untuk menambah task baru
  void addTask() {
    String newTask = taskController.text.trim();

    if (newTask.isNotEmpty) {
      setState(() {
        tasks.add(newTask);
      });

      taskController.clear();

      debugPrint('Task ditambahkan: $newTask');
      debugPrint('Total tasks sekarang: ${tasks.length}');
      debugPrint('Semua tasks: $tasks');
    } else {
      debugPrint('Task tidak boleh kosong!');
    }
  }

  @override
  void dispose() {
    // Dispose controller untuk menghindari memory leak
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: 'Ketik task baru di sini...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.edit),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: addTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 8),
                          Text(
                            'Add Task',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              tasks.isEmpty
                ? 'Belum ada task. Yuk tambah yang pertama!'
                : 'Kamu punya ${tasks.length} task${tasks.length > 1 ? 's' : ''}',
              style: TextStyle(
                fontSize: 16,
                color: tasks.isEmpty ? Colors.grey[600] : Colors.blue[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

</details>

## 🤔 Deep Understanding Quiz

**Answer these to make sure you really get it:**

1. **Kapan kita harus pakai setState()?**
   <details><summary>Answer</summary>
   Setiap kali kita mengubah data yang mempengaruhi UI. Flutter perlu tau untuk rebuild widget tree.
   </details>

2. **Apa bedanya StatelessWidget dan StatefulWidget?**
   <details><summary>Answer</summary>
   StatelessWidget = immutable (tidak berubah), StatefulWidget = mutable (bisa berubah dan punya state).
   </details>

3. **Kenapa pakai TextEditingController?**
   <details><summary>Answer</summary>
   Untuk kontroler TextField - bisa ambil text, clear input, set initial value, dll.
   </details>

4. **Apa yang terjadi jika lupa setState()?**
   <details><summary>Answer</summary>
   Data berubah tapi UI tidak update. User tidak lihat perubahan meski data sudah tersimpan.
   </details>

---

## 🎉 Selamat! Tahap 3 Complete!

**🏆 Achievement Unlocked:**
- 🧠 Menguasai State Management fundamental
- 🔄 Paham konsep StatefulWidget dan setState()
- 📝 Bisa handle user input dengan TextEditingController
- ✅ Implementasi validasi input
- 📊 Dynamic UI yang berubah based on data

**Ini tahap paling penting!** State management adalah jantung semua aplikasi Flutter. Kamu baru saja menguasai fondasi yang akan dipakai di semua project Flutter kamu ke depan.

**Next up:** Kita akan tampilkan tasks dalam list yang cantik dan scrollable!

# ➡️ [Tahap 4: Dynamic Lists](../tahap4/README.md)

---

**💡 Pro Tips untuk Tahap 4:**
- State management sudah solid ✅
- Next: ListView.builder untuk performance
- Data kita sudah ada, tinggal tampilkan!

*State management mastered! Time to show the data! 📋*
