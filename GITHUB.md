# Subir KINGS LEAGUE IMEX a GitHub (y publicarlo en línea gratis)

No tengo forma de conectarme a tu cuenta de GitHub desde aquí, así que estos son
los pasos para hacerlo tú mismo. Son copiar/pegar, toma 5 minutos.

## 1. Crear el repositorio
1. Entra a https://github.com/new
2. Nombre del repositorio: `kings-league-imex` (o el que quieras)
3. Déjalo en **Public** (para poder usar GitHub Pages gratis)
4. NO marques "Add a README" (ya tenemos uno)
5. Clic en **Create repository**

## 2. Subir el código
Abre una terminal (o PowerShell) **dentro de esta carpeta** y ejecuta:

```bash
git init
git add .
git commit -m "Primera versión de Kings League IMEX"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/kings-league-imex.git
git push -u origin main
```

Cambia `TU-USUARIO` por tu usuario de GitHub.

## 3. Publicarlo como página web (GitHub Pages)
1. En tu repositorio en GitHub, ve a **Settings → Pages**
2. En "Branch" elige `main` y la carpeta `/ (root)`
3. Guarda. En 1-2 minutos tu sitio estará en:
   `https://TU-USUARIO.github.io/kings-league-imex/`

Esa URL ya la puedes compartir con tus compañeros — funciona como página
normal (a diferencia de antes, no necesitas correr `serve.ps1`).

## Importante: los datos NO se comparten entre personas
Este proyecto guarda todo en el `localStorage` del navegador de cada quien.
Eso significa que:
- Lo que el organizador registre (resultados, mercado, etc.) **solo lo ve él**,
  en su propio navegador/computadora.
- Un presidente de equipo que entre desde su celular **no verá** los cambios
  que hizo el organizador, y viceversa.

Para que todos vean lo mismo en tiempo real necesitarías conectarlo a una base
de datos real (Supabase o Firebase — el código ya está preparado para eso en
`js/state/store.js`, ver la sección 5 del README), o usar la otra versión que
ya tienes funcionando en Claude, que sí sincroniza a todos con un solo link.
