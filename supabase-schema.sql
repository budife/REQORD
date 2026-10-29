-- reqord Supabase Schema
-- Jalankan di Supabase SQL Editor

-- 1. Tabel work_orders
CREATE TABLE IF NOT EXISTS work_orders (
  id TEXT PRIMARY KEY DEFAULT gen_random_uuid()::text,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  title TEXT NOT NULL,
  requestor TEXT NOT NULL,
  month TEXT,
  priority TEXT DEFAULT 'normal' CHECK (priority IN ('high', 'normal', 'low')),
  status TEXT DEFAULT 'list' CHECK (status IN ('list', 'ongoing', 'revision', 'preview', 'done')),
  type TEXT DEFAULT 'project' CHECK (type IN ('project', 'daily')),
  date TIMESTAMPTZ,
  request_date TIMESTAMPTZ,
  done BOOLEAN DEFAULT false,
  completed_at TIMESTAMPTZ,
  daily_done_date TEXT,
  subitems JSONB DEFAULT '[]'::jsonb,
  note TEXT,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 2. Index untuk query cepat
CREATE INDEX IF NOT EXISTS idx_work_orders_user_id ON work_orders(user_id);
CREATE INDEX IF NOT EXISTS idx_work_orders_status ON work_orders(status);
CREATE INDEX IF NOT EXISTS idx_work_orders_month ON work_orders(month);

-- 3. Auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER work_orders_updated_at
  BEFORE UPDATE ON work_orders
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at();

-- 4. RLS (Row Level Security)
ALTER TABLE work_orders ENABLE ROW LEVEL SECURITY;

-- Policy: user hanya bisa CRUD data miliknya
CREATE POLICY "Users can view own work_orders"
  ON work_orders FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own work_orders"
  ON work_orders FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own work_orders"
  ON work_orders FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own work_orders"
  ON work_orders FOR DELETE
  USING (auth.uid() = user_id);

-- 5. Enable Realtime (optional)
ALTER PUBLICATION supabase_realtime ADD TABLE work_orders;
EOF
echo "SQL file created"