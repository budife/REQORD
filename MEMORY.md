# AI Memory

Dokumen ini menyimpan konteks kerja yang perlu diketahui oleh AI agent berikutnya, terutama saat model AI diganti. Catatan di sini harus ringkas, faktual, dan diperbarui setelah pekerjaan yang bermakna.

## Project Snapshot

- Nama aplikasi: `REQORD`.
- Creator: Budi Indra Ilham, LinkedIn: https://www.linkedin.com/in/budife/.
- Header menu memakai label `Settings` untuk profile maker, changelog, dan history.
- Lokasi kerja: root repository.
- Kondisi awal: repository kosong dan belum memiliki implementasi aplikasi.
- Dokumentasi dasar yang tersedia: `AGENT.md`, `README.md`, `STYLE.md`, dan `CHANGELOG.md`.
- Roadmap produk tersedia di `ROADMAP.md`.
- Test, lint, dan build: belum tersedia atau belum terdeteksi.

## Current State

- Produk: REQORD adalah spreadsheet work order sederhana dengan tiga tabel: Request list, Ongoing requests, dan Done requests.
- Kebutuhan inti: input title, requestor, target done, priority, status, tabel work order, inline editing, search, dan perpindahan tabel berdasarkan status.
- Aturan input: work order baru selalu masuk `Request list`; requestor wajib diisi, dapat diketik bebas dengan rekomendasi nama yang mirip dari data yang sudah ada; target done otomatis tiga hari setelah tanggal request.
- Integrasi data wajib: import dan export `.xlsx` dengan kolom Title, Status, Requestor, RequestDate, TargetDone, dan Priority.
- Workbook Excel mandiri: `Save Excel` membuat sheet `Request List`, `Ongoing Requests`, `Done Requests`, dan `Read me`; `Open file` membaca semua sheet request.
- Flow Excel terbaru: `Open file` memilih dan memuat workbook, `Save changes` menulis kembali ke file yang sama menggunakan File System Access API di Chrome/Edge; save disabled sebelum load.
- Daily tasks ditampilkan sebagai tabel di atas Ongoing requests; item baru dari Add work order selalu masuk Request list.
- Request yang statusnya diubah menjadi `Daily task` berpindah otomatis ke tabel Daily; semua item memakai satu storage.
- Tabel Daily memakai struktur yang sama dengan tabel request: Title, Requestor, Status, Priority, Request date, Target done, dan Actions.
- Setiap tabel request memiliki tombol centang untuk menyelesaikan request dan tombol sampah dengan konfirmasi `Delete, beneran?`.
- Request list memiliki action `▶ Saya kerjain` untuk memindahkan item ke Ongoing requests.
- Dropdown requestor memiliki matching list, avatar inisial, active keyboard state, dan keyboard navigation.
- Target done ditampilkan lengkap dengan tanggal tahun dan konteks sisa waktu.
- Target done menampilkan tanggal, countdown relatif, dan tooltip tanggal lengkap.
- Request yang perlu revisi dari Done requests memakai tombol `↻` dan kembali ke Ongoing requests.
- `Save Excel` juga membuat sheet `Daily Tasks`; `Open file` membaca task dari sheet tersebut.
- Setiap sheet project diekspor sebagai tabel terpisah dengan header dan autofilter Excel.
- Data lama dengan kolom `Owner` dimigrasikan ke `Requestor` saat dibaca; tanggal serial Excel dinormalisasi saat import.
- Arah visual: flat minimal hijau matcha, responsive, dan mudah digunakan.
- Arah visual terbaru: flat style minimal dengan primary color hijau matcha, permukaan solid, dan shadow ringan; tidak ada tombol close/delete pada baris tabel.
- UX terbaru: entrance/row animations, hover/focus feedback, sticky header, shortcut Ctrl/Cmd + K, suggestion dropdown animation, dan reduced-motion support.
- Prototype awal: `index.html`, `styles.css`, dan `app.js`, tanpa build step.
- Prototype memakai `localStorage` untuk data dan SheetJS CDN untuk import/export XLSX.
- Tidak ada keputusan arsitektur aplikasi yang sudah dibuat.
- Tidak ada dependency, environment variable, API, atau service yang sudah dikonfigurasi.
- Pekerjaan berikutnya harus memilih stack dan model data, lalu mengimplementasikan fondasi sesuai `ROADMAP.md`.

