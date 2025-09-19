# 🎨 Visual Guide - Apa yang Harus Kamu Lihat

**IMPORTANT:** Screenshot akan ditambahkan instruktur. File ini berisi deskripsi visual untuk setiap tahap.

---

## 📱 Tahap 1: Setup Dasar

**Target Visual:**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║  ← AppBar biru
╠══════════════════════════════╣
║                              ║
║                              ║
║      Coming Soon!            ║  ← Text di tengah, ukuran besar
║                              ║
║                              ║
╚══════════════════════════════╝
```

**Key Visual Elements:**
- AppBar dengan background biru solid
- Text "My To-Do List" warna putih di AppBar
- Background body putih bersih
- Text "Coming Soon!" center, font size 24
- Tidak ada scrollbar atau elemen lain

---

## 🎨 Tahap 2: UI Foundation

**Target Visual:**
```
╔══════════════════════════════╗
║  📱 My To-Do List            ║  ← AppBar biru
╠══════════════════════════════╣
║ ┌──────────────────────────┐ ║
║ │ ✏️ Ketik task baru..    │ ║  ← TextField dalam container abu-abu
║ │                          │ ║
║ │ [+] Add Task             │ ║  ← Button biru full-width
║ └──────────────────────────┘ ║  ← Container dengan border radius
║                              ║
║                              ║
╚══════════════════════════════╝
```

**Key Visual Elements:**
- Container abu-abu muda dengan sudut melengkung
- TextField dengan border, placeholder text, icon pensil di kiri
- Button biru dengan icon plus, text putih, full width
- Padding 16px di semua sisi
- Jarak 12px antara TextField dan Button

---

## 🧠 Tahap 3: State Management

**Target Visual (Empty State):**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║
╠══════════════════════════════╣
║ ┌──────────────────────────┐ ║
║ │ ✏️ [input kosong]       │ ║  ← Input bersih setelah add
║ │ [+] Add Task             │ ║
║ └──────────────────────────┘ ║
║                              ║
║ Belum ada task. Yuk tambah   ║  ← Dynamic text
║ yang pertama!                ║
║                              ║
╚══════════════════════════════╝
```

**Target Visual (With Tasks):**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║
╠══════════════════════════════╣
║ ┌──────────────────────────┐ ║
║ │ ✏️ [input kosong]       │ ║
║ │ [+] Add Task             │ ║
║ └──────────────────────────┘ ║
║                              ║
║ Kamu punya 3 tasks           ║  ← Counter update otomatis
║                              ║
╚══════════════════════════════╝
```

**Key Behaviors:**
- Input clear otomatis setelah add task
- Text counter berubah real-time
- Console print menunjukkan array content

---

## 📋 Tahap 4: Dynamic Lists

**Target Visual (Empty):**
```
╔═══════════════════════════════╗
║  📱 My To-Do List            ║
╠═══════════════════════════════╣
║ [Form area sama seperti atas] ║
║ Kamu punya 0 tasks            ║
║ ┌──────────────────────────┐  ║
║ │        📪                │ ║  ← Icon inbox besar
║ │    Belum ada task        │  ║
║ │ Tambahkan task pertamamu │  ║
║ │ di atas!                 │  ║
║ └──────────────────────────┘  ║
╚═══════════════════════════════╝
```

**Target Visual (With Items):**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║
╠══════════════════════════════╣
║ [Form area]                  ║
║ Kamu punya 3 tasks           ║
║ ┌──────────────────────────┐ ║
║ │ (1) Belajar Flutter      │ ║  ← Nomor dalam circle
║ │     Task #1 • Belum      │ ║
║ ├──────────────────────────┤ ║
║ │ (2) Ngoding App          │ ║  ← Shadow halus
║ │     Task #2 • Belum      │ ║
║ ├──────────────────────────┤ ║
║ │ (3) Deploy App           │ ║  ← Bisa scroll jika banyak
║ │     Task #3 • Belum  ○   │ ║
║ └──────────────────────────┘ ║
╚══════════════════════════════╝
```

**Key Visual Elements:**
- List items dengan shadow subtle
- Leading circle dengan nomor urut
- Subtitle informatif
- Icon unchecked di trailing
- Smooth scrolling behavior

---

## 🗑️ Tahap 5: Delete Functionality

**Target Visual:**
```
╔══════════════════════════════╗
║  📱 My To-Do List           ║
╠══════════════════════════════╣
║ [Form area]                  ║
║ Kamu punya 3 tasks           ║
║ ┌──────────────────────────┐ ║
║ │ (1) Belajar Flutter  ○🗑️│ ║  ← Delete icon merah
║ ├──────────────────────────┤ ║
║ │ (2) Ngoding App      ○🗑️│ ║
║ ├──────────────────────────┤ ║
║ │ (3) Deploy App       ○🗑️│ ║
║ └──────────────────────────┘ ║
╚══════════════════════════════╝
```

**Dialog Konfirmasi:**
```
┌─────────────────────────────┐
│ ⚠️  Konfirmasi Hapus        │
├─────────────────────────────┤
│ Apakah kamu yakin ingin     │
│ menghapus task ini?         │
│                             │
│ ┌─────────────────────────┐ │
│ │ "Belajar Flutter"       │ │  ← Preview task
│ └─────────────────────────┘ │
├─────────────────────────────┤
│         [Batal]    [Hapus]  │  ← Buttons
└─────────────────────────────┘
```

