# ✅ Tahap 6: Toggle Status (30 menit)

**Welcome to Tahap 6!** Sekarang kita akan upgrade app jadi lebih smart dengan bisa mark tasks as complete/incomplete!

## 🎯 Target Tahap Ini

Setelah tahap ini selesai, kamu akan punya:
- ✅ Model Task dengan properties title dan isCompleted
- ✅ Checkbox yang bisa toggle complete/incomplete
- ✅ Visual styling berbeda untuk completed tasks
- ✅ Strikethrough text untuk completed tasks
- ✅ Green theme untuk completed items

**Visual target:** Tasks dengan status jelas - completed punya styling berbeda dan bisa di-toggle.

## 💡 Konsep yang Dipelajari

- **Class Model** - Blueprint untuk objek yang lebih kompleks
- **Constructor** - Function untuk membuat instance class
- **Object Properties** - Data yang dimiliki setiap objek
- **TextDecoration.lineThrough** - Garis coret untuk text
- **Conditional Styling** - Style berbeda based on data

**Analogi:** Upgrade dari sticky note biasa jadi sticky note yang bisa dicontreng ✅. Sekarang task jadi "objek" yang punya nama dan status, bukan cuma string sederhana.

---

## 📝 Step-by-Step Implementation

### Step 6.1: Buat Task Model Class (8 menit)

**🎯 Goal:** Buat class Task untuk replace String sederhana.

**📍 Lokasi:** Di atas semua class, setelah import statements

**➕ Tambah di bagian atas file (setelah import, sebelum main()):**

```dart
import 'package:flutter/material.dart';

// Model class untuk Task = blueprint/template untuk objek Task
class Task {
  // Property untuk menyimpan judul task
  String title;
  // Property untuk menyimpan status selesai/belum
  bool isCompleted;

  // Constructor = function untuk membuat Task baru
  Task({
    // title wajib diisi (required)
    required this.title,
    // isCompleted opsional, default false (belum selesai)
    this.isCompleted = false,
  });

  // Method untuk toggle status completed (true ↔ false)
  void toggle() {
    // Flip boolean: true jadi false, false jadi true
    isCompleted = !isCompleted;
  }

  // Override toString untuk debug print yang readable
  @override
  String toString() {
    return 'Task{title: $title, isCompleted: $isCompleted}';
  }
}

// Function main tetap sama
void main() {
  runApp(MyApp());
}
// ... rest of code
```

**🔍 Penjelasan:**
- `class Task` - Blueprint untuk objek Task
- `String title` - Property untuk judul task
- `bool isCompleted` - Property untuk status selesai/belum
- `Task({required this.title, this.isCompleted = false})` - Constructor
- `void toggle()` - Method untuk flip status true ↔ false
- `@override String toString()` - Untuk debug print yang readable

**✅ Checkpoint 6.1:**
- Task class sudah ada
- No compilation errors
- App masih running normal (belum ada perubahan visual)

### Step 6.2: Update State Variables (5 menit)

**🎯 Goal:** Ganti List<String> jadi List<Task>.

**📍 Lokasi:** Di dalam `_TodoListScreenState` class, bagian state variables

**🔄 Update dari:**
```dart
List<String> tasks = [];
```

**➡️ Menjadi:**
```dart
// List untuk menyimpan objek Task (bukan String lagi)
List<Task> tasks = [];
```

**✅ Checkpoint 6.2:**
- State variable type berubah
- Error akan muncul di addTask function dan ListView - normal!
- Kita fix di step berikutnya

### Step 6.3: Update addTask Function (7 menit)

**🎯 Goal:** Update function addTask untuk create Task objects.

**📍 Lokasi:** Function `addTask` di dalam `_TodoListScreenState`

**🔄 Update function addTask:**

```dart
void addTask() {
  String newTaskTitle = taskController.text.trim(); // Ambil title

  if (newTaskTitle.isNotEmpty) {
    setState(() {
      // Buat Task object baru dengan title dari input
      Task newTask = Task(title: newTaskTitle);
      tasks.add(newTask);
    });

    taskController.clear();

    print('Task ditambahkan: $newTask'); // Sekarang print Task object
    print('Total tasks: ${tasks.length}');
  } else {
    print('Task tidak boleh kosong!');
  }
}
```

**🔍 Penjelasan Perubahan:**
- `String newTaskTitle` - Ambil title dari input
- `Task newTask = Task(title: newTaskTitle)` - Buat Task object baru
- `tasks.add(newTask)` - Add Task object ke list
- `print('$newTask')` - Print pakai toString() method

**✅ Checkpoint 6.3:**
- addTask function updated
- Masih ada errors di removeTask dan ListView - fix next!

### Step 6.4: Update removeTask Function (3 menit)