## Handoff Log

### 2026-09-20 (Maker modal)

- Agent/model: OpenCode.
- Permintaan: footer memakai `budife.psd`, hover `Meet the maker`, klik membuka modal/sidebar dengan tab Profile dan Changelog.
- Perubahan: mengganti credit footer menjadi trigger maker dan menambahkan maker modal dua tab.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Draft and workbook modes)

- Agent/model: OpenCode.
- Permintaan: data dapat dibuat sebelum load, tersimpan lokal, lalu workbook dapat di-load dan di-replace atau disimpan sebagai file baru.
- Perubahan: menambahkan aksi `New`, `Load`, `Save`, `Save as New`, `Refresh`, persistence IndexedDB/localStorage, dan mode replace workbook.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (History and activity panel)

- Agent/model: OpenCode.
- Permintaan: History dipindah dari Settings ke sisi kanan, digabung dengan activity, dan delete dicatat ke sheet.
- Perubahan: menambahkan panel topbar `History & Activity`, activity tracking untuk aksi utama, serta sheet `Activity` saat export workbook.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Unsaved changes warning)

- Agent/model: OpenCode.
- Permintaan: ingatkan pengguna menyimpan perubahan sebelum F5 karena autosave langsung ke Excel tidak memungkinkan tanpa izin browser.
- Perubahan: menambahkan dirty-state dan `beforeunload` warning; save berhasil menghapus status belum tersimpan.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Done request pagination)

- Agent/model: OpenCode.
- Permintaan: Done requests dibatasi 10 item dan bertambah 10 item lewat load more.
- Perubahan: menambahkan limit tampilan `Done requests` dan tombol `Load more done works`; data internal/export tetap lengkap.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Daily task recurrence)

- Agent/model: OpenCode.
- Permintaan: Daily tasks selesai per hari dan reset ketika tanggal berganti.
- Perubahan: menambahkan `dailyDoneDate`, action `Today done`, dan pengecekan tanggal hari ini saat render/export.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Daily task date display)

- Agent/model: OpenCode.
- Permintaan: tanggal Daily task harus berubah mengikuti hari, dan task yang selesai harus terlihat dicoret.
- Perubahan: `Request date` dan `Target done` daily selalu disegarkan ke hari ini; judul mendapat strikethrough saat `dailyDoneDate` sama dengan hari ini.
- Validasi: pemeriksaan sintaks JavaScript dan whitespace dijalankan setelah edit.

### 2026-09-20 (Template save fix)

- Agent/model: OpenCode.
- Masalah: template tanpa baris data ditolak sebagai workbook kosong; browser fallback tidak dapat menulis kembali file yang dipilih.
- Perubahan: `Save changes / Replace` meminta handle save bila belum tersedia lalu menulis workbook ke file tujuan; fallback download hanya dipakai jika browser tidak mendukung file picker.
- Validasi: `node --check app.js` dan `git diff --check` dijalankan.

### 2026-09-20 (Table template)

- Agent/model: OpenCode.
- Permintaan: menyediakan template table yang dapat diunduh dari `Settings`.
- Perubahan: menambahkan tombol `Download table template` dan workbook kosong dengan sheet request, `Daily Tasks`, serta `Read me`.
- Validasi: perubahan memakai library SheetJS yang sudah tersedia; validasi sintaks dijalankan setelah edit.

### 2026-09-20 (File-first storage)

