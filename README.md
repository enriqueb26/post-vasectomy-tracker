# Post-Vasectomy Tracker

A private, mobile-first PWA for recording post-vasectomy ejaculation events and tracking when a follow-up semen analysis is available. The default plan starts September 8, 2026, requires 30 events, and has a three-calendar-month waiting period (eligible December 8, 2026).

## Local setup

1. Create a [Supabase](https://supabase.com) project.
2. In its **SQL Editor**, run [`supabase/schema.sql`](./supabase/schema.sql). It creates the private tables, indexes, user-creation trigger, and Row Level Security policies.
3. In **Authentication → Providers**, enable Email. For a smoother local test flow, disable email confirmation temporarily; keep it enabled for production.
4. Copy `.env.example` to `.env.local`, then add the project URL and **anon** key from **Project Settings → API**. Never use the service-role key in the browser.
5. Install and start the app:

   ```bash
   npm install
   npm run dev
   ```

Open `http://localhost:3000`. The app uses an automatic anonymous session, so no email or password is needed. In Supabase, enable **Authentication → Settings → Allow anonymous sign-ins** before using it. The database trigger automatically gives each new session the default personal settings.

## Supabase privacy model

Every profile is keyed to `auth.users.id`; every event stores `user_id`. Row Level Security is enabled on both tables and policies only permit a signed-in user to read, create, update, or delete their own records. The browser connects only with the public anon key, which is safe with these RLS policies in place. Anonymous sessions are private to that browser/device; clearing browser data or using another device starts a new private tracker.

## Deploy to Vercel

1. Push this `post-vasectomy-tracker` folder to a Git repository, or import it from Vercel with this folder as the project root.
2. In Vercel **Settings → Environment Variables**, add `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` for Production, Preview, and Development.
3. Deploy. Vercel detects Next.js automatically; the build command is `npm run build`.
4. In Supabase **Authentication → URL Configuration**, set the Site URL to your deployed `https://…vercel.app` address and add any preview/local URLs to Redirect URLs as needed.

## Install on iPhone

In Safari, open the deployed app, tap Share, then **Add to Home Screen**. The web manifest, standalone display mode, dark theme, service worker, generated Apple touch icon, and Apple web-app metadata make it launch like a focused app. iOS uses the theme color while launching; device-specific branded launch screens can be added later with `apple-touch-startup-image` artwork if desired.

## Important note

This is a personal tracker, not medical advice. Confirm the appropriate test timing and interpretation with your clinician.
