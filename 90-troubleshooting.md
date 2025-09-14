# 🔧 Troubleshooting Guide

Stuck somewhere? No panic! Most common issues ada di sini dengan solusinya.

## 🚨 Setup & Installation Issues

### ❌ "flutter command not found"
**Problem:** Flutter SDK belum di PATH environment
**Solution:**
```bash
# Windows (PowerShell)
$env:PATH += ";C:\flutter\bin"

# macOS/Linux
export PATH="$PATH:/path/to/flutter/bin"

# Permanent fix: Add to .bashrc atau .zshrc
```

### ❌ "Android license status unknown"
**Problem:** Android licenses belum accepted
**Solution:**
```bash
flutter doctor --android-licenses
# Ketik 'y' untuk semua licenses
```

### ❌ "No devices found"
**Problem:** Emulator tidak running atau device tidak connected
**Solution:**
```bash
# Check available devices
flutter devices

# Start emulator
flutter emulators --launch <emulator_name>
```

---

## 💻 Code Compilation Errors

### ❌ "Undefined class 'TodoListScreen'"
**Problem:** Class belum didefinisikan atau typo
**Solution:**
```dart
// Pastikan class ada SETELAH MyApp
class TodoListScreen extends StatelessWidget {
  // ...
}
```

### ❌ "Expected a ';' after this"
**Problem:** Missing semicolon atau comma
**Solution:**
```dart
// ❌ Wrong
Text('Hello')
backgroundColor: Colors.blue,

// ✅ Correct
Text('Hello'), // Add comma here
backgroundColor: Colors.blue,
```

### ❌ "The argument type 'String' can't be assigned to 'Task'"
**Problem:** Mixing String dan Task objects di Tahap 6
**Solution:**
```dart
// ❌ Wrong
tasks.add(newTaskTitle); // String

// ✅ Correct
tasks.add(Task(title: newTaskTitle)); // Task object
```

### ❌ "The getter 'title' isn't defined for the type 'String'"
**Problem:** Mencoba akses .title pada String (sebelum convert ke Task)
**Solution:**
```dart
// ❌ Wrong (Tahap 1-5)
Text(tasks[index].title) // tasks[index] adalah String

// ✅ Correct (Tahap 1-5)
Text(tasks[index]) // tasks[index] adalah String

// ✅ Correct (Tahap 6+)
Text(tasks[index].title) // tasks[index] adalah Task object
```

---

## 🎨 UI & Layout Issues

### ❌ "RenderFlex overflowed by X pixels"
**Problem:** Content lebih besar dari container
**Solution:**
```dart
// ❌ Wrong
Column(
  children: [
    Container(...),
    ListView(...), // Takes infinite height!
  ],
)

// ✅ Correct
Column(
  children: [
    Container(...),
    Expanded(child: ListView(...)), // Bounded height
  ],
)
```

### ❌ "ListView tidak bisa scroll"
**Problem:** ListView di dalam Column tanpa Expanded
**Solution:**
```dart
// Wrap ListView dengan Expanded atau Flexible
Expanded(
  child: ListView.builder(...),
)
```

### ❌ "Button tidak bisa ditekan"
**Problem:** onPressed is null atau ada overlay
**Solution:**
```dart
// ❌ Wrong
ElevatedButton(
  onPressed: null, // Button disabled
  child: Text('Button'),
)

// ✅ Correct
ElevatedButton(
  onPressed: () {
    // Your function here
  },
  child: Text('Button'),
)
```

---

## 📊 State Management Issues

### ❌ "UI tidak update meski data berubah"
**Problem:** Lupa setState()
**Solution:**
```dart
// ❌ Wrong
void addTask() {
  tasks.add(newTask); // Data berubah tapi UI tidak
}

// ✅ Correct
void addTask() {
  setState(() {
    tasks.add(newTask); // UI akan update
  });
}
```

### ❌ "setState() called during build"
**Problem:** Call setState di dalam build method
**Solution:**
```dart
// ❌ Wrong
Widget build(BuildContext context) {
  setState(() {}); // NEVER!
  return Scaffold(...);
}

// ✅ Correct
Widget build(BuildContext context) {
  return Scaffold(...); // setState only in event handlers
}
```

