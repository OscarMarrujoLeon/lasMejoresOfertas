-- Revisa y prueba antes de ejecutar en produccion.
begin;
alter table public.pendientes enable row level security;
alter table public.cupones enable row level security;
alter table public.cupones_bancarios enable row level security;
revoke all on table public.pendientes from anon, authenticated;
revoke all on table public.cupones from anon, authenticated;
revoke all on table public.cupones_bancarios from anon, authenticated;
grant select on table public.pendientes to anon, authenticated;
grant select on table public.cupones to anon, authenticated;
grant select on table public.cupones_bancarios to anon, authenticated;
drop policy if exists "sitio_publico_lee_ofertas_publicadas" on public.pendientes;
create policy "sitio_publico_lee_ofertas_publicadas" on public.pendientes for select to anon, authenticated using (publicado is true);
drop policy if exists "sitio_publico_lee_cupones" on public.cupones;
create policy "sitio_publico_lee_cupones" on public.cupones for select to anon, authenticated using (true);
drop policy if exists "sitio_publico_lee_promos_bancarias" on public.cupones_bancarios;
create policy "sitio_publico_lee_promos_bancarias" on public.cupones_bancarios for select to anon, authenticated using (true);
commit;
