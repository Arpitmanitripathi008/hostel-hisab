-- Hostel Hisab: Supabase setup
-- Run this entire script in Supabase Dashboard -> SQL Editor.

create table if not exists public.hostel_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.hostel_data enable row level security;

drop policy if exists "Users can read their own hostel data" on public.hostel_data;
drop policy if exists "Users can insert their own hostel data" on public.hostel_data;
drop policy if exists "Users can update their own hostel data" on public.hostel_data;
drop policy if exists "Users can delete their own hostel data" on public.hostel_data;

create policy "Users can read their own hostel data"
on public.hostel_data for select
using (auth.uid() = user_id);

create policy "Users can insert their own hostel data"
on public.hostel_data for insert
with check (auth.uid() = user_id);

create policy "Users can update their own hostel data"
on public.hostel_data for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

create policy "Users can delete their own hostel data"
on public.hostel_data for delete
using (auth.uid() = user_id);

create or replace function public.set_hostel_data_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists hostel_data_updated_at on public.hostel_data;
create trigger hostel_data_updated_at
before update on public.hostel_data
for each row execute function public.set_hostel_data_updated_at();

-- Optional profile information for future versions.
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
drop policy if exists "Users can read own profile" on public.profiles;
drop policy if exists "Users can insert own profile" on public.profiles;
drop policy if exists "Users can update own profile" on public.profiles;
create policy "Users can read own profile" on public.profiles for select using (auth.uid() = id);
create policy "Users can insert own profile" on public.profiles for insert with check (auth.uid() = id);
create policy "Users can update own profile" on public.profiles for update using (auth.uid() = id) with check (auth.uid() = id);

-- Verify with:
-- select * from public.hostel_data;
