# 📄 Code Templates - Reference Solutions

Stuck somewhere? Tidak masalah! Ini adalah reference code untuk setiap tahap.

## 🎯 Cara Menggunakan Templates

1. **Compare dulu** - Bandingkan code kamu dengan template
2. **Cari perbedaan** - Lihat apa yang missing atau berbeda
3. **Copy jika perlu** - Ambil bagian yang butuh diperbaiki
4. **Understand** - Pastikan kamu paham setiap baris

**❗ IMPORTANT:** Jangan langsung copy-paste semua! Coba pahami dulu mengapa code kamu berbeda.

---

## 📚 Template Files Available

### 🚀 [tahap1-complete.dart](tahap1-complete.dart)
**What you get:** Basic Flutter app dengan StatelessWidget
- MaterialApp setup
- Scaffold dengan AppBar
- Simple text display
- **Expected result:** App dengan "My To-Do List" title dan "Coming Soon!" text

### 🎨 [tahap2-complete.dart](tahap2-complete.dart)
**What you get:** UI foundation dengan form input
- Column layout dan Container styling
- TextField dengan decoration
- ElevatedButton dengan styling
- **Expected result:** Beautiful input form yang bisa di-tap

### 🧠 [tahap3-complete.dart](tahap3-complete.dart)
**What you get:** State management dan functionality
- StatefulWidget conversion
- TextEditingController usage
- setState() implementation
- List operations
- **Expected result:** Working add task functionality dengan counter

### 📋 [tahap4-complete.dart](tahap4-complete.dart)
*(Coming soon - akan ditambah jika dibutuhkan)*

### 🗑️ [tahap5-complete.dart](tahap5-complete.dart)
*(Coming soon - akan ditambah jika dibutuhkan)*

### ✅ [tahap6-complete.dart](tahap6-complete.dart)
*(Coming soon - akan ditambah jika dibutuhana)*

### ✨ [final-complete.dart](final-complete.dart)
**What you get:** Complete production-ready app
- All features implemented
- Professional UI/UX
- Error handling
- SnackBar feedback
- Statistics tracking
- **Expected result:** Fully functional To-Do app!

---

## 🔍 How to Debug dengan Templates

### Step 1: Compare Structure
```bash
# Your file structure should match:
import 'package:flutter/material.dart';

void main() { ... }
class MyApp extends StatelessWidget { ... }
class TodoListScreen extends StatefulWidget { ... }  # From tahap 3+
class _TodoListScreenState extends State<TodoListScreen> { ... }
```

### Step 2: Check Key Functions
```dart
// Tahap 3+: These functions should exist
void addTask() { ... }
void removeTask(int index) { ... }    // Tahap 5+
void toggleTask(int index) { ... }    // Tahap 6+
```

### Step 3: Verify State Variables
```dart
// Tahap 3: Basic state
List<String> tasks = [];
TextEditingController taskController = TextEditingController();

// Tahap 6+: Advanced state
List<Task> tasks = [];  // Changed from String to Task
```

### Step 4: UI Structure Check
```dart
// Your build() method should have this hierarchy:
Scaffold(
  appBar: AppBar(...),
  body: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      children: [
        Container(...),     // Form area
        SizedBox(...),      // Spacing
        Text(...),          // Counter/stats
        Expanded(           // List area
          child: Container(...),
        ),
      ],
    ),
  ),
)
```

---

## ⚠️ Common Issues & Solutions

### ❌ "My code doesn't match any template"
**Problem:** Kamu mungkin mix concepts dari different tahap
**Solution:**
1. Check which tahap you're currently on
2. Compare dengan template that tahap
3. Don't use concepts from future tahap

### ❌ "Template works but mine doesn't"
**Problem:** Subtle differences in syntax
**Solution:**
1. Copy template completely
2. Run dan test
3. Compare line by line dengan your version
4. Fix differences one by one

### ❌ "I understand template but can't reproduce"
**Problem:** Missing foundational concepts
**Solution:**
1. Go back to previous tahap
2. Make sure you understand every line
3. Build up gradually, don't skip steps

---

## 💡 Best Practices

### 🔄 **Iterative Comparison**
Don't compare everything at once:
1. Compare imports dan basic structure
2. Compare state variables
3. Compare one function at a time
4. Compare UI piece by piece

### 🧠 **Learning from Templates**
Templates are for learning, not copying:
- **Understand WHY** code is written that way
- **Experiment** dengan small changes
- **Type it yourself** instead of copy-paste
- **Explain to yourself** what each part does

### 🐛 **Debugging Strategy**
1. **Start simple** - Get basic version working first
2. **Add one feature** at a time
3. **Test immediately** after each change
4. **Use templates** when stuck for >15 minutes

---

## 🎯 Usage Guidelines

### ✅ **Good Uses:**
- Reference saat stuck >15 minutes
- Verify your implementation approach
- Learn new syntax atau patterns
- Debug specific functions
- Check overall structure

### ❌ **Avoid:**
- Copy-paste tanpa understanding
- Skip to final template without learning steps
- Use as primary learning source
- Compare when you haven't tried yourself first

---

## 🚀 Ready to Code?

Remember: **Templates are training wheels!** Goal-nya adalah eventually kamu bisa code without them.

**Progress indicators:**
- **Beginner:** Need templates for most steps
- **Intermediate:** Only check templates when stuck
- **Advanced:** Use templates for reference dan best practices
- **Expert:** Create your own templates untuk others!

---

**🔗 Back to:** [Main Tutorial](../01-MULAI-DISINI.md) | **📊 Track Progress:** [Progress Tracker](../checkpoints/progress-tracker.md)

*Happy coding! 🎉*