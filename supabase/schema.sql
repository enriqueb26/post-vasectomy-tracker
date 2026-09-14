-- Run this in the Supabase SQL Editor before using the app.
create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  vasectomy_date date not null default date '2026-09-08',
  target_ejaculation_count integer not null default 30 check (target_ejaculation_count > 0),
  waiting_period_months integer not null default 3 check (waiting_period_months > 0),
  notes text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table public.events (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  occurred_at timestamptz not null default now(),
  note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index events_user_occurred_at_idx on public.events (user_id, occurred_at desc);

alter table public.profiles enable row level security;
alter table public.events enable row level security;
create policy "Users read own profile" on public.profiles for select using (auth.uid() = id);
create policy "Users update own profile" on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);
create policy "Users read own events" on public.events for select using (auth.uid() = user_id);
create policy "Users add own events" on public.events for insert with check (auth.uid() = user_id);
create policy "Users edit own events" on public.events for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Users delete own events" on public.events for delete using (auth.uid() = user_id);

create or replace function public.handle_new_user() returns trigger language plpgsql security definer set search_path = public as $$
begin insert into public.profiles (id) values (new.id); return new; end; $$;
create trigger on_auth_user_created after insert on auth.users for each row execute procedure public.handle_new_user();

create or replace function public.set_updated_at() returns trigger language plpgsql as $$ begin new.updated_at = now(); return new; end; $$;
create trigger profiles_updated_at before update on public.profiles for each row execute procedure public.set_updated_at();
create trigger events_updated_at before update on public.events for each row execute procedure public.set_updated_at();
