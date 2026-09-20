# Changelog

Semua perubahan penting pada repository ini dicatat di sini. Format mengikuti kategori sederhana agar mudah dibaca oleh manusia dan AI agent.

## [Unreleased]

### Added

- Menambahkan mode draft lokal dengan `New`, `Load`, `Save`, `Save as New`, dan `Refresh`; draft disimpan di IndexedDB dengan fallback localStorage.
- Menghapus tombol `Refresh` dari toolbar utama dan menampilkan nama file aktif di sebelah kontrol workbook.
- Memindahkan History ke panel `History & Activity` di sebelah kanan dan menambahkan sheet `Activity` pada workbook, termasuk catatan delete.
- Menambahkan peringatan perubahan belum disimpan saat reload atau menutup tab; status bersih kembali setelah `Save changes / Replace` berhasil.
- Membatasi tampilan `Done requests` menjadi 10 item per batch dengan tombol `Load more done works`.
- Daily task kini memakai label `Today` dan `Done today`; tanggal mengikuti hari berjalan, judul dicoret saat checkbox selesai hari ini aktif, dan status reset pada hari berikutnya.
- Memperbaiki `Save changes / Replace` agar meminta izin file tujuan dan menulis workbook kembali ke file yang dipilih, bukan menganggap download sebagai replace.
- Menambahkan tombol `Download table template` di `Settings` untuk mengunduh workbook Excel kosong dengan seluruh sheet REQORD.
- Mengubah penyimpanan menjadi file-first: list kosong sebelum `Open file`, tanpa autosave ke `localStorage`, dan `Save changes` hanya aktif setelah workbook dibuka.

- Menambahkan dokumentasi dasar untuk AI agent dan handoff antar-model.
- Menambahkan `AGENT.md`, `README.md`, `STYLE.md`, dan `MEMORY.md`.
 - Menambahkan product brief REQORD sebagai spreadsheet work order tiga tabel.
- Menambahkan requirement Project list, Ongoing projects, Done projects, dan status yang memindahkan item otomatis.
- Menambahkan `ROADMAP.md` untuk tahapan MVP hingga automation.
- Menambahkan prototype spreadsheet browser-first dengan form add work order, tiga tabel, inline status/priority editing, dan tema glassmorphism.
- Menambahkan penyimpanan lokal, search, perubahan tabel otomatis, serta import/export XLSX.
- Menambahkan status awal otomatis ke Project list, owner dropdown dari data yang tersedia, dan deadline otomatis tiga hari setelah input.
- Menyederhanakan UI dengan primary color hijau, glassmorphism subtle, dan menghapus tombol close/delete dari tabel.
- Menambahkan tanggal request, deadline manual dengan fallback tiga hari, serta indikator warna deadline merah dan kuning.
- Menghapus status dan deadline dari form work order; status awal otomatis masuk Project list dan tabel menampilkan Target done otomatis.
- Mengganti Owner menjadi Requestor dengan input bebas dan rekomendasi nama berdasarkan data yang sudah tersimpan.
- Menambahkan jam pada tanggal request dan menampilkannya di tabel serta export XLSX.
- Mengganti label import/export menjadi `Open file` dan `Save Excel`; workbook memiliki tiga sheet project dan `Read me` agar dapat digunakan tanpa membuka web.
- Mengganti tema dari glassmorphism ke flat style minimal dengan palet hijau matcha.
- Menambahkan modern interaction layer: entrance animation, row transition, hover/focus state, sticky header, shortcut keyboard, smooth scroll, dan reduced-motion support.
- Audit memperbaiki migrasi data lama `Owner` ke `Requestor` serta normalisasi tanggal serial dari Excel.
- Mengganti istilah `Project` menjadi `Request` pada tabel, status, workbook Excel, dan UI.
- Mengganti workspace label menjadi `REQORD / Work order manager` dan menambahkan credit LinkedIn Budi Indra Ilham.
- Mengubah flow Excel menjadi Open file lalu Save changes ke file yang sama memakai File System Access API di Chrome/Edge.
- Menambahkan tabel Daily tasks di atas Request list dengan add task, date, priority, checkbox selesai, dan penyimpanan lokal terpisah.
- Menyatukan Daily task ke form Add work order dan satu data store; perubahan status ke Daily task otomatis memindahkan item ke tabel Daily.
- Menambahkan action buttons di ujung tabel request: complete memindahkan ke Done requests dan delete meminta konfirmasi.
- Menambahkan action `↻ Revisi` pada Done requests untuk mengembalikan request ke Ongoing requests.
- Menambahkan action `▶ Saya kerjain` pada Request list untuk memindahkan request ke Ongoing requests.

### Notes

- Prototype statis sudah tersedia; stack production, test, lint, dan build command belum dipilih.
