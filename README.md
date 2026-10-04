# 👑 KINGS LEAGUE IMEX — PLATAFORMA WEB OFICIAL DEL TORNEO

Plataforma web completa, funcional y de estética premium para el torneo escolar de fútbol 7 inspirado en el concepto, dinámicas y experiencia competitiva de la Kings League.

---

## ⚡ 1. Inicio Rápido

### Opción A (Recomendada en Windows):
Simplemente haz **doble clic en el archivo:**
```
iniciar-servidor.bat
```
Esto levantará la plataforma en **`http://localhost:8081`** y abrirá automáticamente tu navegador preferido.

Si Node.js está instalado, el mismo archivo inicia el backend central (`server.js`), que guarda el estado compartido en `data/state.json` y autentica las sesiones. Para el lanzamiento real, instala Node.js LTS en el equipo que actuará como servidor y comparte la URL de ese equipo en la red local.

### Opción B (PowerShell manual):
Abre una terminal PowerShell en esta carpeta y ejecuta:
```powershell
powershell -ExecutionPolicy Bypass -File .\serve.ps1
```

### Opción C (Cualquier servidor estático o extensión):
- Con **VS Code Live Server**: Clic derecho en `index.html` $\rightarrow$ *"Open with Live Server"*.
- Con **Python** (si está instalado): `python -m http.server 8080`
- Con **Node / npx** (si está instalado): `npx serve`

---

## 🚀 2. Módulos y Características Implementadas

### A. Identidad & Estética Visual
- **Paleta Oficial**: Fondo negro profundo con texturas deportivas metálicas, detalles en **amarillo Kings League (`#FFE600`)**, **verde lima eléctrico (`#00FF66`)** para economía, botones principales y estados activos, y **rojo intenso (`#FF2E4D`)** para alertas y clausulazos.
- **Tipografías Deportivas**: Google Fonts (*Space Grotesk*, *Bebas Neue*, *Inter*). Títulos imponentes en mayúsculas y métricas con tipografía condensada.
- **Componente "GENERATION LOGO"**: Espacio prominente en el header que permite cargar y previsualizar el escudo o logo oficial de la generación escolar (guarda en memoria local o URL).

### B. Sistema Económico & Reglas de Torneo
- **Cartera de 200 Millones**: Cada club dispone inicialmente de 200M distribuidos entre sus jugadores en el draft.
- **Premios por Partido**:
  - Victoria: **+50M** y **3 Puntos**
  - Empate: **+10M** y **1 Punto**
  - Derrota: **+0M** y **0 Puntos**
- **Cálculo Automático**: Al registrar un partido desde el panel del organizador, el sistema actualiza de forma automática e instantánea la clasificación, los saldos de cada equipo, el libro mayor financiero y la tabla de goleadores.

### C. Mercado de Fichajes & Clausulazos
- **Apertura y Cierre Semanal**: Cronómetro con cuenta regresiva en vivo (*El mercado abre/cierra en: HH:MM:SS*).
- **Mecanismo de Clausulazo**:
  - Cada club tiene derecho a **1 solo Clausulazo** por mercado.
  - El pago es directo e incondicional (no requiere autorización del vendedor).
  - Al ejecutarse, deduce el saldo, traspasa al futbolista y marca el clausulazo del equipo como *Utilizado*.
  - Modal formal de advertencia y confirmación.
- **⭐ Jugadores Insignia Blindados**: Inmunes a clausulazos y transferencias mientras su equipo continúe vivo en el torneo.
- **Negociación Ordinaria**: Propuestas bilaterales por dinero o intercambio (trueque de futbolistas).

### D. Dinámicas Especiales (Cartas & Dados)
- **Baraja de Cartas Secretas**: Gol Doble (2 min), Penalti Presidente, Sanción 2 min, Comodín Total, Robar Carta y Jugador Estrella x2.
- **Dados dinámicos**: Modalidades 1vs1 con portero, 2vs2 sin porteros, 3vs3 y 4vs4 para los minutos finales del primer tiempo.

### E. Fase Final (Bracket) & Subasta
- **Cuadro Eliminatorio**: Fase de Grupos (A y B) $\rightarrow$ Semifinales cruzadas (1° A vs 2° B / 1° B vs 2° A) $\rightarrow$ Gran Final.
- **Subasta Final**: Los futbolistas de equipos eliminados pierden el blindaje y entran al draft de refuerzos para que los dos finalistas pujen por ellos antes de disputar el campeonato.

