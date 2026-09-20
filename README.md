# REQORD

REQORD adalah spreadsheet sederhana untuk mengelola work order. Pengguna menambahkan title pekerjaan, requestor, priority, dan tanggal request, lalu item otomatis tampil di salah satu dari tiga tabel: `Request list`, `Ongoing requests`, atau `Done requests`.

[Dibuat oleh Budi Indra Ilham](https://www.linkedin.com/in/budife/).

Fokus utama REQORD adalah memberi gambaran cepat tentang request yang baru masuk, sedang dikerjakan, dan sudah selesai, dengan pengalaman ringan seperti Monday.com.

## Dokumen Utama

- [`AGENT.md`](AGENT.md): instruksi kerja untuk AI agent.
- [`STYLE.md`](STYLE.md): aturan gaya penulisan dan implementasi.
- [`MEMORY.md`](MEMORY.md): konteks, keputusan, dan handoff antar sesi/model.
- [`CHANGELOG.md`](CHANGELOG.md): riwayat perubahan yang dapat dilacak.
- [`ROADMAP.md`](ROADMAP.md): tahapan pengembangan dari MVP sampai fitur lanjutan.

## Visi Produk

Satu tempat untuk mengubah pekerjaan mentah menjadi pipeline yang terstruktur, dapat dilacak, dapat dibagikan, dan dapat dibawa keluar-masuk melalui file `.xlsx` tanpa kehilangan data penting.

## Fitur Utama

### Tiga Tabel Work Order

- `Request list`: semua request baru atau belum dimulai.
- `Ongoing requests`: request yang sedang dikerjakan.
- `Done requests`: request yang telah selesai.
- Tambah title, requestor, dan priority melalui form; status awal otomatis `Request list`.
- Requestor wajib diisi, bisa diketik bebas, dan menampilkan rekomendasi nama yang mirip dari data/XLSX yang sudah ada.
- Dropdown requestor menampilkan avatar inisial, jumlah hasil, empty state, dan navigasi keyboard `Arrow Up`, `Arrow Down`, `Enter`, dan `Esc`.
- Tidak ada field status atau deadline pada form work order.
- Tanggal dan jam request tercatat otomatis saat work order dibuat dan dapat disesuaikan.
- `Target done` otomatis dihitung 3 hari setelah tanggal request.
- Target done menampilkan tanggal lengkap dan konteks waktu seperti `Hari ini`, `Besok`, `2 hari lagi`, atau `Terlambat 1 hari`.
- Kolom `Target done` menampilkan tanggal dan sisa waktu seperti `2 hari lagi`, `Besok`, `Hari ini`, atau `Terlambat 1 hari`.
- Warna row target done: hari request tetap normal, sisa 2 hari menjadi kuning, dan sisa 1 hari atau lewat menjadi merah.
- Ubah status langsung di dalam tabel; item otomatis berpindah tabel.
- Ubah priority langsung di dalam tabel.
- Cari berdasarkan title atau requestor.
- Tombol centang di ujung baris menandai request selesai dan memindahkannya ke Done requests.
- Tombol `▶ Saya kerjain` pada Request list memindahkan request ke Ongoing requests.
- Tombol `↻` pada Done requests mengembalikan request ke Ongoing requests untuk revisi.
- Tombol tong sampah menghapus request setelah konfirmasi `Delete, beneran?`.
- `Done requests` menampilkan maksimal 10 item dan menyediakan `Load more done works` untuk menambah 10 item berikutnya.

### Daily Tasks

- Daily tasks tampil di atas Request list.
- Semua item baru dari form `Add work order` otomatis masuk ke `Request list`.
- Request yang statusnya diubah menjadi `Daily task` otomatis berpindah ke tabel Daily.
- Daily task memakai kolom dan dropdown status/priority yang sama, tetapi kolomnya memakai label `Today` dan `Done today`; keduanya selalu mengikuti hari ini, judul dicoret setelah selesai, dan status otomatis reset saat tanggal berganti.
- Daily dan request memakai satu penyimpanan data agar perpindahan tetap konsisten.

### XLSX

- `Load` memuat workbook yang dipilih; REQORD membaca sheet `Request List`, `Ongoing Requests`, `Done Requests`, dan `Daily Tasks`.
- Setelah file berhasil dimuat di Chrome/Edge, `Save changes` menulis kembali ke file XLSX yang sama.
- `Save changes` disabled sebelum file dibuka agar tidak membuat download baru tanpa sengaja.
- Setiap sheet project memiliki tabel sendiri dengan header yang sama, filter Excel, dan kolom yang sudah diatur lebarnya.
- Workbook juga memiliki sheet `Daily Tasks` dengan kolom Task, Requestor, Date, Priority, dan Done; `Done` merepresentasikan penyelesaian pada hari saat file disimpan.
- Kolom workbook: `Title`, `Status`, `Requestor`, `RequestDate` (tanggal dan jam), `TargetDone`, dan `Priority`; tanggal Excel serial juga dinormalisasi saat dibuka.
- `New` membuat draft lokal baru; data draft disimpan ke IndexedDB dengan fallback localStorage sehingga tetap ada setelah F5.
- `Load` memuat workbook dan mengganti data aktif; `Save` me-replace workbook yang sedang dibuka, sedangkan `Save as New` membuat workbook baru.
- Nama file aktif selalu ditampilkan di samping tombol aksi; mode draft menampilkan `Draft lokal`.
- Footer menampilkan `budife.psd`; hover menampilkan `Meet the maker`, dan klik membuka modal dengan tab `Profile` serta `Changelog`.
- `Settings` menyediakan `Download table template` untuk membuat workbook kosong dengan struktur sheet REQORD.
- `History & Activity` tersedia sebagai panel di topbar sebelah kanan, mencatat add, status, priority, complete, daily done, revision, dan delete.
- Saat `Save changes / Replace`, history diekspor ke sheet `Activity` dan dapat dibaca kembali saat workbook dibuka.
- Sheet default Excel seperti `Sheet1`, `Sheet 2`, dan `Sheet 3` dibuang saat workbook disimpan.
- Template menyertakan satu baris contoh agar dapat dibuka langsung; hapus baris bertanda contoh sebelum mengisi data.
- `Save changes / Replace` menulis kembali ke file yang dibuka; jika izin tulis belum tersedia, aplikasi meminta pengguna memilih file tujuan melalui save picker.
- Jika ada perubahan yang belum disimpan, aplikasi memberi peringatan saat F5 atau tab ditutup; autosave langsung ke Excel tidak dapat dilakukan tanpa izin tulis browser.

### UI

- Tampilan flat minimal REQORD dengan palet hijau matcha, garis tipis samar, dan aksen seperlunya.
- Menu `Settings` menyediakan profile maker, LinkedIn, changelog, dan history aktivitas.
- Responsive untuk desktop dan mobile.

## Status Saat Ini

- Fase: prototype work order spreadsheet tiga tabel.
- Implementasi awal tersedia sebagai aplikasi statis di root repository.
- Stack production, database, test, lint, dan build command belum dipilih.
- Requirement XLSX dan arah visual flat matcha sudah menjadi constraint produk.
- Prototype browser-first tersedia di `index.html`, `styles.css`, dan `app.js`; data demo tersimpan di `localStorage`.
- Prototype mendukung tiga tabel spreadsheet, tambah work order, edit status/priority langsung, search, import XLSX, dan export XLSX.

## Memulai Pekerjaan

Sebelum mengubah repository:

1. Baca `AGENT.md`.
2. Baca catatan terbaru di `MEMORY.md`.
3. Periksa `CHANGELOG.md` untuk mengetahui perubahan sebelumnya.
4. Baca `ROADMAP.md` sebelum memilih scope implementasi.
5. Setelah bekerja, perbarui dokumentasi dan validasi hasilnya.
