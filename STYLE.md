# Style Guide

## Umum

- Gunakan bahasa yang jelas, langsung, dan tidak ambigu.
- Utamakan solusi sederhana dibanding abstraksi yang belum diperlukan.
- Gunakan nama file, fungsi, dan variabel yang deskriptif.
- Hindari duplikasi jika pengurangan duplikasi tidak membuat kode lebih sulit dipahami.
- Dokumentasikan alasan di balik keputusan yang tidak terlihat dari kode, bukan hal yang sudah jelas dari implementasi.

## Markdown

- Gunakan satu judul utama (`#`) per file.
- Gunakan heading berurutan (`##`, lalu `###`) tanpa melompati tingkat secara tidak perlu.
- Gunakan bullet untuk daftar dan fenced code block dengan label bahasa untuk contoh kode.
- Tulis link relatif ke file di repository.
- Gunakan bahasa Indonesia untuk dokumentasi proyek, kecuali istilah teknis atau nama API lebih tepat dalam bahasa Inggris.

## Dokumentasi Perubahan

- Tulis perubahan secara faktual, bukan promosi.
- Pisahkan perubahan, validasi, dan pekerjaan yang belum selesai.
- Sertakan path file ketika menjelaskan lokasi perubahan.
- Jangan menulis hasil test yang tidak benar-benar dijalankan.

## Kode

- Ikuti formatter, linter, dan konvensi framework yang sudah digunakan jika nanti tersedia.
- Jangan melakukan refactor besar sebagai bagian dari perubahan kecil tanpa alasan.
- Tangani error pada batas sistem dan pertahankan pesan error yang berguna.

## Produk Dan UX REQORD

- Gunakan istilah yang konsisten: workspace, project, pipeline, item, status, requestor, target done, dan custom field.
- Status pekerjaan harus terlihat jelas tanpa bergantung pada warna saja; gunakan label, ikon, atau teks tambahan.
- Aksi utama seperti membuat item, mengubah status, import, dan export harus mudah ditemukan.
- Destructive action harus meminta konfirmasi dan menjelaskan dampaknya.
- Import XLSX harus selalu memiliki preview, pemetaan kolom, validasi, dan ringkasan hasil.
- Export XLSX harus menjelaskan apakah yang diekspor adalah seluruh data atau hanya filter/view aktif.

## Visual Glassmorphism

- Gunakan blur dan transparansi sebagai lapisan pendukung, bukan fondasi yang membuat konten sulit dibaca.
- Gunakan primary color hijau matcha yang tenang untuk aksi utama, status aktif, dan identitas REQORD.
- Pertahankan layout minimal dengan whitespace yang cukup dan jumlah aksen visual yang terbatas.
- Gunakan palet hampir monokrom; jangan mencampur banyak warna aksen dalam satu layar.
- Gunakan flat style dengan permukaan solid, border sederhana, dan shadow sangat ringan.
- Gunakan garis setipis dan sesamar mungkin; separator tabel cukup `1px` dengan kontras rendah.
- Hindari border tebal, outline dekoratif, dan panel yang terlihat berat.
- Pertahankan kontras teks, focus state keyboard, hover state, dan disabled state.
- Gunakan depth melalui kombinasi border halus, shadow lembut, gradient, dan spacing; jangan menumpuk efek secara berlebihan.
- Hindari tampilan dashboard generik: setiap layar harus memiliki hierarchy, konteks, dan aksi utama yang jelas.
- Komponen harus tetap usable ketika blur dimatikan, pada layar kecil, atau dalam reduced-motion mode.