### F. Control de Acceso y Roles
Puedes alternar entre los siguientes perfiles con 1 clic desde el header:
1. **Visitante**: Consulta general de partidos, resultados, tabla, goleadores, mercado y noticias.
2. **Presidente de Club ("Mi Equipo")**: Dashboard privado tipo manager deportivo (saldo, valor de plantilla, clausulazo disponible/usado, administración de plantilla y ofertas entrantes).
3. **Jugador ("Mi Perfil")**: Tarjeta gigante de colección con estadísticas individuales, valor de cláusula y estado contractual.
4. **Organizador ("Admin")**: Master control para registrar actas arbitrales, editar equipos, crear jugadores, abrir/cerrar mercado, aplicar sanciones financieras y respaldar la base de datos.

---

## 📂 3. Estructura del Código

```
kings-league-imex/
├── index.html                  # Shell SPA principal
├── package.json                # Arranque del backend Node
├── server.js                   # API, sesiones y persistencia central
├── data/state.json             # Estado del torneo (generado localmente)
├── serve.ps1                   # Servidor web local nativo en PowerShell
├── iniciar-servidor.bat        # Acceso directo para Windows
├── README.md                   # Documentación oficial
├── css/
│   ├── variables.css           # Tokens de diseño, colores, fuentes y sombras
│   ├── layout.css              # Header, sidebar desktop, bottom nav móvil
│   ├── components.css          # Botones cibernéticos, modales, toasts, countdowns
│   ├── cards.css               # Cards deportivas coleccionables con esquinas cortadas
│   ├── views.css               # Estilos particulares de cada sección
│   └── responsive.css          # Reglas para móvil y tablet
└── js/
    ├── app.js                  # Enrutador principal y controlador de vistas
    ├── data/
    │   └── defaultData.js      # Datos iniciales (8 equipos, 56 jugadores, partidos)
    ├── state/
    │   └── store.js            # Estado reactivo central con LocalStorage
    ├── components/
    │   ├── header.js           # Barra superior y selector de roles
    │   ├── sidebar.js          # Navegación lateral desktop
    │   ├── bottomNav.js        # Menú inferior móvil
    │   ├── modal.js            # Sistema de ventanas modales
    │   ├── toast.js            # Notificaciones toast flotantes
    │   └── countdown.js        # Cronómetros en tiempo real
    └── views/
        ├── homeView.js         # Portada y hero de la competición
        ├── matchesView.js      # Partidos, jornadas y actas
        ├── standingsView.js    # Tabla de clasificación oficial
        ├── teamsView.js        # Directorio y fichas de los 8 clubes
        ├── playersView.js      # Catálogo de cartas coleccionables
        ├── scorersView.js      # Podio y tabla de goleadores
        ├── marketView.js       # Mercado y módulo de clausulazos
        ├── financeView.js      # Finanzas, carteras y libro mayor
        ├── rulesView.js        # Cartas secretas, dados y reglamento
        ├── announcementsView.js# Noticias y comunicados oficiales
        ├── bracketView.js      # Árbol de eliminatorias
        ├── auctionView.js      # Subasta final de refuerzos
        ├── presidentView.js    # Dashboard privado del Presidente
        ├── playerProfileView.js# Perfil del Jugador
        └── adminView.js        # Panel maestro del Organizador
```

---

## 🔄 4. Cómo Sustituir y Personalizar los Datos