**🎯 Goal:** Update removeTask untuk bekerja dengan Task objects.

**📍 Lokasi:** Function `removeTask`, bagian yang akses task name

**🔄 Update dari:**
```dart
String taskToDelete = tasks[index];
```

**➡️ Menjadi:**
```dart
Task taskToDelete = tasks[index];
```

**Dan update dialog content:**
```dart
child: Text(
  '"${taskToDelete.title}"', // Akses .title property
  style: TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
  ),
),
```

**✅ Checkpoint 6.4:**
- removeTask works dengan Task objects
- Dialog tetap show task title correctly

### Step 6.5: Add toggleTask Function (5 menit)

**🎯 Goal:** Buat function untuk toggle status complete/incomplete.

**📍 Lokasi:** Di dalam `_TodoListScreenState`, setelah removeTask function

**➕ Tambah function baru:**

```dart
// Function untuk toggle status completed
void toggleTask(int index) {
  setState(() {
    tasks[index].toggle(); // Pakai method toggle dari Task class
  });

  Task task = tasks[index];
  String status = task.isCompleted ? "selesai" : "belum selesai";
  print('Task $status: ${task.title}');
}
```

**🔍 Penjelasan:**
- `tasks[index].toggle()` - Call method toggle dari Task object
- `setState()` - Update UI setelah data berubah
- Debug print dengan status yang jelas

**✅ Checkpoint 6.5:**
- toggleTask function ready
- Belum connected ke UI (next step!)

### Step 6.6: Update ListView dengan New Data Structure (12 menit)

**🎯 Goal:** Update ListView untuk pakai Task objects dan show status dengan styling.

**📍 Lokasi:** Di ListView.builder, bagian itemBuilder

**🔄 Update itemBuilder completely:**

```dart
itemBuilder: (context, index) {
  Task task = tasks[index]; // Ambil Task object

  return Padding(
    padding: EdgeInsets.only(bottom: 8.0),
    child: Container(
      decoration: BoxDecoration(
        // Background berubah berdasarkan status
        color: task.isCompleted ? Colors.green[50] : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: task.isCompleted
            ? Border.all(color: Colors.green[200]!, width: 2) // Border hijau jika selesai
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Opacity(
        opacity: task.isCompleted ? 0.7 : 1.0, // Completed task lebih transparan
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // Warna berubah berdasarkan status
              color: task.isCompleted ? Colors.green[100] : Colors.blue[100],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: task.isCompleted
                  ? Icon(Icons.check, color: Colors.green[700]) // Icon check jika selesai
                  : Text(
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
            task.title, // Akses .title dari Task object
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: task.isCompleted ? Colors.grey[600] : Colors.black87,
              // STRIKETHROUGH untuk completed task
              decoration: task.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            task.isCompleted ? 'Selesai ✅' : 'Belum selesai',
            style: TextStyle(
              fontSize: 12,
              color: task.isCompleted ? Colors.green[600] : Colors.grey[600],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // CHECKBOX untuk toggle complete
              IconButton(
                icon: Icon(
                  task.isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: task.isCompleted ? Colors.green[600] : Colors.grey[400],
                ),
                onPressed: () => toggleTask(index),
                tooltip: task.isCompleted
                    ? 'Mark as incomplete'
                    : 'Mark as complete',
              ),
              // Delete button
              IconButton(
                icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                onPressed: () => removeTask(index),
                tooltip: 'Hapus task',
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // Tap pada item juga bisa toggle
          onTap: () => toggleTask(index),
        ),
      ),
    ),
  );
},
```

**🔍 Penjelasan Major Changes:**

**Conditional Styling:**
- `color: task.isCompleted ? Colors.green[50] : Colors.white` - Background
- `border: task.isCompleted ? ... : null` - Border hijau untuk completed
- `opacity: task.isCompleted ? 0.7 : 1.0` - Transparansi

**Leading Icon:**
- `task.isCompleted ? Icon(Icons.check) : Text('${index + 1}')` - Check vs number

**Text Styling:**
- `decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none` - Strikethrough

**Interactive Elements:**
- `IconButton` dengan conditional icons dan colors
- `onTap: () => toggleTask(index)` - Tap item juga toggle

**✅ Checkpoint 6.6:**
- ListView updated dengan Task objects
- No compilation errors
- Visual styling conditional pada status
- Both checkbox dan tap toggle status

---

## 🎊 Checkpoint Final Tahap 6

**🧪 Complete Test Scenarios:**

**Basic Toggle Functionality:**
- [ ] ✅ Add new task → muncul dengan status "Belum selesai"
- [ ] ✅ Click checkbox → task jadi completed (hijau + strikethrough)
- [ ] ✅ Click checkbox lagi → task jadi incomplete (normal)
- [ ] ✅ Tap pada ListTile → sama efeknya dengan checkbox

