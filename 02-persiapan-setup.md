# 🚀 Persiapan Awal Tutorial Flutter To-Do List

**Selamat datang! Mari kita siapkan semua yang dibutuhkan sebelum coding.**

## 📋 Checklist Persiapan

Ikuti checklist ini step-by-step:

### ✅ 1. Cek System Requirements

**Windows:**
- Windows 10 atau lebih baru (64-bit)
- RAM minimal 4GB (recommended 8GB+)
- Storage kosong 10GB
- Git for Windows

**macOS:**
- macOS 10.14 atau lebih baru
- RAM minimal 4GB (recommended 8GB+)
- Xcode (dari App Store)
- Git (biasanya sudah ada)

**Linux (Ubuntu):**
- Ubuntu 18.04+ atau distro equivalent
- RAM minimal 4GB
- Git dan curl

### ✅ 2. Install Flutter SDK

**Step 2.1: Download Flutter**
1. Buka https://flutter.dev/docs/get-started/install
2. Pilih OS kamu (Windows/macOS/Linux)
3. Download Flutter SDK (sekitar 1GB)

**Step 2.2: Extract dan Setup PATH**

**Windows:**
```bash
# Extract ke C:\flutter
# Tambah C:\flutter\bin ke PATH environment variable
```

**macOS/Linux:**
```bash
# Extract ke ~/flutter
cd ~
unzip flutter_[version].zip
export PATH="$PATH:`pwd`/flutter/bin"
```

**Step 2.3: Verifikasi Installation**
```bash
flutter doctor
```

**Expected output:**
```
✓ Flutter (Channel stable, version X.X.X)
✓ Android toolchain - develop for Android devices
✓ VS Code
```

### ✅ 3. Setup Editor (VS Code)

**Step 3.1: Install VS Code**
- Download dari https://code.visualstudio.com/
- Install dengan default settings

**Step 3.2: Install Flutter Extensions**
1. Buka VS Code
2. Tekan `Ctrl+Shift+X` (Extensions)
3. Search dan install:
   - **Flutter** (by Dart Code)
   - **Dart** (by Dart Code)

**Step 3.3: Test Extension**
1. Tekan `Ctrl+Shift+P`
2. Ketik "Flutter: New Project"
3. Jika muncul options, berarti sudah benar!

### ✅ 4. Setup Android Development

**Step 4.1: Install Android Studio**
- Download dari https://developer.android.com/studio
- Install dengan default components
- Buka Android Studio → Configure → SDK Manager
- Install Android 10+ SDK

**Step 4.2: Setup Android Emulator**
1. Android Studio → Configure → AVD Manager
2. Create Virtual Device
3. Pilih Phone → Pixel 4
4. Download system image (API 30+)
5. Finish dan test emulator

**Step 4.3: Accept Android Licenses**
```bash
flutter doctor --android-licenses
# Ketik 'y' untuk semua licenses
```

### ✅ 5. Final Verification

Run command ini dan pastikan semua ✓:

```bash
flutter doctor -v
```

**Target output:**
```
[✓] Flutter (Channel stable)
[✓] Android toolchain
[✓] VS Code
[✓] Connected device (Android emulator)
```

## 🎯 Create Your First Project

Mari test setup dengan membuat project test:

```bash
# Buat folder untuk tutorial
mkdir flutter_tutorial
cd flutter_tutorial

# Buat project test
flutter create test_app
cd test_app

# Run project
flutter run
```

**✅ SUCCESS INDICATOR:**
- Emulator terbuka
- App "test_app" running
- Ada counter dengan tombol +
- Hot reload works (tekan 'r' di terminal)

## 📁 Setup Workspace untuk Tutorial

Sekarang siapkan workspace khusus tutorial:

```bash
# Keluar dari test_app
cd ..

# Buat project untuk tutorial
flutter create todo_app_pemula
cd todo_app_pemula

# Buka di VS Code
code .
```

**Struktur folder yang akan kita gunakan:**
```
todo_app_pemula/
├── lib/
│   └── main.dart          # ← File utama kita
├── pubspec.yaml           # Dependencies
├── android/               # Android config
├── ios/                   # iOS config
└── test/                  # Testing files
```

## 🎊 Checkpoint: Ready to Code!

**Cek semua sudah selesai:**

- [ ] ✅ Flutter SDK installed dan verified
- [ ] ✅ VS Code dengan Flutter extension
- [ ] ✅ Android emulator bisa jalan
- [ ] ✅ Test project berhasil running
- [ ] ✅ Workspace `todo_app_pemula` ready
- [ ] ✅ Semangat coding 100% 🔥

## ⚠️ Troubleshooting Common Issues

**❌ Problem: flutter command not found**
```bash
# Solution: Add Flutter to PATH
export PATH="$PATH:[PATH_TO_FLUTTER]/bin"
```

**❌ Problem: Android licenses not accepted**
```bash
# Solution:
flutter doctor --android-licenses
# Ketik 'y' untuk semua
```

**❌ Problem: No devices found**
```bash
# Solution: Start emulator
# Atau connect physical device dengan USB debugging
```

**❌ Problem: VS Code tidak detect Flutter**
```bash
# Solution:
# 1. Restart VS Code
# 2. Ctrl+Shift+P → "Dart: Get Packages"
# 3. Re-install Flutter extension
```

## 📞 Need More Help?

**Jika masih stuck:**
1. Screenshot error message
2. Copy output dari `flutter doctor -v`
3. Tanya instruktur dengan info spesifik
4. Check Flutter documentation: https://flutter.dev/docs

---

## 🎯 Ready? Let's Code!

Semua sudah siap? Perfect!

**👇 Lanjut ke tahap pertama:**

# ➡️ [Tahap 1: Setup Dasar App](tahap1/README.md)

---

**💡 Pro Tips:**
- Bookmark halaman ini untuk reference
- Keep terminal dan emulator open selama tutorial
- Jangan ragu experiment dengan kode!
- Save progress setiap selesai tahap

*Let's build something awesome! 🚀*