# 📋 Tahap 4: Dynamic Lists (45 menit)

**Welcome to Tahap 4!** Sekarang kita akan tampilkan tasks dalam list yang cantik dan scrollable!

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ List tasks yang tampil satu per satu
- ✅ Setiap task punya nomor urut
- ✅ List bisa di-scroll kalau banyak
- ✅ Design yang consistent dan professional
- ✅ Empty state yang elegant

**Visual target:** Daftar tasks dalam format list items yang cantik.

## 💡 Konsep yang Dipelajari

- **ListView.builder** - List yang efficient untuk banyak data
- **ListTile** - Widget built-in untuk item list
- **IndexedWidgetBuilder** - Function yang dipanggil untuk setiap item
- **Expanded** - Widget yang mengambil ruang tersisa
- **Conditional Rendering** - Tampilkan widget berbeda based on kondisi

**Analogi:** ListView.builder seperti conveyor belt pabrik - hanya buat item yang terlihat di layar, hemat memori!

---

## 📝 Step-by-Step Implementation

### Step 4.1: Tambah Counter Tasks (5 menit)

**🎯 Goal:** Tambah text counter yang menampilkan jumlah tasks.

**📍 Lokasi:** Di dalam Column, SETELAH Container form input

**➕ Tambah setelah Container form input:**

```dart
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
```

**🔍 Penjelasan:**
- `'Total Tasks: ${tasks.length}'` - String interpolation untuk tampilkan jumlah
- `fontSize: 16` - Ukuran text yang sesuai
- `fontWeight: FontWeight.w500` - Text sedikit bold

**✅ Checkpoint 4.1:**
- Ada text "Total Tasks: 0" saat belum ada task
- Text berubah menjadi "Total Tasks: X" setelah add task

### Step 4.2: Tambah Area untuk List (8 menit)

**🎯 Goal:** Tambah ruang kosong di bawah counter untuk menampilkan list tasks.

**📍 Lokasi:** Di dalam Column, SETELAH Text counter

**➕ Tambah setelah Text counter:**

```dart
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
    // Isi container: placeholder text di tengah
    child: Center(
      child: Text(
        'List tasks akan muncul di sini',
        // Styling text placeholder
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[500],
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  ),
),
```

**🔍 Penjelasan:**
- `Expanded` - Ambil semua ruang yang tersisa di Column
- `Container` - Kotak untuk styling list area
- `border: Border.all(...)` - Border abu-abu di sekitar area
- `Center` - Placeholder text di tengah

**✅ Checkpoint 4.1:**
- Ada kotak besar di bawah counter
- Border abu-abu dengan sudut melengkung
- Text "List tasks akan muncul di sini" di tengah

### Step 4.2: Implement Conditional Rendering (10 menit)

**🎯 Goal:** Tampilkan pesan berbeda saat list kosong vs ada isi.

**🔄 Replace the `child:` part dari Container dengan:**

```dart
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
  : // Tampilan jika ada tasks
    Text(
      'List akan ditampilkan di sini.\nKamu punya ${tasks.length} tasks.',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16),
    ),
```

**🔍 Penjelasan:**
- `tasks.isEmpty ? A : B` - Conditional rendering
- `Icon(Icons.inbox_outlined)` - Icon inbox kosong
- `mainAxisAlignment: MainAxisAlignment.center` - Center column content
- `textAlign: TextAlign.center` - Center text alignment

**✅ Checkpoint 4.2:**
- Saat belum ada task: icon inbox + "Belum ada task"
- Setelah add task: "List akan ditampilkan di sini. Kamu punya X tasks."

**🧪 Test:** Add beberapa task dan lihat text berubah!

### Step 4.3: Implement ListView.builder (15 menit)

**🎯 Goal:** Ganti placeholder text dengan ListView yang menampilkan tasks sungguhan.

**🔄 Replace bagian "Jika ada tasks" dengan:**