**Visual Changes for Completed Tasks:**
- [ ] ✅ Background berubah jadi hijau muda
- [ ] ✅ Border hijau muncul di sekitar item
- [ ] ✅ Text jadi strikethrough (garis coret)
- [ ] ✅ Leading icon berubah dari nomor jadi checkmark hijau
- [ ] ✅ Subtitle berubah jadi "Selesai ✅"
- [ ] ✅ Overall opacity lebih rendah (transparan)

**Mixed States:**
- [ ] ✅ Add 5 tasks, mark 2 completed, 3 incomplete
- [ ] ✅ Visual difference jelas antara completed vs incomplete
- [ ] ✅ Bisa toggle individual tanpa pengaruh ke yang lain

**Edge Cases:**
- [ ] ✅ Mark task completed → delete → works fine
- [ ] ✅ Toggle status multiple kali → no lag atau error
- [ ] ✅ Add task baru setelah ada completed tasks → normal styling

**Visual Target:**
```
╔═══════════════════════════════════╗
║  📱 My To-Do List                ║
╠═══════════════════════════════════╣
║ [Form area]                       ║
║ Kamu punya 4 tasks                ║
║ ┌───────────────────────────────┐ ║
║ │ ✅ ~~Belajar Flutter~~  ✅🗑️│ ║ ← Completed: hijau + coret
║ ├───────────────────────────────┤ ║
║ │ (2) Ngoding App          ○🗑️ │ ║ ← Incomplete: normal
║ ├───────────────────────────────┤ ║
║ │ ✅ ~~Deploy App~~      ✅🗑️ │ ║ ← Completed: hijau + coret
║ ├───────────────────────────────┤ ║
║ │ (4) Testing App          ○🗑️ │ ║ ← Incomplete: normal
║ └───────────────────────────────┘ ║
╚═══════════════════════════════════╝
```

## ⚠️ Common Mistakes & Solutions

**❌ Error: "The getter 'title' isn't defined for the type 'String'"**
```dart
// ❌ Wrong: Masih ada code yang treat tasks sebagai String
Text(tasks[index]) // Error! tasks[index] sekarang Task object

// ✅ Correct: Akses property title
Text(tasks[index].title)
```

**❌ Error: "The argument type 'String' can't be assigned to 'Task'"**
```dart
// ❌ Wrong: Add String ke List<Task>
tasks.add(newTaskTitle); // Error!

// ✅ Correct: Buat Task object dulu
tasks.add(Task(title: newTaskTitle));
```

**❌ UI tidak update saat toggle**
```dart
// ❌ Wrong: Lupa setState
void toggleTask(int index) {
  tasks[index].toggle(); // Data berubah tapi UI tidak
}

// ✅ Correct: Wrap dengan setState
void toggleTask(int index) {
  setState(() {
    tasks[index].toggle();
  });
}
```

**❌ Styling tidak apply dengan benar**
```dart
// ❌ Wrong: Akses property yang salah
color: tasks[index].completed ? ... // Property 'completed' tidak ada

// ✅ Correct: Akses property yang benar
color: tasks[index].isCompleted ? ...
```

## 🤔 Deep Understanding Quiz

1. **Mengapa kita buat class Task instead of pakai Map?**
   <details><summary>Answer</summary>
   Class lebih type-safe, ada autocomplete, bisa ada methods (toggle), dan lebih maintainable.
   </details>

2. **Apa bedanya `task.isCompleted = !task.isCompleted` vs `task.toggle()`?**
   <details><summary>Answer</summary>
   Functionally sama, tapi toggle() lebih readable dan bisa dikembangkan (misalnya add logging).
   </details>

3. **Kenapa pakai conditional styling dengan ternary operator?**
   <details><summary>Answer</summary>
   Untuk dynamic styling based on data. UI berubah otomatis saat data berubah.
   </details>

## 🎉 Selamat! Tahap 6 Complete!

**🏆 Achievement Unlocked:**
- 📊 Menguasai data modeling dengan custom classes
- 🎨 Implementing conditional styling dan theming
- ✅ Creating interactive toggle functionality
- 🔄 Understanding object-oriented programming dalam Flutter
- 💚 Building visual feedback systems

**CRUD Operations Complete!** Create ✅, Read ✅, Update ✅, Delete ✅. App kamu sudah fully functional dengan semua core features!

**Next up:** Final polish untuk UX yang perfect dan pro-level touches!

# ➡️ [Tahap 7: Final Polish](../tahap7/README.md)

---

**💡 Pro Tips untuk Tahap 7:**
- Core functionality solid ✅
- Next: Validations, animations, dan pro touches
- Time to make it production-ready!

*Toggle mastery achieved! Time to make it shine! ✨*
