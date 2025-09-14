# 🗑️ Tahap 5: Delete Functionality (30 menit)

**Welcome to Tahap 5!** Sekarang kita akan tambah fitur delete tasks dengan konfirmasi dialog yang professional!

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ Tombol delete di setiap task
- ✅ Konfirmasi dialog sebelum hapus
- ✅ Task bisa dihapus dari list
- ✅ Nomor urut otomatis update
- ✅ Feedback message setelah delete

**Visual target:** Setiap task punya tombol delete, dengan dialog confirmation yang elegan.

## 💡 Konsep yang Dipelajari

- **IconButton** - Tombol dengan icon yang bisa ditekan
- **showDialog** - Menampilkan popup dialog
- **AlertDialog** - Dialog dengan judul, konten, dan aksi
- **List.removeAt()** - Menghapus item dari list berdasarkan index
- **async/await** - Menunggu response dari dialog

**Analogi:** Seperti delete contact di HP - ada tombol delete, muncul "Yakin mau hapus?", baru dihapus. Safe dan user-friendly!

---

## 📝 Step-by-Step Implementation

### Step 5.1: Tambah Delete Button (8 menit)

**🎯 Goal:** Tambah icon delete di setiap ListTile yang bisa ditekan.

**📍 Lokasi:** Di ListTile, update bagian `trailing`

**🔄 Update trailing dari:**
```dart
trailing: Icon(
  Icons.radio_button_unchecked,
  color: Colors.grey[400],
),
```

**➡️ Menjadi:**
```dart
// Trailing: area di kanan ListTile untuk icons
trailing: Row(
  // Row sekecil mungkin, tidak ambil space berlebihan
  mainAxisSize: MainAxisSize.min,
  children: [
    // Icon status task (belum selesai)
    Icon(
      Icons.radio_button_unchecked,
      color: Colors.grey[400],
    ),
    // Jarak antara icon status dan delete button
    SizedBox(width: 8),
    // Button untuk delete task
    IconButton(
      // Icon tempat sampah
      icon: Icon(
        Icons.delete_outline,
        color: Colors.red[400],
      ),
      // Action saat button ditekan
      onPressed: () {
        // Print untuk debug
        print('Delete task ${index + 1}: ${tasks[index]}');
      },
      // Tooltip yang muncul saat long press
      tooltip: 'Hapus task',
    ),
  ],
),
```

**🔍 Penjelasan:**
- `Row` - Susun horizontal: status icon + delete button
- `mainAxisSize: MainAxisSize.min` - Row tidak ambil space berlebihan
- `IconButton` - Button yang bisa ditekan dengan icon
- `Icons.delete_outline` - Icon tempat sampah outline
- `color: Colors.red[400]` - Warna merah untuk delete
- `tooltip` - Text yang muncul saat long press

**✅ Checkpoint 5.1:**
- Setiap task punya 2 icons di kanan: circle abu-abu + delete merah
- Delete button bisa ditekan
- Console print "Delete task X: ..." saat ditekan

### Step 5.2: Buat Function removeTask (10 menit)

**🎯 Goal:** Buat function yang bisa hapus task dari list dengan konfirmasi.

**📍 Lokasi:** Di dalam `_TodoListScreenState` class, setelah function `addTask`

**➕ Tambah function baru:**

```dart
// Function async untuk menghapus task dengan konfirmasi dialog
void removeTask(int index) async {
  // Simpan nama task yang akan dihapus untuk ditampilkan di dialog
  String taskToDelete = tasks[index];

  // Tampilkan dialog konfirmasi dan tunggu response user
  bool? shouldDelete = await showDialog<bool>(
    context: context,
    // Builder function untuk membuat content dialog
    builder: (BuildContext context) {
      // AlertDialog = popup konfirmasi
      return AlertDialog(
        // Title dialog dengan icon warning
        title: Row(
          children: [
            Icon(Icons.warning, color: Colors.orange),
            SizedBox(width: 8),
            Text('Konfirmasi Hapus'),
          ],
        ),
        // Content dialog
        content: Column(
          // Column sekecil mungkin
          mainAxisSize: MainAxisSize.min,
          // Align kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text pertanyaan
            Text('Apakah kamu yakin ingin menghapus task ini?'),
            SizedBox(height: 12),
            // Container untuk preview task yang akan dihapus
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              // Preview task dalam tanda kutip
              child: Text(
                '"$taskToDelete"',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        // Actions = tombol-tombol di bawah dialog
        actions: [
          // Tombol Batal
          TextButton(
            // Tutup dialog dan return false
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Batal'),
          ),
          // Tombol Hapus
          ElevatedButton(
            // Tutup dialog dan return true
            onPressed: () => Navigator.of(context).pop(true),
            // Styling button merah
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('Hapus'),
          ),
        ],
      );
    },
  );

  // Cek apakah user pilih hapus (shouldDelete == true)
  if (shouldDelete == true) {
    setState(() {
      tasks.removeAt(index); // Hapus dari list
    });

    // Debug print
    print('Task dihapus: $taskToDelete');
    print('Sisa tasks: ${tasks.length}');
  } else {
    print('Delete dibatalkan');
  }
}
```

