# Security Operations Summit landing page

A responsive static event page with locally bundled images and Inter fonts, regional agendas, expandable sessions and FAQs, speaker biographies, and Supabase registration storage.

## Run locally

Open `index.html` in a modern browser. Keep the `assets/` directory beside it. No build or dependency installation is required. An internet connection is required to submit registrations.

The same files can be served by any static website host.

## Registration database

- Supabase project: **secops-summit** in **SanikaG0208's Org**
- Project reference: `dvsmmksqavdumwbisqpj`
- Table: `public.secops_summit_registrations`
- [Open the Supabase dashboard](https://supabase.com/dashboard/project/dvsmmksqavdumwbisqpj/editor)

The page contains a Supabase **publishable** key, intended for browser use. It does not contain a service-role key or database password. Row Level Security permits public inserts only; visitors cannot read, update, or delete registrations. SQL constraints validate stored fields.

`supabase/schema.sql` documents the database setup already applied to this project. Do not run it again against the existing table. Adjust the project URL and publishable key in `index.html` when using another database.

The form validates required fields, business email, and phone format; displays a submitting state; and confirms success only after Supabase accepts the registration. Submission IDs protect retries from duplicate records. One labeled test registration was submitted through the page and verified in the database on October 22, 2026.

## Files

- `index.html`: HTML, styles, and browser JavaScript
- `assets/`: image, icon, and font files
- `supabase/schema.sql`: database table, constraints, and access policy

Fortinet branding and event content originate from the supplied reference website and assets.
