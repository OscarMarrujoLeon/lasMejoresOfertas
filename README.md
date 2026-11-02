# Sitio fragmentado y reforzado

## Estructura
- `index.html`: estructura y contenido.
- `assets/css/styles.css`: estilos.
- `assets/js/app.js`: API, render, filtros y modales.
- `_headers`: cabeceras para Netlify/Cloudflare Pages.
- `.htaccess`: cabeceras para Apache.
- `security/supabase-rls.sql`: RLS y permisos de solo lectura.

## Copia tus recursos actuales
Coloca `img.png`, `hero-doodles-small.jpg` y `hero-doodles-mobile.jpg` en `assets/images/`. Coloca los PNG de redes, `verificado.png`, `view.png`, `share.png` y `redirigir.png` en `assets/icons/`.

## Seguridad
Se externalizaron JavaScript y CSS, se agrego CSP, proteccion anti-clickjacking, nosniff, politica de referer, permisos restringidos y `noopener noreferrer`. La clave `sb_publishable_...` de Supabase es publica por diseno: la proteccion real esta en RLS y grants. Nunca pongas `service_role`, `sb_secret_...`, contrasenas o tokens administrativos en el frontend.

Prueba el SQL primero en desarrollo. Sirve la carpeta por HTTPS; para prueba local: `python3 -m http.server 8080`.
