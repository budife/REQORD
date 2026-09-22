const { execFileSync } = require('node:child_process');
const fs = require('node:fs');

const output = process.argv[2] || 'recent-changes.json';
const raw = execFileSync('git', ['log', '--format=%h|%ad|%s', '--date=format:%Y-%m-%d', '-100'], { encoding: 'utf8' });
const commits = raw.trim().split(/\r?\n/).filter(Boolean).map(line => {
  const [hash, date, ...message] = line.split('|');
  return [hash, date, message.join('|')];
});
fs.writeFileSync(output, `${JSON.stringify(commits, null, 2)}\n`);
console.log(`Wrote ${commits.length} commits to ${output}`);
