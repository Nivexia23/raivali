# Raivali Panel

A modern, Railway-ready V2Ray/Xray management panel. Rebranded and modernized fork of PasarGuard.

## What changed vs upstream
- **Rebrand**: all visible names changed to **Raivali** (UI, CLI, workspace, messages).
- **Single-repo Railway deploy**: source is bundled in this repo; the Dockerfile does **not** clone anything at build time, so builds are deterministic and faster.
- **Railway adapter**: `start-railway.sh` maps Railway's dynamic `$PORT` to the panel's uvicorn settings and forces `0.0.0.0` binding so the app is reachable without a TLS cert on the instance (TLS is terminated at the Railway edge).
- **Runtime config**: `SQLALCHEMY_DATABASE_URL`, `ROLE`, `UVICORN_PROXY_HEADERS` are all overridable via Railway variables.

## Railway quick start
1. Push this repo to GitHub and create a new Railway project → **Deploy from GitHub repo** → select this repo.
2. (Optional) Set `SQLALCHEMY_DATABASE_URL` to a Postgres/MySQL URL instead of the default SQLite.
3. (Optional) Attach a Railway **Volume** mounted at `/code` if you keep SQLite, otherwise data is lost on redeploy.
4. After the first deploy, open a shell (Railway CLI) and create an admin:
   ```bash
   raivali cli admins --create <username>
   ```

## Tech
- Python 3.14, FastAPI, SQLAlchemy async, Alembic
- React 19 + Vite + Tailwind 4 + TanStack Query dashboard (built with bun)
- NATS for multi-worker / multi-role coordination
- Telegram bot (aiogram 3), Discord/webhook notifications

## License
AGPL-3.0 (same as upstream).
