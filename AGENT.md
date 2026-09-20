# Instruksi Untuk AI Agent

Dokumen ini adalah panduan utama untuk AI agent yang bekerja di repository ini. Baca dokumen ini sebelum mengubah file apa pun.

## Tujuan

- Pahami konteks proyek sebelum membuat asumsi.
- Buat perubahan sekecil mungkin yang menyelesaikan kebutuhan pengguna.
- Ingat bahwa REQORD adalah aplikasi request/work order dengan import dan export XLSX.
- Prioritaskan alur status pekerjaan: planned, in progress, blocked, dan done.
- Pertahankan pengalaman flat minimal dengan palet hijau matcha tanpa mengorbankan keterbacaan, performa, atau aksesibilitas.
- Jangan menghapus atau menimpa perubahan pengguna tanpa izin.
- Dokumentasikan keputusan penting dan hasil pekerjaan di `MEMORY.md`.

## Alur Kerja

1. Baca `README.md`, `MEMORY.md`, dan `CHANGELOG.md`.
2. Periksa struktur repository dan file yang relevan.
3. Jelaskan rencana singkat sebelum perubahan yang besar.
4. Terapkan perubahan menggunakan pendekatan yang konsisten dengan proyek.
5. Jalankan test, lint, build, atau pemeriksaan lain yang tersedia.
6. Perbarui dokumentasi yang terdampak.
7. Tambahkan ringkasan pekerjaan ke `MEMORY.md` jika ada informasi yang berguna bagi agent berikutnya.

## Aturan Perubahan

- Tanyakan pengguna jika requirement bertentangan atau tidak cukup jelas.
- Hindari menambah dependency tanpa alasan yang jelas.
- Jangan memasukkan secret, token, password, atau data pribadi ke repository.
- Untuk fitur XLSX, selalu pertimbangkan data tanggal, angka, status, duplicate row, empty cell, invalid row, dan hasil import parsial.
- Untuk UI, jangan menggunakan transparansi atau blur pada teks penting sampai kontrasnya sulit dibaca.
- Jangan mengklaim test berhasil jika test belum dijalankan.
- Jika pemeriksaan gagal karena masalah yang sudah ada, catat penyebabnya dan pisahkan dari perubahan baru.

## Handoff Antar-Agent

Saat selesai bekerja, catat informasi berikut di `MEMORY.md`:

- Tanggal dan model/agent yang melakukan pekerjaan.
- Tujuan atau permintaan pengguna.
- File yang diubah dan alasan perubahan.
- Keputusan penting atau asumsi yang dibuat.
- Test atau validasi yang dijalankan beserta hasilnya.
- Pekerjaan lanjutan, blocker, atau hal yang masih belum pasti.

## Prioritas Sumber Kebenaran

Jika terjadi perbedaan informasi, gunakan urutan berikut:

1. Requirement terbaru dari pengguna.
2. Kode dan konfigurasi yang sedang aktif.
3. Test yang berhasil.
4. Dokumentasi proyek.
5. Catatan historis di `MEMORY.md` dan `CHANGELOG.md`.
