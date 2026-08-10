# Baskara

Tienda de segunda mano (ropa, tecnología, muebles, bebés, hogar, accesorios) con **panel de administración** para cargar productos con fotos, sin tocar código.

## Archivos
- **`index.html`** — la tienda pública (lee los productos de Supabase).
- **`admin.html`** — el panel: entrás con email/contraseña y agregás/editás/borrás productos y subís fotos.
- **`config.js`** — donde pegás los datos de tu Supabase y tu número de WhatsApp.
- **`supabase-setup.sql`** — se corre una sola vez en Supabase para crear la base.
- `server.js` — solo para probar localmente.

## Puesta en marcha (una sola vez)

1. **Crear proyecto en Supabase** → https://supabase.com (gratis). Anotá el nombre.
2. **Crear la base**: en Supabase → *SQL Editor* → *New query* → pegá TODO el contenido de `supabase-setup.sql` → *Run*.
3. **Crear tu usuario admin**: Supabase → *Authentication* → *Users* → *Add user* → poné tu email y una contraseña. (Con eso entrás a `admin.html`.)
4. **Conectar**: en Supabase → *Settings ⚙ → API*, copiá **Project URL** y la clave **anon public**. Pegalas en `config.js`. Poné también tu número de WhatsApp ahí.

## Uso diario
- Entrá a `tu-sitio/admin.html`, logueate y cargá tus cosas. Aparecen solas en la tienda.
- Para marcar algo vendido: editás el producto y tildás "Marcar como vendido".
