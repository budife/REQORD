# REQORD Roadmap

Roadmap ini adalah urutan kerja awal. Detail teknis dapat berubah setelah stack dan model data dipilih.

## Phase 0: Foundation

- Pilih stack frontend, backend, database, dan library XLSX.
- Tetapkan model data untuk workspace, project, pipeline, item, user, view, dan activity.
- Buat design tokens untuk warna, spacing, radius, shadow, blur, typography, dan light/dark mode.
- Siapkan struktur aplikasi, error handling, validation, dan test strategy.

## Phase 1: MVP Work Order Spreadsheet

- Tambah title pekerjaan dari email atau sumber lain.
- Work order dengan title, requestor, status, priority, tanggal request, dan target done.
- Tiga tabel: Request list, Ongoing requests, dan Done requests.
- Edit status dan priority langsung dari tabel.
- Search work order sederhana.
- Autosave lokal.

## Phase 2: XLSX Data Flow

- Export seluruh work order ke `.xlsx`.
- Import `.xlsx` dengan kolom Title, Status, Requestor, RequestDate, TargetDone, dan Priority.
- Validasi baris dan laporan import.
- Template workbook sederhana.

## Phase 3: Premium Collaboration

- Comments, mentions, checklist, attachment, dan notifications.
- Role dan permissions.
- Activity timeline lengkap.
- Dashboard progress, workload, overdue, dan blocked items.
- Calendar dan timeline view.
- Responsive mobile experience dan keyboard command menu.

## Phase 4: Scale And Automation

- Recurring items dan workflow automation.
- Dependencies dan critical path.
- Integrasi calendar, webhook, dan API.
- Import/export background job untuk workbook besar.
- Audit log, backup, version history, dan observability.
