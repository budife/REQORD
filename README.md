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
- Daily task memakai satu kolom `Hari ini`: `Belum selesai` atau `Selesai`; tanggal tampil sebagai konteks kecil, judul dicoret setelah selesai, dan status otomatis reset saat tanggal berganti.
- Daily dan request memakai satu penyimpanan data agar perpindahan tetap konsisten.

### XLSX

- `Load` memuat workbook yang dipilih; REQORD membaca sheet `Request List`, `Ongoing Requests`, `Done Requests`, dan `Daily Tasks`.
- Draft lokal tidak mengganggu file environment di workspace; artefak agent dikecualikan lewat `.gitignore`.
- Setelah file berhasil dimuat di Chrome/Edge, `Save` menulis kembali ke file XLSX yang sama.
- `Save` dapat menyimpan draft atau replace workbook yang sudah di-Load.
- Setiap sheet project memiliki tabel sendiri dengan header yang sama, filter Excel, dan kolom yang sudah diatur lebarnya.
- Workbook juga memiliki sheet `Daily Tasks` dengan kolom Task, Requestor, Date, Priority, dan Done; `Done` merepresentasikan penyelesaian pada hari saat file disimpan.
- Kolom workbook: `Title`, `Status`, `Requestor`, `RequestDate` (tanggal dan jam), `TargetDone`, dan `Priority`; tanggal Excel serial juga dinormalisasi saat dibuka.
- `New` membuat draft lokal baru; draft lokal dibersihkan saat F5/reload sehingga aplikasi selalu mulai dari kondisi kosong.
- Simpan ke workbook sebelum F5 jika ingin mempertahankan perubahan.
- `Load` memuat workbook dan mengganti data aktif; `Save` me-replace workbook yang sedang dibuka.
- Setelah Load, aplikasi menampilkan ringkasan row yang berhasil dimuat.
- Nama file aktif selalu ditampilkan di samping tombol aksi; mode draft menampilkan `Draft lokal`.
- Toolbar menampilkan status `Draft lokal`, `Unsaved changes`, atau `Saved to workbook`.
- Tabel mendukung filter priority, sorting, dan edit cepat Title/Requestor; delete menyediakan Undo selama beberapa detik.
- Title dan Requestor sekarang diedit melalui icon edit di Actions dan modal `Edit work order`.
- Saat mengetik Title, REQORD menampilkan work order yang judulnya mirip untuk membantu mencegah data duplikat.
- Request list dan Ongoing requests hanya menampilkan Request date; saat request selesai, Done requests menampilkan `Est.` dari Request date sampai selesai.
- Done request dapat mengubah `Est.` melalui modal Edit work order.
- Catatan disimpan di workbook dan dibuka melalui klik Title yang memiliki note, lalu diedit dari modal Edit work order; kolom Catatan tidak ditampilkan di tabel.
- Subitems tersedia sebagai checklist kosong ala Monday.com; ketik subitem lalu tekan Enter untuk menambahkannya.
- Subitems disimpan ke sheet `Subitems` dengan ParentID, WorkOrder, Subitem, Done, dan Order, lalu dipulihkan saat Load.
- Catatan request ikut disimpan ke workbook pada sheet `Notes`.
- Daily tasks menampilkan jumlah task yang selesai hari ini.
- Checkbox Daily task otomatis kembali tidak tercentang saat tanggal berganti, termasuk jika halaman tetap terbuka.
- Daily task memakai label `Status hari ini` agar kondisi belum/sudah dikerjakan lebih jelas.
- Status flow tabel: Request list, Ongoing request, Preview, On revision, Done request, lalu Daily tasks.
- Urutan kolom tabel: Title, Requestor, Status, Date/Day, Priority; Done requests menambahkan Est.
- Perpindahan request dilakukan melalui dropdown Status; row tidak lagi memiliki kolom Actions.
- Work order details menjadi pusat edit Title, Requestor, Catatan, Subitems, Est. Done, dan Delete untuk semua status.
- Deadline request tetap menampilkan tanggal dan konteks waktu tanpa highlight row merah/kuning.
- Request list tidak lagi menampilkan action `Tandai selesai`; pindahkan status ke Ongoing terlebih dahulu, lalu selesaikan dari Ongoing.
- Tanggal dan jam di Excel memakai spasi (`YYYY-MM-DD HH:mm`), bukan separator `T`.
- Browser E2E checklist tersedia di `test/browser-e2e-checklist.md`; runtime browser diperlukan untuk memverifikasi permission File System Access dan OneDrive sync.
- SheetJS dan Font Awesome masih menggunakan CDN pada prototype; bundling lokal perlu dilakukan saat build/deployment pipeline tersedia.
- Footer menampilkan `budife.psd`; hover menampilkan `Meet the maker`, dan klik membuka modal dengan tab `Profile` serta `Recent changes`.
- Tab `Recent changes` di modal maker menampilkan ringkasan perubahan terbaru; riwayat lengkap tetap berada di `CHANGELOG.md` pada repository GitHub.
- Tab `Recent changes` juga menampilkan seluruh commit repository dengan hash, tanggal, dan message.
- Commit list dapat digenerate dengan `node scripts/generate-recent-changes.js`; outputnya `recent-changes.json`.
- Saat dijalankan melalui web server, Recent changes membaca `recent-changes.json` dan memakai fallback jika file belum tersedia.
- `Settings` menyediakan `Download table template` untuk membuat workbook kosong dengan struktur sheet REQORD.
- `History & Activity` tersedia sebagai panel di topbar sebelah kanan, mencatat add, status, priority, complete, daily done, revision, dan delete.
- Saat `Save`, history diekspor ke sheet `Activity` dan dapat dibaca kembali saat workbook dibuka.
- `History & Activity` menyimpan audit log lengkap tanpa batas 100 item, termasuk lifecycle New/Load/Save, edit, status, priority, daily done, delete, dan Undo.
- Sheet `Activity` memiliki kolom `Date`, `Action`, `Title`, `Requestor`, dan `Details`.
- Sheet default Excel seperti `Sheet1`, `Sheet 2`, dan `Sheet 3` dibuang saat workbook disimpan.
- Workbook diserialisasi dan divalidasi sebelum file dibuka untuk ditulis, sehingga kegagalan export tidak mengosongkan file sumber menjadi 0 byte.
- Template menyertakan satu baris contoh agar dapat dibuka langsung; hapus baris bertanda contoh sebelum mengisi data.
- `Save` menulis kembali ke file yang dibuka; jika izin tulis belum tersedia, aplikasi meminta pengguna memilih file tujuan melalui save picker.
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