- Agent/model: OpenCode.
- Permintaan: list tidak boleh muncul atau tersimpan sebelum pengguna membuka workbook.
- Perubahan: `app.js` memulai dengan list kosong dan tidak lagi menulis perubahan ke `localStorage`; label UI menjelaskan bahwa `Open file` harus dilakukan sebelum `Save changes`.
- Validasi: `node --check app.js` berhasil.
- Keputusan: data setelah `Open file` hanya berada di memori halaman sampai `Save changes` menulis kembali ke workbook yang dibuka.

### 2026-09-20

- Agent/model: OpenCode.
- Permintaan: menambahkan dokumentasi Markdown untuk agent, changelog, README, style, dan memory agar konteks tetap tersedia saat model AI berganti.
- Perubahan: membuat lima file dokumentasi di root repository.
- Validasi: memeriksa bahwa direktori awal kosong; belum ada test atau build yang dapat dijalankan.
- Next step: tentukan tujuan proyek dan tambahkan implementasi pertama beserta test yang relevan.

### 2026-09-20 (Product Definition)

- Agent/model: OpenCode.
- Klarifikasi pengguna: proyek REQORD ditujukan untuk membuat dan memantau request/work order, mirip Monday.com, dengan penyimpanan otomatis ke XLSX serta kemampuan import/export.
- Keputusan produk: scope mencakup pipeline, board/table views, status pekerjaan, custom fields, collaboration, dashboard, XLSX data flow, dan visual premium glassmorphism.
- Perubahan: memperbarui `README.md`, `AGENT.md`, `STYLE.md`, `CHANGELOG.md`, `MEMORY.md`, dan menambahkan `ROADMAP.md`.
- Validasi: dokumentasi dibaca ulang; belum ada implementasi atau test yang dapat dijalankan.
- Next step: pilih stack dan bentuk model data, lalu implementasikan Phase 0 dan MVP pipeline.

### 2026-09-20 (Prototype)

- Agent/model: OpenCode.
- Perubahan: mengganti inbox menjadi spreadsheet work order dengan form add work order dan tiga tabel Project list, Ongoing projects, Done projects.
- XLSX: import dan export work order menggunakan kolom Title, Status, Requestor, RequestDate, TargetDone, dan Priority melalui SheetJS CDN.
- Interaksi: status dan priority dapat diubah langsung dari dropdown tabel; perubahan status otomatis memindahkan baris ke tabel yang sesuai; data tersimpan di `localStorage`.
- Input baru: form tidak meminta status atau target done; status awal otomatis `Project list` dan target done dihitung sistem.
- Aturan target terbaru: form tidak menampilkan status/deadline; tanggal dan jam request dicatat, target done otomatis tanggal request +3 hari. Hari request normal, row kuning saat sisa tepat 2 hari, dan merah saat sisa maksimal 1 hari.
- Validasi: file dibuat dan referensi antar-file diperiksa; belum menjalankan browser test otomatis.
- Next step: jalankan `index.html` di browser, pilih stack production, lalu ganti data lokal dengan model backend/import flow yang tervalidasi.

## Open Questions

- Stack frontend, backend, database, dan library XLSX apa yang akan digunakan?
- Apakah aplikasi harus local-first, cloud-first, atau hybrid?
- Apakah autosave ke XLSX berarti file lokal otomatis, penyimpanan server dalam format XLSX, atau export terjadwal?
- Apakah kolaborasi real-time dan multi-user masuk MVP atau fase berikutnya?
- Format matching item saat import memakai ID, external ID, atau kombinasi field?
- Apa definisi selesai untuk MVP pertama?

## Rules For Future Entries

- Tambahkan entri baru di bagian paling atas `Handoff Log`.
- Jangan menghapus catatan lama kecuali sudah terbukti salah; koreksi dengan catatan baru.
- Gunakan tanggal format `YYYY-MM-DD`.
- Catat fakta dan hasil validasi, bukan dugaan yang belum dikonfirmasi.
