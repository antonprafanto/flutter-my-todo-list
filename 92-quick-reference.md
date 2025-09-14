# ⚡ Quick Reference Guide

Butuh akses cepat ke informasi penting? Semua ada di sini!

## 🚀 Quick Navigation

| **Need** | **Go To** | **Description** |
|----------|-----------|-----------------|
| 🏠 **Start Here** | [README.md](README.md) | Main tutorial menu |
| 🔧 **Setup Issues** | [troubleshooting.md](troubleshooting.md) | Fix setup problems |
| 📊 **Track Progress** | [progress-tracker.md](tutorial/checkpoints/progress-tracker.md) | Mark completed steps |
| 💻 **Stuck on Code** | [templates/](tutorial/templates/) | Reference solutions |
| 👀 **What Should I See** | [visual-guide.md](tutorial/assets/visual-guide.md) | Expected visual results |
| 🎓 **After Tutorial** | [next-steps.md](next-steps.md) | Continue learning |

---

## 📱 Quick Commands

**Start New Project:**
```bash
flutter create todo_app_pemula
cd todo_app_pemula
code .
flutter run
```

**Debug Commands:**
```bash
flutter doctor              # Check setup
flutter devices            # List available devices
flutter clean && flutter run  # Fresh restart
```

**Hot Reload:**
- **Hot Reload:** Press `r` in terminal
- **Hot Restart:** Press `R` in terminal
- **Quit:** Press `q` in terminal

---

## 🎯 Tahap Overview

| Tahap | Time | What You Build | Key Concepts |
|-------|------|----------------|--------------|
| **[1](tutorial/tahap1/README.md)** | 30min | Basic app structure | Widgets, Scaffold |
| **[2](tutorial/tahap2/README.md)** | 45min | Input form UI | Layout, Styling |
| **[3](tutorial/tahap3/README.md)** | 60min | Working add task | State, Controllers |
| **[4](tutorial/tahap4/README.md)** | 45min | Display task list | ListView, Dynamic UI |
| **[5](tutorial/tahap5/README.md)** | 30min | Delete functionality | Dialogs, Async |
| **[6](tutorial/tahap6/README.md)** | 30min | Complete/incomplete | Object modeling |
| **[7](tutorial/tahap7/README.md)** | 30min | Professional polish | Validation, UX |

**Total:** 4.5 hours | **Result:** Production-ready app

---

## 🔧 Common Error Solutions

### ❌ "flutter command not found"
```bash
# Add to PATH (replace with your Flutter path)
export PATH="$PATH:/path/to/flutter/bin"
```

### ❌ "No devices found"
```bash
# Start Android emulator
flutter emulators --launch <name>
# Or connect physical device dengan USB debugging
```

### ❌ "setState() called during build"
```dart
// ❌ Wrong
Widget build() {
  setState(() {}); // NEVER!
  return Widget();
}

// ✅ Correct
onPressed: () {
  setState(() {}); // In event handlers only
}
```

### ❌ "UI tidak update"
```dart
// ❌ Missing setState
tasks.add(newTask);

// ✅ With setState
setState(() {
  tasks.add(newTask);
});
```

---

## 💡 Quick Tips

### 🔥 **Hot Reload Best Practices:**
- Save file first (`Ctrl+S`)
- Press `r` for reload, `R` for restart
- Use restart for major structural changes

### 🐛 **Debugging Strategy:**
1. Check console for error messages
2. Verify widget tree structure
3. Compare with templates
4. Use `print()` statements liberally
5. Test on different devices/screen sizes

### 📱 **Testing Checklist:**
- [ ] App launches without crashes
- [ ] All buttons respond to taps
- [ ] Input validation works
- [ ] List scrolls smoothly
- [ ] UI looks good on different screen sizes

---

## 📚 Essential Widgets Reference

| Widget | Purpose | Example |
|--------|---------|---------|
| `MaterialApp` | App root | `MaterialApp(home: MyWidget())` |
| `Scaffold` | Page structure | `Scaffold(appBar: ..., body: ...)` |
| `Column` | Vertical layout | `Column(children: [Widget1, Widget2])` |
| `Row` | Horizontal layout | `Row(children: [Widget1, Widget2])` |
| `Container` | Styling box | `Container(padding: ..., color: ...)` |
| `TextField` | Text input | `TextField(controller: ...)` |
| `ElevatedButton` | Clickable button | `ElevatedButton(onPressed: ...)` |
| `ListView.builder` | Scrollable list | `ListView.builder(itemBuilder: ...)` |
| `ListTile` | List item | `ListTile(title: ..., leading: ...)` |

---

## 🎨 Color & Styling Quick Reference

```dart
// Colors
Colors.blue           // Predefined colors
Colors.blue[100]      // Lighter shade
Colors.blue[900]      // Darker shade
Color(0xFF1976D2)     // Custom hex color

// Text Styling
TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  decoration: TextDecoration.lineThrough,
)

// Container Decoration
BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8.0),
  boxShadow: [BoxShadow(...)],
  border: Border.all(color: Colors.grey),
)

// Padding & Margin
EdgeInsets.all(16.0)           // All sides
EdgeInsets.symmetric(horizontal: 16.0)  // Left & right
EdgeInsets.only(top: 8.0)      // Specific sides
```

---

## 📊 Progress Tracking

**Quick Self-Check:**
- [ ] Can create new Flutter project
- [ ] Understand widget tree concept
- [ ] Can use setState() correctly
- [ ] Can build basic UI layouts
- [ ] Can handle user input
- [ ] Can manage lists of data
- [ ] Can implement navigation/dialogs
- [ ] Can style UI professionally

**Confidence Level:** ___/10

---

## 🆘 Need Help?

**Immediate Help:**
1. 🔍 **Search this tutorial** - Use Ctrl+F untuk find keywords
2. 📖 **Check troubleshooting** - [troubleshooting.md](troubleshooting.md)
3. 💻 **Compare templates** - [templates/](tutorial/templates/)
4. 👀 **Visual verification** - [visual-guide.md](tutorial/assets/visual-guide.md)

**External Resources:**
- 📚 **Flutter Docs**: https://flutter.dev/docs
- 💬 **Stack Overflow**: Search "[flutter] your-error-message"
- 🎬 **YouTube**: "Flutter Widget of the Week"
- 💭 **Reddit**: r/FlutterDev

**Ask Instructor:**
- Include: Tahap number, exact error message, what you tried
- Attach: Screenshot of error dan your code
- Be specific: "Tahap 3 Step 2.4" instead of "doesn't work"

---

## 🎊 Celebration Milestones

Track your wins:
- [ ] 🎯 **First app running** - You're officially a mobile developer!
- [ ] 🎨 **First custom UI** - Design skills unlocked!
- [ ] 🧠 **First state management** - You understand how apps think!
- [ ] 📱 **First dynamic list** - Data management mastered!
- [ ] 🔧 **First CRUD operations** - Full app functionality!
- [ ] ✨ **First polished app** - Production quality achieved!

**🏆 Final Achievement: Flutter Developer Certification (Self-Awarded)! 🏆**

---

*Keep this reference handy during your learning journey! 📱✨*