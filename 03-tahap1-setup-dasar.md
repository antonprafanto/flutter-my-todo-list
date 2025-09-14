# 🚀 Tahap 1: Setup Dasar App (30 menit)

**Welcome to Tahap 1!** Di sini kamu akan membuat aplikasi Flutter pertamamu dengan tampilan basic.

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ App Flutter yang bisa running
- ✅ AppBar dengan judul "My To-Do List"
- ✅ Background warna biru
- ✅ Text "Coming Soon!" di tengah layar

**Visual target:** App sederhana dengan AppBar biru dan text di tengah.

## 💡 Konsep yang Dipelajari

- **MaterialApp** - "Rumah" utama aplikasi
- **Scaffold** - "Kerangka" halaman
- **AppBar** - Bar judul di atas layar
- **StatelessWidget** - Widget yang tidak berubah

**Analogi:** Bayangkan kamu bikin rumah. MaterialApp = pondasi, Scaffold = rangka, AppBar = atap, Body = ruangan utama.

---

## 📝 Step-by-Step Implementation

### Step 1.1: Bersihkan Template Default (3 menit)

**🎯 Goal:** Hapus semua kode template Flutter, mulai dari nol.

1. Buka file `lib/main.dart`
2. **DELETE semua isi file** (Ctrl+A, Delete)
3. File sekarang kosong - that's perfect!

**✅ Checkpoint 1.1:**
- File `lib/main.dart` kosong
- No error (karena masih kosong)

### Step 1.2: Import dan Main Function (5 menit)

**🎯 Goal:** Setup dasar aplikasi Flutter.

Ketik kode berikut di `lib/main.dart`:

```dart
// Import library Flutter untuk UI components
import 'package:flutter/material.dart';

// Function utama yang dijalankan pertama kali
void main() {
  // Jalankan aplikasi Flutter, dimulai dari widget MyApp
  runApp(MyApp());
}
```

**🔍 Penjelasan Baris per Baris:**
- `import 'package:flutter/material.dart';` - Ambil semua widget Flutter UI
- `void main()` - Function pertama yang dijalankan
- `runApp(MyApp());` - Jalankan aplikasi, mulai dari widget MyApp

**✅ Checkpoint 1.2:**
- Ada import statement
- Ada main function
- Code tidak error (tapi belum bisa run karena MyApp belum ada)

### Step 1.3: Buat MyApp Widget (7 menit)

**🎯 Goal:** Buat widget utama aplikasi.

Tambahkan kode berikut setelah main function:

```dart
// Deklarasi class MyApp yang extends (turunan dari) StatelessWidget
class MyApp extends StatelessWidget {
  // Override function build yang WAJIB ada di setiap widget
  @override
  Widget build(BuildContext context) {
    // Return MaterialApp sebagai root aplikasi
    return MaterialApp(
      // Nama aplikasi (muncul di task switcher)
      title: 'Todo App Pemula',
      // Tema warna aplikasi
      theme: ThemeData(
        // Warna utama aplikasi = biru
        primarySwatch: Colors.blue,
      ),
      // Halaman pertama yang ditampilkan saat app dibuka
      home: TodoListScreen(),
    );
  }
}
```

**🔍 Penjelasan Baris per Baris:**
- `class MyApp extends StatelessWidget` - MyApp adalah widget yang tidak berubah-ubah
- `Widget build(BuildContext context)` - Function yang membangun UI
- `MaterialApp` - Wrapper utama yang memberikan Material Design
- `title` - Nama aplikasi (terlihat di task switcher)
- `theme` - Tema warna aplikasi (biru)
- `home` - Halaman pertama yang ditampilkan

**✅ Checkpoint 1.3:**
- MyApp class sudah ada
- MaterialApp configured
- Error: "Undefined class TodoListScreen" - normal, kita bikin next step!

### Step 1.4: Buat TodoListScreen Widget (10 menit)

**🎯 Goal:** Buat halaman utama dengan AppBar dan body.

Tambahkan kode berikut setelah MyApp class:

```dart
// Deklarasi class TodoListScreen untuk halaman utama
class TodoListScreen extends StatelessWidget {
  // Override function build untuk membangun UI halaman
  @override
  Widget build(BuildContext context) {
    // Return Scaffold sebagai kerangka halaman
    return Scaffold(
      // AppBar = bar di atas layar
      appBar: AppBar(
        // Text yang muncul di AppBar
        title: Text('My To-Do List'),
        // Warna background AppBar
        backgroundColor: Colors.blue,
      ),
      // Body = konten utama halaman
      body: Center(
        // Widget anak yang akan di-center
        child: Text(
          // Text yang ditampilkan
          'Coming Soon!',
          // Styling untuk text
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
```

