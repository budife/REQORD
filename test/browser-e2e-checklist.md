# REQORD Browser E2E Checklist

Run these checks in Chrome or Edge with a local OneDrive-synced `.xlsx` file.

1. Open `index.html` over a local web server.
2. Click `Load` and select the original workbook.
3. Verify the active filename changes from `Draft lokal` to the workbook name.
4. Edit a work order and verify the filename/status turns red: `Unsaved changes`.
5. Click `Save`, grant `readwrite` permission, and verify the filename/status returns to green/saved.
6. Open the workbook in Excel and verify the same file still has its existing OneDrive share.
7. Verify `Activity` contains the save event.
8. Verify an empty valid REQORD workbook loads with zero rows and no error.
9. Verify a workbook without REQORD sheets shows a validation error.
10. Resize viewport to 320px, 768px, 1024px, and 1440px; verify no horizontal list scrollbar and row Actions stay attached to their row.

## Current environment limitation

This workspace does not have Chrome/Edge installed or configured for automation, so these browser checks cannot be executed here. Node syntax, utility tests, and smoke tests are run in CI/local instead.
