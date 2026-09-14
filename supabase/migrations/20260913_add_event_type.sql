-- Run this once in the Supabase SQL Editor for an existing installation.
alter table public.events
  add column if not exists event_type text not null default 'masturbation'
  check (event_type in ('masturbation', 'regular_sex', 'oral_sex', 'partner_manual'));