```dart
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
          // ListTile = widget built-in untuk item list
          child: ListTile(
            // Leading = widget di kiri (biasanya icon/avatar)
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              // Nomor urut (index dimulai dari 0, jadi +1)
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Title = text utama dari task
            title: Text(
              // Ambil task berdasarkan index dari list (masih String di tahap ini)
              tasks[index],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Subtitle = text kecil di bawah title
            subtitle: Text(
              'Ditambahkan baru saja',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      );
    },
  ),
```

**🔍 Penjelasan Baris per Baris:**

**ListView.builder parameters:**
- `itemCount: tasks.length` - Jumlah item yang akan dibuat
- `itemBuilder: (context, index) { ... }` - Function untuk setiap item

**Item structure:**
- `Padding(padding: EdgeInsets.only(bottom: 8.0))` - Jarak antar item
- `Container(decoration: BoxDecoration(...))` - Styling item
- `boxShadow: [...]` - Efek shadow halus

**ListTile components:**
- `leading: CircleAvatar(...)` - Lingkaran dengan nomor di kiri
- `title: Text(tasks[index])` - Text utama (task name)
- `subtitle: Text('Ditambahkan baru saja')` - Text kecil di bawah

**✅ Checkpoint 4.3:**
- Tasks muncul dalam list format
- Setiap task punya nomor urut dalam lingkaran biru
- Ada shadow halus di setiap item
- List bisa di-scroll jika banyak tasks

**🧪 Test:**
1. Add 1 task → lihat muncul sebagai list item
2. Add 5 tasks → lihat semua muncul dengan nomor 1, 2, 3, 4, 5
3. Scroll list (jika muat di layar)

### Step 4.4: Improve Visual Design (8 menit)

**🎯 Goal:** Buat design lebih menarik dengan warna dan spacing yang lebih baik.

**🔄 Update ListTile dengan design yang lebih baik:**

```dart
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
    style: TextStyle(
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
  contentPadding: EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 8.0,
  ),
),
```

**🔍 Penjelasan Improvements:**
- `Container` instead of `CircleAvatar` - More control over styling
- `trailing: Icon(...)` - Icon di kanan (nanti jadi checkbox)
- `contentPadding` - Padding dalam ListTile
- `Task #${index + 1} • Belum selesai` - Subtitle yang lebih informative

**✅ Checkpoint 4.4:**
- Leading circle lebih consistent
- Ada icon di kanan setiap item
- Subtitle lebih descriptive
- Overall lebih professional

### Step 4.5: Add Scroll Performance (4 menit)

**🎯 Goal:** Test dengan banyak data dan pastikan smooth scrolling.

**🧪 Performance Test:**

1. **Add 10+ tasks** untuk test scrolling
2. **Test scroll performance** - harus smooth
3. **Check memory usage** - tidak boleh lag

**Optional enhancement - tambah physics:**

```dart
ListView.builder(
  physics: BouncingScrollPhysics(), // ← ADD THIS for iOS-style bounce
  itemCount: tasks.length,
  itemBuilder: (context, index) {
    // ... same as before
  },
),
```

**✅ Checkpoint 4.5:**
- List smooth saat di-scroll
- Bounce effect saat reach top/bottom
- No lag meski banyak items

---

## 🎊 Checkpoint Final Tahap 4

**🧪 Complete Test Scenario:**

1. **Empty State Test:**
   - [ ] App fresh → Empty state dengan icon inbox
   - [ ] Message "Belum ada task" + "Tambahkan task pertamamu"

2. **Single Item Test:**
   - [ ] Add 1 task → Muncul dalam list format
   - [ ] Nomor "1" dalam circle biru
   - [ ] Task title jelas terbaca

3. **Multiple Items Test:**
   - [ ] Add 5 tasks berbeda
   - [ ] Semua muncul dengan nomor berurutan (1,2,3,4,5)
   - [ ] Setiap item punya subtitle "Task #X • Belum selesai"

