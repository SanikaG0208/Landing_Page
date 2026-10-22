create table public.secops_summit_registrations (
 id uuid primary key default gen_random_uuid(),
 submission_id uuid not null unique,
 created_at timestamptz not null default now(),
 first_name text not null check (char_length(btrim(first_name)) between 1 and 100),
 last_name text not null check (char_length(btrim(last_name)) between 1 and 100),
 company text not null check (char_length(btrim(company)) between 1 and 200),
 job_title text not null check (char_length(btrim(job_title)) between 1 and 200),
 email text not null check (char_length(email) <= 254 and email ~ '^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$'),
 phone text not null check (char_length(phone) <= 40 and phone ~ '^\+?[0-9 ().-]+$' and char_length(regexp_replace(phone, '[^0-9]', '', 'g')) between 7 and 15),
 country text not null check (char_length(btrim(country)) between 1 and 100),
 event_region text not null check (event_region in ('AMER','INDIA','EMEA','APAC')),
 relationship text not null check (relationship in ('End User - Existing Customer','Partner/Distributor','End User - Prospect/Potential Customer','Fortinet Employee','Other')),
 active_project text not null check (active_project in ('Yes','No','Browsing')),
 marketing_consent boolean not null default false,
 event_slug text not null default 'secops-summit-2026' check (event_slug = 'secops-summit-2026')
);
alter table public.secops_summit_registrations enable row level security;
revoke all on table public.secops_summit_registrations from anon, authenticated;
grant insert (submission_id,first_name,last_name,company,job_title,email,phone,country,event_region,relationship,active_project,marketing_consent) on public.secops_summit_registrations to anon;
create policy "Submit SecOps Summit registration" on public.secops_summit_registrations for insert to anon with check (event_slug = 'secops-summit-2026');
comment on table public.secops_summit_registrations is 'SecOps Summit website registrations. Public clients can insert only; no public read, update, or delete access.';

