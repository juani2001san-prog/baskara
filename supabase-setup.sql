-- ============================================================
--  BASKARA · Configuración de base de datos en Supabase
--  Cómo usar: Supabase → tu proyecto → SQL Editor → New query →
--  pegá TODO esto → Run. (Se puede correr más de una vez sin romper nada.)
-- ============================================================

-- 1) Tabla de productos
create table if not exists public.productos (
  id         bigint generated always as identity primary key,
  created_at timestamptz default now(),
  title      text    not null,
  cat        text    not null default 'ropa',
  detail     text    default '',
  price      numeric not null default 0,
  img        text    default '',
  sold       boolean default false
);

alter table public.productos enable row level security;

-- Cualquiera puede VER los productos (la tienda es pública)
drop policy if exists "leer productos" on public.productos;
create policy "leer productos"
  on public.productos for select
  to anon, authenticated using (true);

-- Solo vos, logueada, podés AGREGAR / EDITAR / BORRAR
drop policy if exists "admin insert productos" on public.productos;
create policy "admin insert productos"
  on public.productos for insert
  to authenticated with check (true);

drop policy if exists "admin update productos" on public.productos;
create policy "admin update productos"
  on public.productos for update
  to authenticated using (true) with check (true);

drop policy if exists "admin delete productos" on public.productos;
create policy "admin delete productos"
  on public.productos for delete
  to authenticated using (true);

-- 2) Carpeta de imágenes (bucket público)
insert into storage.buckets (id, name, public)
values ('productos', 'productos', true)
on conflict (id) do nothing;

-- Cualquiera puede VER las fotos
drop policy if exists "ver imagenes" on storage.objects;
create policy "ver imagenes"
  on storage.objects for select
  to anon, authenticated using (bucket_id = 'productos');

-- Solo vos, logueada, podés SUBIR / BORRAR fotos
drop policy if exists "admin sube imagenes" on storage.objects;
create policy "admin sube imagenes"
  on storage.objects for insert
  to authenticated with check (bucket_id = 'productos');

drop policy if exists "admin borra imagenes" on storage.objects;
create policy "admin borra imagenes"
  on storage.objects for delete
  to authenticated using (bucket_id = 'productos');

-- ============================================================
--  LISTO. Después creá tu usuario admin en:
--  Authentication → Users → Add user  (email + contraseña)
--  Con ese email/contraseña entrás a admin.html
-- ============================================================