4. **Scroll Test:**
   - [ ] Add 10+ tasks
   - [ ] List bisa di-scroll smooth
   - [ ] Bounce effect di top/bottom

5. **UI Consistency Test:**
   - [ ] Semua items punya design yang sama
   - [ ] Shadow dan spacing consistent
   - [ ] Colors sesuai theme (biru)

**Visual Target:**
```
╔══════════════════════════════╗
║  📱 My To-Do List          ║
╠══════════════════════════════╣
║ [Form area]                  ║
║                              ║
║ Kamu punya 3 tasks          ║
║ ┌──────────────────────────┐ ║
║ │ (1) Belajar Flutter      │ ║
║ │     Task #1 • Belum ✗    │ ║
║ ├──────────────────────────┤ ║
║ │ (2) Ngoding App          │ ║
║ │     Task #2 • Belum ✗    │ ║
║ ├──────────────────────────┤ ║
║ │ (3) Deploy PlayStore     │ ║
║ │     Task #3 • Belum ✗    │ ║
║ └──────────────────────────┘ ║
╚══════════════════════════════╝
```

## 🔍 Full Code Reference

<details>
<summary>Click to view complete updated build method</summary>

```dart
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
          // Form area (same as before)
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
                    prefixIcon: Icon(Icons.edit),
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
          SizedBox(height: 20),
          // Counter
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
          SizedBox(height: 20),
          // List area
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: tasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
                        SizedBox(height: 16),
                        Text('Belum ada task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                        SizedBox(height: 8),
                        Text('Tambahkan task pertamamu di atas!', style: TextStyle(fontSize: 14, color: Colors.grey[500])),
                      ],
                    ),
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                shape: BoxShape.circle,
                              ),
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
                            title: Text(
                              tasks[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
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
                            contentPadding: EdgeInsets.symmetric(
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
```

</details>

## ⚠️ Common Mistakes & Solutions

**❌ Error: "RenderBox was not laid out"**
```dart
// ❌ Wrong: ListView di dalam Column tanpa Expanded
Column(
  children: [
    Container(...),
    ListView(...), // ERROR! ListView butuh bounded height
  ],
)

// ✅ Correct: Wrap ListView dengan Expanded
Column(
  children: [
    Container(...),
    Expanded(child: ListView(...)), // OK!
  ],
)
```

**❌ Error: "Index out of range"**
```dart
// ❌ Wrong: Akses index yang tidak ada
itemBuilder: (context, index) {
  return Text(tasks[index + 10]); // Bisa error jika tasks.length < 10
}

// ✅ Correct: Hanya akses index yang valid
itemBuilder: (context, index) {
  return Text(tasks[index]); // index selalu valid karena 0 <= index < tasks.length
}
```

**❌ Performance issue: List lag saat scroll**
```dart
// ❌ Wrong: Pakai ListView() constructor biasa untuk data banyak
ListView(children: tasks.map((task) => ListTile(...)).toList())

// ✅ Correct: Pakai ListView.builder untuk performa optimal
ListView.builder(itemCount: tasks.length, itemBuilder: ...)
```

## 🎉 Selamat! Tahap 4 Complete!

**🏆 Achievement Unlocked:**
- 📋 Menguasai ListView.builder untuk efficient lists
- 🎨 Membuat UI list yang professional dan consistent
- 🔄 Implementing conditional rendering
- ⚡ Understanding performance optimization untuk lists
- 📱 Creating responsive and scrollable interfaces

**Data flow sudah perfect!** Input → State → UI List. Kamu sudah punya fondasi yang solid untuk aplikasi apapun yang butuh list data.

**Next up:** Kita akan tambah fitur delete untuk menghapus tasks!

# ➡️ [Tahap 5: Delete Functionality](../tahap5/README.md)

---

**💡 Pro Tips untuk Tahap 5:**
- List sudah cantik dan functional ✅
- Next: Add/remove operations
- User experience improvement dengan confirmations

*List mastery achieved! Time to add some destruction! 🗑️*