**🔍 Penjelasan Baris per Baris:**
- `Scaffold` - Kerangka halaman yang punya AppBar, body, dll
- `appBar: AppBar(...)` - Bar di atas layar
- `title: Text('My To-Do List')` - Text yang muncul di AppBar
- `backgroundColor: Colors.blue` - Warna AppBar biru
- `body: Center(...)` - Konten utama halaman, di-center
- `Text('Coming Soon!')` - Text yang ditampilkan
- `fontSize: 24` - Ukuran font besar

**✅ Checkpoint 1.4:**
- TodoListScreen class sudah ada
- No errors di editor
- Ready untuk di-run!

### Step 1.5: Test & Run App (5 menit)

**🎯 Goal:** Jalankan aplikasi dan lihat hasilnya.

1. **Save file** (Ctrl+S)
2. **Run app:**
   ```bash
   flutter run
   ```
   Atau di VS Code: Tekan F5

3. **Wait for compilation** (first run might take 2-3 minutes)

**✅ Expected Result:**
- Emulator terbuka
- App dengan AppBar biru
- Text "My To-Do List" di AppBar
- Text "Coming Soon!" di tengah layar putih

**❌ Jika ada error, check:**
- Typo di nama class atau function
- Missing semicolon (;)
- Bracket tidak seimbang { }

---

## 🎊 Checkpoint Final Tahap 1

**Berhasil jika:**
- [ ] ✅ App bisa running tanpa error
- [ ] ✅ AppBar biru dengan text "My To-Do List"
- [ ] ✅ Body putih dengan text "Coming Soon!" di tengah
- [ ] ✅ Hot reload works (tekan 'r' di terminal)

**Screenshot/Visual Check:**
```
╔══════════════════════════════╗
║  📱 My To-Do List          ║  ← AppBar biru
╠══════════════════════════════╣
║                              ║
║                              ║
║      Coming Soon!           ║  ← Text di tengah
║                              ║
║                              ║
╚══════════════════════════════╝
```

## 🔍 Full Code Reference

Jika ada masalah, ini kode lengkap `lib/main.dart`:

<details>
<summary>Click to view full code</summary>

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Pemula',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Coming Soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
```

</details>

## ⚠️ Common Mistakes & Solutions

**❌ Error: "Undefined class 'TodoListScreen'"**
```dart
// ✅ Solution: Pastikan TodoListScreen class ada SETELAH MyApp class
class MyApp extends StatelessWidget { ... }
class TodoListScreen extends StatelessWidget { ... } // ← Harus ada ini
```

**❌ Error: "Expected a ';' after this"**
```dart
// ❌ Wrong:
title: Text('My To-Do List')  // Missing semicolon
backgroundColor: Colors.blue,

// ✅ Correct:
title: Text('My To-Do List'), // Add comma here
backgroundColor: Colors.blue,
```

**❌ App tidak muncul di emulator**
```bash
# ✅ Solution: Check devices
flutter devices

# Start emulator if needed
flutter emulators --launch <emulator_id>
```

## 🤔 Quick Quiz

Before moving to next step, answer these:

1. **Apa fungsi `Scaffold` widget?**
   <details><summary>Answer</summary>
   Scaffold menyediakan struktur dasar halaman dengan AppBar, body, drawer, dll.
   </details>

2. **Kenapa kita pakai `StatelessWidget` untuk tahap ini?**
   <details><summary>Answer</summary>
   Karena UI kita tidak berubah-ubah. StatelessWidget untuk UI yang static.
   </details>

3. **Apa yang terjadi jika kita hapus `Center` widget?**
   <details><summary>Answer</summary>
   Text "Coming Soon!" akan muncul di kiri atas, bukan di tengah.
   </details>

---

## 🎉 Selamat! Tahap 1 Complete!

**Kamu baru saja:**
- ✨ Membuat aplikasi Flutter pertama dari nol
- 🏗️ Memahami struktur dasar Flutter app
- 🎨 Setup theme dan basic UI
- 🚀 Successfully run app di emulator

**Next up:** Kita akan buat form input yang cantik!

# ➡️ [Tahap 2: UI Foundation](04-tahap2-ui-foundation.md)

---

## 🔗 Navigation

**📚 Tutorial:** [Main Menu](01-MULAI-DISINI.md) | **⬅️ Previous:** [Persiapan](02-persiapan-setup.md) | **➡️ Next:** [Tahap 2](04-tahap2-ui-foundation.md)

**🛠️ Resources:** [Templates](templates/tahap1-complete.dart) | [Visual Guide](assets/visual-guide.md) | [Progress Tracker](checkpoints/progress-tracker.md)

---

**💡 Pro Tips untuk Tahap 2:**
- Keep emulator open (hot reload faster)
- Experiment dengan warna: ganti `Colors.blue` ke `Colors.green`
- Try ganti text size: `fontSize: 30`
- Save progress di git: `git add . && git commit -m "Tahap 1 complete"`

*Great job! Let's keep building! 🚀*