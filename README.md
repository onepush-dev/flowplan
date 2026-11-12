# Flowplan — documents, databases, whiteboards and a daily journal for teams, self-hosted. Deploy on Railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

[Flowplan](https://github.com/yannicschuller/flowplan) (AGPL-3.0, by Yannic Schuller) is a Notion-style workspace: pages and
real-time collaborative documents, databases with table/board/calendar/timeline views, whiteboards, forms, a daily journal,
tasks, comments, passkeys/OIDC/LDAP sign-in, an API and MCP, optional AI. One Next.js container with SQLite.

The template runs the official image `ghcr.io/yannicschuller/flowplan:0.9.4`, unmodified.

## What the template sets up
- One service `flowplan` on port 8080 with a public domain and a health check on `/api/health`
- A volume at `/app/data` (SQLite database, uploads, keys); the image's entrypoint hands it to the unprivileged `node` user
- `APP_URL=https://${{RAILWAY_PUBLIC_DOMAIN}}` (sign-in redirects, cookies, passkeys, links)
- `FLOWPLAN_SETUP_TOKEN`: generated. The first account (the administrator) can only be created at
  `https://<your-domain>/register?setup=<FLOWPLAN_SETUP_TOKEN>`, so nobody else can claim the instance.

## Optional
- E-mail for invitations and digests: `SMTP_HOST`, `SMTP_PORT`, `SMTP_USER`, `SMTP_PASSWORD`, `SMTP_FROM`
- Single sign-on: `OIDC_ISSUER`, `OIDC_CLIENT_ID`, `OIDC_CLIENT_SECRET`
- AI (off by default): see the upstream `.env.example`

## Notes
- Run exactly one replica (SQLite). With a custom domain, set `APP_URL` to it **before** creating the first account
  (passkeys are bound to the address).