### ❌ "Index out of range"
**Problem:** Akses index yang tidak ada
**Solution:**
```dart
// Always check bounds
if (index < tasks.length) {
  return Text(tasks[index].title);
}
```

---

## 💬 Dialog & Navigation Issues

### ❌ "showDialog tidak muncul"
**Problem:** Context wrong atau missing await
**Solution:**
```dart
// ✅ Correct
bool? result = await showDialog<bool>(
  context: context, // Make sure context is valid
  builder: (context) => AlertDialog(...),
);
```

### ❌ "Navigator operation requested with a context that does not include a Navigator"
**Problem:** Context sudah unmounted
**Solution:**
```dart
// Check if widget still mounted
if (mounted) {
  Navigator.of(context).pop();
}
```

---

## 🔥 Hot Reload Issues

### ❌ "Hot reload tidak work"
**Problem:** Major structural changes
**Solution:**
1. Save file (Ctrl+S)
2. Press 'R' in terminal for hot restart
3. Or restart app completely

### ❌ "App crash setelah hot reload"
**Problem:** State corruption
**Solution:**
```bash
# Hot restart
flutter run

# Or full restart
Ctrl+C and flutter run again
```

---

## 📱 Performance Issues

### ❌ "App lag saat scroll list"
**Problem:** Using ListView() instead of ListView.builder
**Solution:**
```dart
// ❌ Wrong for large lists
ListView(
  children: tasks.map((task) => ListTile(...)).toList(),
)

// ✅ Correct
ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index) => ListTile(...),
)
```

### ❌ "Memory usage tinggi"
**Problem:** Controllers tidak di-dispose
**Solution:**
```dart
@override
void dispose() {
  taskController.dispose(); // Always dispose controllers
  super.dispose();
}
```

---

## 🐛 Debug Tips

### 📍 **Debug Print Strategy:**
```dart
print('=== DEBUG addTask ===');
print('Input: $newTaskTitle');
print('Tasks before: ${tasks.length}');
setState(() {
  tasks.add(Task(title: newTaskTitle));
});
print('Tasks after: ${tasks.length}');
print('Last task: ${tasks.last.title}');
```

### 📍 **Check Flutter Doctor:**
```bash
flutter doctor -v
# Fix any issues reported
```

### 📍 **Clean Build:**
```bash
flutter clean
flutter pub get
flutter run
```

### 📍 **Enable Debug Mode:**
```dart
// Add this for debugging
import 'package:flutter/foundation.dart';

// In your widget
if (kDebugMode) {
  print('Debug info here');
}
```

---

## 🆘 When All Else Fails

### 1. **Compare with Reference Code**
- Check template files di `templates/` folder
- Compare step-by-step dengan tutorial

### 2. **Start Fresh**
```bash
flutter create new_todo_app
cd new_todo_app
# Copy working code piece by piece
```

### 3. **Ask for Help**
- Copy EXACT error message
- Share code snippet yang bermasalah
- Mention tahap tutorial yang sedang dikerjakan

### 4. **Community Resources**
- Stack Overflow dengan tag [flutter]
- Reddit r/FlutterDev
- Discord Flutter Community
- GitHub issues untuk specific libraries

---

## 📋 Quick Checklist for Common Issues

**Before asking for help, check:**
- [ ] ✅ `flutter doctor` shows no critical issues
- [ ] ✅ File saved (Ctrl+S)
- [ ] ✅ No typos in class/function names
- [ ] ✅ All brackets { } balanced
- [ ] ✅ All semicolons ; present
- [ ] ✅ setState() used when changing data
- [ ] ✅ Controllers disposed properly
- [ ] ✅ Correct data types (String vs Task)

**Error debugging steps:**
1. Read error message carefully
2. Check line number mentioned
3. Look for red underlines in VS Code
4. Try hot restart (not just hot reload)
5. Compare with reference code
6. Search error message online

---

*Remember: Setiap error adalah learning opportunity! 🚀*