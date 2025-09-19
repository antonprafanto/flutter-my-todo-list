# 🎨 Tahap 2: UI Foundation (45 menit)

**Welcome to Tahap 2!** Sekarang kita akan buat UI yang lebih menarik dengan input form yang functional.

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ Text input field yang cantik
- ✅ Tombol "Add Task" yang stylish
- ✅ Layout yang rapi dengan padding
- ✅ Container dengan background dan border radius

**Visual target:** Form input dengan styling yang professional.

## 💡 Konsep yang Dipelajari

- **Column** - Susun widget secara vertikal
- **TextField** - Input field untuk user
- **Container** - Kotak untuk styling dan layout
- **Padding** - Kasih jarak di sekitar widget
- **ElevatedButton** - Tombol yang bisa ditekan

**Analogi:** Seperti bikin form di website, tapi versi mobile yang touch-friendly.

---

## 📝 Step-by-Step Implementation

### Step 2.1: Ganti Body dengan Column Layout (8 menit)

**🎯 Goal:** Replace text "Coming Soon!" dengan layout Column untuk form.

**📍 Lokasi:** Di dalam `TodoListScreen` class, bagian `body`

**🔄 Replace this:**
```dart
body: Center(
  child: Text(
    'Coming Soon!',
    style: TextStyle(fontSize: 24),
  ),
),
```

**➡️ With this:**
```dart
// Body halaman dengan padding di semua sisi
body: Padding(
  // Jarak 16 pixel dari semua tepi layar
  padding: const EdgeInsets.all(16.0),
  // Column = susun widget anak secara vertikal
  child: Column(
    // Daftar widget yang disusun vertikal
    children: [
      // Text placeholder temporary
      Text(
        'Form akan muncul di sini',
        // Styling text: ukuran 18, warna abu-abu
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    ],
  ),
),
```

**🔍 Penjelasan:**
- `Padding(padding: EdgeInsets.all(16.0))` - Kasih ruang 16 pixel di semua sisi
- `Column(children: [...])` - Susun anak-anak widget secara vertikal
- `Text(...)` - Placeholder temporary, nanti kita ganti

**✅ Checkpoint 2.1:**
- App masih running
- Text berubah jadi "Form akan muncul di sini" dengan jarak dari tepi

### Step 2.2: Buat Container untuk Input Area (10 menit)

**🎯 Goal:** Buat kotak cantik untuk area input form.

**🔄 Replace the Text widget dengan:**

```dart
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
      // Text placeholder yang akan diganti input field
      Text(
        'Input field akan muncul di sini',
        // Warna text abu-abu agak gelap
        style: TextStyle(color: Colors.grey[600]),
      ),
    ],
  ),
),
```

**🔍 Penjelasan:**
- `Container` - Widget serbaguna untuk styling
- `padding: EdgeInsets.all(16.0)` - Ruang dalam container
- `decoration: BoxDecoration(...)` - Styling container
- `color: Colors.grey[100]` - Background abu-abu terang
- `borderRadius: BorderRadius.circular(12.0)` - Sudut melengkung
- `child: Column(...)` - Isi container

**✅ Checkpoint 2.2:**
- Ada kotak abu-abu dengan sudut melengkung
- Text "Input field akan muncul di sini" di dalam kotak

### Step 2.3: Tambah TextField untuk Input (12 menit)

**🎯 Goal:** Ganti text placeholder dengan TextField yang bisa diketik.

**🔄 Replace the Text widget di dalam Container dengan:**

```dart
// TextField = input field yang bisa diketik user
TextField(
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
```

**🔍 Penjelasan:**
- `TextField` - Input field yang bisa diketik user
- `decoration: InputDecoration(...)` - Styling untuk TextField
- `hintText` - Text placeholder yang muncul saat kosong
- `border: OutlineInputBorder(...)` - Border kotak di sekitar input
- `borderRadius: BorderRadius.circular(8.0)` - Sudut border melengkung
- `prefixIcon: Icon(Icons.edit)` - Icon pensil di kiri input

**✅ Checkpoint 2.3:**
- Ada input field yang bisa diketik
- Placeholder text "Ketik task baru di sini..."
- Icon pensil di kiri
- Border abu-abu di sekitar input

**🧪 Test:** Tap input field dan ketik sesuatu - keyboard harus muncul!

### Step 2.4: Tambah Jarak dan Button (10 menit)

**🎯 Goal:** Tambah jarak antara input dan button, plus button yang cantik.

**🔄 Di dalam Column (setelah TextField), tambah:**

```dart
// Jarak kosong vertikal 12 pixel
const SizedBox(height: 12),
// SizedBox untuk mengatur lebar button
SizedBox(
  // Button ambil lebar penuh container
  width: double.infinity,
  // Button dengan efek elevasi
  child: ElevatedButton(
    // Function yang dijalankan saat button ditekan
    onPressed: () {
      // Print ke debug console untuk test
      debugPrint('Button ditekan!');
    },
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
```

**🔍 Penjelasan:**
- `SizedBox(height: 12)` - Jarak kosong 12 pixel
- `width: double.infinity` - Button ambil lebar penuh
- `ElevatedButton` - Button dengan efek elevasi (shadow)
- `onPressed: () { print(...) }` - Action saat button ditekan
- `backgroundColor: Colors.blue` - Warna background button
- `foregroundColor: Colors.white` - Warna text button
- `padding: EdgeInsets.symmetric(vertical: 15)` - Padding atas-bawah
- `shape: RoundedRectangleBorder(...)` - Bentuk button dengan sudut bulat

