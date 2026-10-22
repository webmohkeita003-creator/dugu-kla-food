-- DUGU KLA FOOD : exécute tout ce fichier dans Supabase > SQL Editor.
create extension if not exists pgcrypto;
create table if not exists public.dishes(id uuid primary key default gen_random_uuid(),name text not null,category text not null,description text default '',price integer not null check(price>=0),image_url text default '',available boolean not null default true,created_at timestamptz not null default now());
create table if not exists public.orders(id uuid primary key default gen_random_uuid(),customer_name text not null,phone text not null,address text not null,delivery_type text not null default 'livraison',total integer not null default 0,status text not null default 'nouvelle',created_at timestamptz not null default now());
create table if not exists public.order_items(id uuid primary key default gen_random_uuid(),order_id uuid not null references public.orders(id) on delete cascade,dish_id uuid not null references public.dishes(id),quantity integer not null check(quantity>0),unit_price integer not null check(unit_price>=0));
alter table public.dishes enable row level security;
alter table public.orders enable row level security;
alter table public.order_items enable row level security;
create policy "public_read_dishes" on public.dishes for select using(true);
create policy "public_insert_orders" on public.orders for insert with check(true);
create policy "public_insert_order_items" on public.order_items for insert with check(true);
create policy "auth_manage_dishes" on public.dishes for all to authenticated using(true) with check(true);
create policy "auth_manage_orders" on public.orders for all to authenticated using(true) with check(true);
create policy "auth_manage_order_items" on public.order_items for all to authenticated using(true) with check(true);
insert into public.dishes(name,category,description,price) values
('Tô','Plats','Tô de mil accompagné d’une sauce généreuse.',2500),
('Riz au gras','Plats','Riz parfumé et généreux.',3000),
('Maafé','Plats','Sauce à l’arachide, viande et légumes.',3500),
('Zamè','Plats','Spécialité malienne savoureuse.',3000),
('Poisson braisé','Poissons','Poisson grillé et accompagnement.',4500),
('Poulet rôti','Viandes','Poulet rôti assaisonné maison.',4500);