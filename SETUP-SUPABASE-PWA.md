# Hostel Hisab V5 — Supabase + Login + PWA

## 1. Create the Supabase project

1. Open the Supabase dashboard and create a new project.
2. In the project, open **SQL Editor**.
3. Open `supabase-schema.sql` from this project and run the complete SQL.
4. In **Project Settings → API**, copy the project URL and the publishable/anon key.
5. Copy `.env.example` to `.env.local` and replace the two placeholders.

Example:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-publishable-or-anon-key
```

Do not put a `service_role` key in this file or in browser code.

## 2. Authentication

The app uses Supabase email/password authentication.

In Supabase, open **Authentication → Providers** and make sure Email is enabled.

If email confirmation is enabled, a new user must confirm the email before logging in. Supabase documents this behavior in its JavaScript `signUp` reference.

For local development, use:

`http://localhost:3000`

as the local site/redirect URL where Supabase asks for it.

## 3. Run the app

From the folder containing `package.json`:

```bash
npm install
npm run dev
```

Open:

`http://localhost:3000`

## 4. Existing V4 data migration

The first account that signs in on a browser can migrate the existing `hostel-hisab-v2` local-browser data into its Supabase row if that cloud row does not exist yet.

After migration, the app keeps a local cache for fast/offline viewing and synchronizes changes to Supabase when connected.

## 5. PWA installation

The project contains:

- `public/manifest.webmanifest`
- `public/sw.js`
- `public/icon-192.png`
- `public/icon-512.png`

On supported browsers, an **Install app** button appears when the browser exposes the install prompt. You can also use the browser's Install/Add to Home Screen menu.

PWA installation requires a secure origin in normal deployment. `localhost` is treated as secure for development.

## 6. Recommended production deployment

Deploy the Next.js project to a Node-compatible host such as Vercel. Add the same Supabase environment variables in the hosting provider's project settings.

After deployment, add the production URL to Supabase Authentication URL/redirect settings.

## Data model

This first cloud version intentionally keeps the existing app's `Data` object inside one row per user (`hostel_data.data` JSONB). This makes migration safe and keeps the current UI/features intact.

The table is protected by Row Level Security so a signed-in user can only read/write their own `hostel_data` row.

A later version can normalize meals, milk, payments, and trackers into separate Postgres tables if we need advanced multi-device queries, sharing, or analytics.