**🔍 Penjelasan Baris per Baris:**

**Function signature:**
- `void removeTask(int index) async` - Function async karena menunggu dialog

**Dialog creation:**
- `bool? shouldDelete = await showDialog<bool>(...)` - Tunggu response dialog
- `AlertDialog(...)` - Dialog dengan title, content, actions
- `title: Row([Icon, Text])` - Judul dengan icon warning

**Dialog content:**
- `content: Column(...)` - Isi dialog dengan pertanyaan + preview task
- `Container` dengan background abu-abu untuk highlight task name

**Dialog actions:**
- `TextButton('Batal')` - Return false (tidak jadi hapus)
- `ElevatedButton('Hapus')` - Return true (jadi hapus)
- `Navigator.of(context).pop(value)` - Tutup dialog dan return value

**Conditional delete:**
- `if (shouldDelete == true)` - Hanya hapus jika user confirm
- `setState(() { tasks.removeAt(index); })` - Hapus dan update UI

**✅ Checkpoint 5.2:**
- Function removeTask sudah ada
- Belum dipanggil dari manapun (belum ada efek)
- No compilation errors

### Step 5.3: Connect Delete Button ke Function (5 menit)

**🎯 Goal:** Hubungkan IconButton delete ke function removeTask.

**📍 Lokasi:** Di IconButton delete, bagian `onPressed`

**🔄 Update onPressed dari:**
```dart
onPressed: () {
  print('Delete task ${index + 1}: ${tasks[index]}');
},
```

**➡️ Menjadi:**
```dart
onPressed: () => removeTask(index),
```

**Atau bisa juga ditulis:**
```dart
onPressed: () {
  removeTask(index);
},
```

**✅ Checkpoint 5.3:**
- Delete button sekarang call removeTask
- Saat ditekan, muncul dialog konfirmasi
- Test: tekan "Batal" → nothing happens
- Test: tekan "Hapus" → task hilang dari list

### Step 5.4: Test Delete Functionality (5 menit)

**🎯 Goal:** Test semua skenario delete untuk memastikan works perfect.

**🧪 Test Scenarios:**

1. **Delete Middle Item:**
   - Add 5 tasks: "Task A", "Task B", "Task C", "Task D", "Task E"
   - Delete "Task C" (yang di tengah)
   - Expected: A,B,D,E tersisa dengan nomor urut 1,2,3,4

2. **Delete First Item:**
   - Delete "Task A" (yang pertama)
   - Expected: B,D,E tersisa dengan nomor urut 1,2,3

3. **Delete Last Item:**
   - Delete "Task E" (yang terakhir)
   - Expected: B,D tersisa dengan nomor urut 1,2

4. **Delete All Items:**
   - Delete semua tasks satu per satu
   - Expected: Kembali ke empty state dengan icon inbox

5. **Cancel Delete:**
   - Tekan delete → tekan "Batal"
   - Expected: Task tidak dihapus

**✅ Checkpoint 5.4:**
- [ ] All test scenarios pass
- [ ] Nomor urut selalu update otomatis
- [ ] Empty state muncul saat semua dihapus
- [ ] Cancel works correctly

### Step 5.5: Improve User Experience (2 menit)

**🎯 Goal:** Tambah small improvements untuk UX yang lebih baik.

**Optional Enhancement 1 - Haptic Feedback:**
```dart
onPressed: () {
  // Haptic feedback (optional)
  // HapticFeedback.mediumImpact(); // Uncomment jika mau
  removeTask(index);
},
```

**Optional Enhancement 2 - Better Dialog Styling:**

**🔄 Update AlertDialog title:**
```dart
title: Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.orange[50],
    borderRadius: BorderRadius.circular(8),
  ),
  child: Row(
    children: [
      Icon(Icons.warning, color: Colors.orange),
      SizedBox(width: 8),
      Text('Konfirmasi Hapus'),
    ],
  ),
),
```

**✅ Checkpoint 5.5:**
- Dialog dengan styling yang lebih menarik
- Better visual hierarchy
- Professional look and feel

---

## 🎊 Checkpoint Final Tahap 5

