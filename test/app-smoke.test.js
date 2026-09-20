const assert = require('node:assert/strict');
const fs = require('node:fs');

const source = fs.readFileSync('app.js', 'utf8');
const markup = fs.readFileSync('index.html', 'utf8');

assert.match(source, /function normalizeStatus/);
assert.match(source, /function normalizePriority/);
assert.match(source, /function isDailyDone/);
assert.match(source, /function removeDefaultSheets/);
assert.match(source, /showSaveFilePicker/);
assert.match(source, /requestPermission/);
assert.match(source, /loadMoreDoneButton/);
assert.match(source, /priorityFilter/);
assert.match(source, /sortFilter/);
assert.match(markup, /daily-progress/);
assert.match(source, /hasUnsavedChanges/);
assert.match(source, /Perubahan belum disimpan akan diganti/);
assert.match(source, /downloadWorkbook/);
assert.match(source, /removeDefaultSheets/);
assert.match(source, /loadActivitiesFromFile/);
assert.match(markup, /activeFileName/);
assert.match(markup, /saveState/);

console.log('REQORD smoke checks passed');