**✅ Checkpoint 2.4:**
- Ada jarak antara input dan button
- Button biru full-width dengan text putih
- Saat ditekan, muncul "Button ditekan!" di debug console

### Step 2.5: Tambah Icon pada Button (5 menit)

**🎯 Goal:** Buat button lebih menarik dengan icon plus.

**🔄 Replace the `child:` part dari ElevatedButton dengan:**

```dart
// Isi button: Row untuk susun icon dan text horizontal
child: Row(
  // Posisi elemen di tengah Row
  mainAxisAlignment: MainAxisAlignment.center,
  // Daftar widget dalam Row
  children: [
    // Icon plus
    Icon(Icons.add),
    // Jarak horizontal 8 pixel antara icon dan text
    SizedBox(width: 8),
    // Text button
    Text(
      'Add Task',
      // Styling text
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ],
),
```

**🔍 Penjelasan:**
- `Row` - Susun widget secara horizontal
- `mainAxisAlignment: MainAxisAlignment.center` - Center semua anak
- `Icon(Icons.add)` - Icon plus (+)
- `SizedBox(width: 8)` - Jarak horizontal antara icon dan text

**✅ Checkpoint 2.5:**
- Button ada icon plus di kiri text
- Icon dan text center di button
- Button tetap functional (print saat ditekan)

---

## 🎊 Checkpoint Final Tahap 2

**Berhasil jika:**
- [ ] ✅ Ada container abu-abu dengan sudut bulat
- [ ] ✅ TextField dengan placeholder dan icon pensil
- [ ] ✅ Button biru full-width dengan icon + dan text
- [ ] ✅ Padding rapi di semua sisi
- [ ] ✅ Button print "Button ditekan!" saat ditekan

**Screenshot/Visual Check:**
```
╔══════════════════════════════╗
║  📱 My To-Do List          ║
╠══════════════════════════════╣
║ ┌──────────────────────────┐ ║
║ │ ✏️ Ketik task baru...    │ ║  ← Input field
║ │                          │ ║
║ │  [+] Add Task           │ ║  ← Button biru
║ └──────────────────────────┘ ║  ← Container abu-abu
║                              ║
║                              ║
╚══════════════════════════════╝
```

## 🔍 Full Code Reference

Kode lengkap `TodoListScreen` class:

<details>
<summary>Click to view full code</summary>

```dart
class TodoListScreen extends StatelessWidget {
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
                    decoration: InputDecoration(
                      hintText: 'Ketik task baru di sini...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button ditekan!');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
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
          ],
        ),
      ),
    );
  }
}
```

</details>

## ⚠️ Common Mistakes & Solutions

**❌ Error: "RenderFlex overflowed"**
```dart
// ❌ Problem: Column atau Row kebesaran
// ✅ Solution: Wrap dengan Expanded atau Flexible, atau kurangi padding
```

**❌ Button tidak responsive/tidak bisa ditekan**
```dart
// ❌ Wrong:
onPressed: null, // Button disabled

// ✅ Correct:
onPressed: () {
  print('Button ditekan!');
},
```

**❌ TextField tidak bisa diketik**
```dart
// ❌ Wrong: Mungkin ada Expanded yang salah
// ✅ Solution: Pastikan TextField di dalam Column yang benar
```

## 🧪 Experiment Zone

**Try these modifications:**

1. **Ganti warna theme:**
   ```dart
   backgroundColor: Colors.green, // Instead of blue
   ```

2. **Ganti icon:**
   ```dart
   prefixIcon: Icon(Icons.task), // Instead of edit
   Icon(Icons.save), // Instead of add
   ```

3. **Ganti border radius:**
   ```dart
   borderRadius: BorderRadius.circular(20.0), // More rounded
   ```

## 🤔 Quick Quiz

1. **Apa bedanya `Column` dan `Row`?**
   <details><summary>Answer</summary>
   Column = vertikal (atas-bawah), Row = horizontal (kiri-kanan)
   </details>

2. **Kenapa pakai `SizedBox(width: double.infinity)`?**
   <details><summary>Answer</summary>
   Biar button ambil lebar penuh container parent-nya
   </details>

3. **Apa fungsi `EdgeInsets.all(16.0)`?**
   <details><summary>Answer</summary>
   Kasih padding 16 pixel di semua sisi (top, bottom, left, right)
   </details>

---

## 🎉 Selamat! Tahap 2 Complete!

**Kamu baru saja:**
- 🎨 Membuat UI yang professional dengan Container
- 📝 Setup TextField untuk user input
- 🔘 Membuat button yang cantik dan functional
- 📐 Mengatur layout dengan Column dan spacing

**Next up:** Kita akan buat input ini bener-bener functional dengan state management!

# ➡️ [Tahap 3: State Management](../tahap3/README.md)

---

**💡 Pro Tips untuk Tahap 3:**
- Input kita sudah cantik, tapi belum simpan data
- Next step: StatefulWidget dan setState()
- Keep experimenting dengan colors dan spacing!

*UI foundation solid! Time to add some brain! 🧠*