Todos los datos están centralizados de manera modular:
1. **Directamente desde la interfaz**: Entra con el rol de **Organizador (`#admin`)** para editar equipos, jugadores, crear nuevos futbolistas, registrar partidos o publicar anuncios. Los cambios se guardan al instante en `localStorage`.
2. **Desde el archivo de datos base**: Edita [`js/data/defaultData.js`](file:///C:/Users/ifg31/.gemini/antigravity/scratch/kings-league-imex/js/data/defaultData.js) para alterar los nombres, escudos, dorsales, presidentes y valores por defecto del torneo antes de inicializar el servidor.
3. **Respaldo y Restauración**: En el panel de Organizador $\rightarrow$ pestaña *DATOS / RESET*, puedes exportar una copia completa de seguridad en formato `.json` o restaurar los datos de demostración en un clic.

---

## 🔌 5. Backend central incluido

El proyecto incluye un servidor Node sin dependencias externas:

```powershell
npm.cmd start
```

### Configurar usuarios y contraseñas

Antes del primer `npm.cmd start`, puedes definir tus propias contraseñas en PowerShell. Los nombres de usuario ya están creados para el organizador y los ocho presidentes:

```powershell
$env:IMEX_PASSWORD_ORGANIZADOR = "UnaClaveLargaYUnica"
$env:IMEX_PASSWORD_CUERVOS_PRESI = "ClaveCuervos"
$env:IMEX_PASSWORD_TITANES_PRESI = "ClaveTitanes"
$env:IMEX_PASSWORD_RAYO_PRESI = "ClaveRayo"
$env:IMEX_PASSWORD_FURIA_PRESI = "ClaveFuria"
$env:IMEX_PASSWORD_GALACTICOS_PRESI = "ClaveGalacticos"
$env:IMEX_PASSWORD_VIKINGOS_PRESI = "ClaveVikingos"
$env:IMEX_PASSWORD_DRAGONES_PRESI = "ClaveDragones"
$env:IMEX_PASSWORD_HALCONES_PRESI = "ClaveHalcones"
npm.cmd start
```

Las contraseñas solo se leen al crear `data/state.json`. Si el servidor ya se inició y necesitas cambiarlas, detén el servidor, haz una copia de `data/state.json`, elimina ese archivo, vuelve a definir las variables y ejecuta `npm.cmd start` otra vez. Esto reinicia los datos del torneo, así que hazlo solo antes de comenzar la competición o después de exportar un respaldo.

Si no defines variables, el servidor genera contraseñas aleatorias y las muestra una sola vez en la terminal al arrancar. Guarda esas credenciales de forma privada.

Los presidentes entran seleccionando su equipo y usando su usuario correspondiente. El organizador entra con `organizador`. No pongas estas contraseñas en GitHub, README, capturas ni mensajes públicos.

- `GET /api/state`: estado público del torneo.
- `POST /api/auth/login`: autenticación de organizador y presidentes.
- `PUT /api/state`: sincronización autenticada del torneo.
- `GET /api/health`: comprobación de disponibilidad.

El frontend usa la API cuando se abre desde `http://` y conserva una copia local únicamente como respaldo de emergencia. El archivo `data/state.json` se crea al arrancar y está excluido del repositorio. Para una publicación en internet, coloca el servidor detrás de HTTPS y añade una base de datos gestionada; este backend local está pensado para una red interna de la prepa.

## 🌐 6. Publicar en internet

El archivo `render.yaml` deja preparado el despliegue del frontend y backend como un único servicio. Para publicarlo:

1. Entra en [render.com](https://render.com) y crea una cuenta usando GitHub.
2. Pulsa **New +** y selecciona **Blueprint**.
3. Elige el repositorio `inigazo31-rgb/kings-league-imex-app`.
4. Render leerá `render.yaml` y creará el servicio.
5. Define las variables `IMEX_PASSWORD_...` cuando Render las solicite.
6. En Supabase abre **SQL Editor**, pega el contenido de `supabase-schema.sql` y pulsa **Run**.
7. En Render define `SUPABASE_SERVICE_ROLE_KEY` con la clave **secret/service_role** de Supabase. Esta clave se guarda únicamente en Render y nunca se sube a GitHub.
8. Pulsa **Apply** y espera a que termine el despliegue.

Render entregará una URL como `https://kings-league-imex.onrender.com`. Esa será la dirección pública para organizador, presidentes y visitantes. Supabase conservará el estado central del torneo; no publiques las claves privadas ni `data/state.json`.

## ⚡ 7. Modo Fantasy

Fantasy vive en la fila independiente `app_state.id = 'fantasy'`; no cambia ni se borra al reiniciar el torneo real. El PIN de cada manager se guarda con hash scrypt. Los puntos se derivan de las actas de partidos y sus cambios vuelven a calcular caja/puntaje. Las operaciones Fantasy se serializan en el servidor para fusionar las mutaciones sin reemplazar `app_state.id = 'main'`.

El organizador administra agentes libres, inscripciones y reset desde **Organizador → Fantasy**. La configuración de reglas y valores está centralizada en `js/data/fantasyConfig.js`.

Para correr la suite de reglas:

```powershell
npm.cmd test
```