**🧪 Complete Test Checklist:**

**Basic Functionality:**
- [ ] ✅ Setiap task punya delete button (icon merah)
- [ ] ✅ Delete button bisa ditekan
- [ ] ✅ Muncul dialog konfirmasi dengan preview task
- [ ] ✅ "Batal" → task tidak dihapus
- [ ] ✅ "Hapus" → task hilang dari list

**Edge Cases:**
- [ ] ✅ Delete task pertama → nomor urut update
- [ ] ✅ Delete task tengah → nomor urut update
- [ ] ✅ Delete task terakhir → nomor urut update
- [ ] ✅ Delete semua tasks → empty state muncul

**UI/UX:**
- [ ] ✅ Dialog dengan title yang jelas
- [ ] ✅ Preview task yang akan dihapus
- [ ] ✅ Button "Batal" dan "Hapus" jelas
- [ ] ✅ Warna merah untuk destructive action

**Visual Target:**
```
╔══════════════════════════════╗
║  📱 My To-Do List          ║
╠══════════════════════════════╣
║ [Form area]                  ║
║                              ║
║ Kamu punya 3 tasks          ║
║ ┌──────────────────────────┐ ║
║ │ (1) Belajar Flutter  ○🗑️ │ ║
║ ├──────────────────────────┤ ║
║ │ (2) Ngoding App      ○🗑️ │ ║
║ ├──────────────────────────┤ ║
║ │ (3) Deploy App       ○🗑️ │ ║
║ └──────────────────────────┘ ║
╚══════════════════════════════╝
```

**Dialog Preview:**
```
┌─────────────────────────────┐
│ ⚠️  Konfirmasi Hapus        │
├─────────────────────────────┤
│ Apakah kamu yakin ingin     │
│ menghapus task ini?         │
│                             │
│ ┌─────────────────────────┐ │
│ │ "Belajar Flutter"       │ │
│ └─────────────────────────┘ │
├─────────────────────────────┤
│         [Batal]    [Hapus]  │
└─────────────────────────────┘
```

## ⚠️ Common Mistakes & Solutions

**❌ Error: "Navigator operation requested with a context that does not include a Navigator"**
```dart
// ❌ Wrong: Context sudah unmounted saat dialog ditutup
Navigator.of(context).pop(true);
setState(() { tasks.removeAt(index); }); // Context might be invalid

// ✅ Correct: Check mounted before setState
if (shouldDelete == true && mounted) {
  setState(() { tasks.removeAt(index); });
}
```

**❌ Dialog tidak muncul atau error**
```dart
// ❌ Wrong: Lupa await
bool shouldDelete = showDialog(...); // Missing await!

// ✅ Correct: Pakai await
bool? shouldDelete = await showDialog<bool>(...);
```

**❌ Index out of bounds after delete**
```dart
// ❌ Problem: Akses index yang sudah tidak ada setelah delete
// ✅ Solution: Flutter otomatis rebuild ListView.builder, jadi ini tidak terjadi
// Tapi pastikan tidak ada logic yang cache index lama
```

## 🤔 Understanding Quiz

1. **Mengapa pakai `async/await` untuk removeTask?**
   <details><summary>Answer</summary>
   Karena showDialog return Future. Kita perlu tunggu user pilih "Hapus" atau "Batal" dulu sebelum lanjut.
   </details>

2. **Apa yang terjadi jika lupa setState() setelah removeAt()?**
   <details><summary>Answer</summary>
   Data tasks berubah tapi UI tidak update. List masih tampil task yang sudah dihapus.
   </details>

3. **Kenapa pakai Navigator.pop() dengan parameter?**
   <details><summary>Answer</summary>
   Parameter adalah return value dari dialog. true = hapus, false = batal.
   </details>

## 🎉 Selamat! Tahap 5 Complete!

**🏆 Achievement Unlocked:**
- 🗑️ Menguasai delete operations dengan confirmation
- 💬 Implementing dialogs dan async operations
- 🎯 Creating safe destructive actions
- 🔄 Understanding state updates after data changes
- 🎨 Building professional UX patterns

**CRUD operations almost complete!** Create ✅, Read ✅, Delete ✅. Tinggal Update untuk mark tasks as complete!

**Next up:** Kita akan tambah fitur mark task as complete/incomplete!

# ➡️ [Tahap 6: Toggle Status](../tahap6/README.md)

---

**💡 Pro Tips untuk Tahap 6:**
- Delete functionality solid ✅
- Next: Data model upgrade ke Task objects
- Toggle complete/incomplete states

*Destruction mastered! Time to add some completion satisfaction! ✅*