**Key Behaviors:**
- Red delete icon di setiap item
- Dialog dengan preview task yang akan dihapus
- Batal = no action, Hapus = item hilang
- Nomor urut update otomatis

---

## ✅ Tahap 6: Toggle Status

**Target Visual (Mixed States):**
```
╔══════════════════════════════════╗
║  📱 My To-Do List               ║
╠══════════════════════════════════╣
║ [Form area]                      ║
║ Kamu punya 4 tasks               ║
║ ┌──────────────────────────┐     ║
║ │ ✅ ~~Belajar Flutter~~  ✅🗑️│║  ← Completed: hijau + coret
║ ├──────────────────────────┤     ║
║ │ (2) Ngoding App      ○🗑️ │    ║  ← Incomplete: normal
║ ├──────────────────────────┤     ║
║ │ ✅ ~~Deploy App~~    ✅🗑️  │ ║  ← Completed: hijau + coret
║ ├──────────────────────────┤     ║
║ │ (4) Testing App      ○🗑️ │    ║  ← Incomplete: normal
║ └──────────────────────────┘     ║
╚══════════════════════════════════╝
```

**Key Visual Differences:**

**Completed Tasks:**
- Background: Hijau muda (Colors.green[50])
- Border: Hijau (Colors.green[200])
- Leading: Checkmark hijau dalam circle
- Text: Strikethrough + grey color
- Opacity: Sedikit transparan (0.7)
- Subtitle: "Selesai ✅"

**Incomplete Tasks:**
- Background: Putih
- Border: None/default
- Leading: Nomor urut dalam circle biru
- Text: Normal black
- Opacity: Normal (1.0)
- Subtitle: "Belum selesai"

---

## ✨ Tahap 7: Final Polish

**Target Visual (With Statistics):**
```
╔════════════════════════════════╗
║  📱 My To-Do List             ║
╠════════════════════════════════╣
║ ┌──────────────────────────┐   ║
║ │ ✏️ Input + helper text   │  ║  ← Enhanced input
║ │ [+] Add Task             │   ║
║ └──────────────────────────┘   ║
║                                ║
║ ┌─ 📊 Statistik Progress ─┐   ║  ← Statistics card
║ │ Total:4  Selesai:2  Belum:2│ ║  ← Icons + numbers
║ └──────────────────────────┘   ║
║                                ║
║ Kamu punya 4 tasks             ║
║ [List area with all features]  ║
╚════════════════════════════════╝
```

**SnackBar Examples:**
```
┌─────────────────────────────┐
│ ⚠️ Task tidak boleh kosong!│  ← Orange warning
└─────────────────────────────┘

┌─────────────────────────────┐
│ ℹ️ Task "Belajar" sudah ada!│  ← Blue info
└─────────────────────────────┘

┌─────────────────────────────┐
│ ✅ Task "Ngoding" berhasil │  ← Green success
│    ditambahkan!             │
└─────────────────────────────┘

┌─────────────────────────────┐
│ 🎉 Selamat! Task selesai!  │  ← Celebration
└─────────────────────────────┘
```

**Key Polish Elements:**
- Statistics card dengan gradient background
- Helper text di bawah input
- Floating SnackBars dengan icons
- Professional color coding
- Smooth animations dan transitions

---

## 🎊 Final App Showcase

**Complete Feature Demonstration:**

1. **Empty State** → Professional empty state dengan instructions
2. **Add Tasks** → Smart validation dengan immediate feedback
3. **List Display** → Beautiful, scrollable list dengan consistent styling
4. **Toggle Status** → Visual feedback dengan color changes dan animations
5. **Delete Operations** → Safe deletion dengan confirmation dialogs
6. **Statistics** → Real-time progress tracking
7. **Error Handling** → Comprehensive validation dengan user-friendly messages

**Production Ready Quality:**
- No bugs atau crashes
- Responsive design
- Professional UI/UX
- Smooth performance
- Comprehensive feature set

---

## 📱 Screen Size Testing

**Test app pada different screen sizes:**

**Small Phone (320dp width):**
- All elements visible tanpa overflow
- Text readable tanpa zoom
- Buttons easily tappable

**Large Phone (400dp+ width):**
- Layout proporsional
- Tidak ada wasted space
- Statistics card well-balanced

**Tablet (600dp+ width):**
- App still functional
- Layout tidak stretched weird
- Good use of available space

---

## 🎯 Visual Quality Checklist

Untuk setiap tahap, pastikan:
- [ ] Colors consistent dengan design system
- [ ] Typography readable dan hierarchy jelas
- [ ] Spacing consistent (8dp, 12dp, 16dp, 20dp grid)
- [ ] Interactive elements clearly clickable
- [ ] Loading states atau transitions smooth
- [ ] Error states informatif dan helpful
- [ ] Success states celebratory tapi not annoying

**Remember:** Visual design sama pentingnya dengan functionality untuk user experience yang baik! 🎨
