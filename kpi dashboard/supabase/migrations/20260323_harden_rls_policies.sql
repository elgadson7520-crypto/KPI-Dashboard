-- =============================================
-- RLS Policy Hardening — March 23, 2026
-- =============================================
-- BEFORE: Every table had a single "allow_all" policy granting
--         ALL operations (SELECT/INSERT/UPDATE/DELETE) to public.
--         Since the anon key is visible in the HTML source, anyone
--         could read, overwrite, or delete all KPI data.
--
-- AFTER:  Granular policies per operation:
--   SELECT — open on all tables (dashboard needs to read)
--   INSERT — open on data tables + audit_log (PEFS imports, audit writes)
--   UPDATE — open on data tables only (not audit_log, not users)
--   DELETE — blocked on ALL tables (no one can delete via anon key)
-- =============================================

-- Step 1: Drop all existing allow_all policies
DROP POLICY IF EXISTS "allow_all" ON public.alert_blobs;
DROP POLICY IF EXISTS "allow_all" ON public.audit_log;
DROP POLICY IF EXISTS "allow_all" ON public.import_blobs;
DROP POLICY IF EXISTS "allow_all" ON public.kpi_blobs;
DROP POLICY IF EXISTS "allow_all" ON public.raw_blobs;
DROP POLICY IF EXISTS "allow_all" ON public.shift_blobs;
DROP POLICY IF EXISTS "allow_all" ON public.users;

-- Step 2: SELECT (read) — open for all tables
CREATE POLICY "anon_select" ON public.alert_blobs FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.audit_log FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.import_blobs FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.kpi_blobs FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.raw_blobs FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.shift_blobs FOR SELECT USING (true);
CREATE POLICY "anon_select" ON public.users FOR SELECT USING (true);

-- Step 3: INSERT — allowed on data tables + audit_log
CREATE POLICY "anon_insert" ON public.alert_blobs FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_insert" ON public.audit_log FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_insert" ON public.import_blobs FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_insert" ON public.kpi_blobs FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_insert" ON public.raw_blobs FOR INSERT WITH CHECK (true);
CREATE POLICY "anon_insert" ON public.shift_blobs FOR INSERT WITH CHECK (true);
-- users: NO INSERT (blocked)

-- Step 4: UPDATE — allowed on data tables only
CREATE POLICY "anon_update" ON public.alert_blobs FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_update" ON public.import_blobs FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_update" ON public.kpi_blobs FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_update" ON public.raw_blobs FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "anon_update" ON public.shift_blobs FOR UPDATE USING (true) WITH CHECK (true);
-- audit_log: NO UPDATE (audit logs are immutable)
-- users: NO UPDATE (blocked)

-- Step 5: DELETE — blocked on ALL tables
-- (No DELETE policies = no one can delete via anon key)
