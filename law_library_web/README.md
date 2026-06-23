# The Law Library — Web App

A responsive web application for browsing and searching Brunei's Road Traffic Act (RTA) and Road Traffic Rules (RTR) laws. Companion to the Flutter mobile/desktop app, optimised for desktop browsers.

## Prerequisites

- Node.js 18 or later
- A running instance of the backend API (see [`api/`](../api/))

## Getting Started

```bash
# Install dependencies
npm install

# Start the development server
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## Configuration

The API base URL is set in `lib/api.ts`. The default points to Docker running locally. Uncomment the line that matches your setup:

```ts
const BASE_URL = 'http://localhost:8088';
```

To start the API with Docker, run from the `docker/` folder:

```bash
docker compose up -d
```

## Features

- Browse and search Road Traffic Act laws by category
- View compound fine tables for each law
- Bilingual support (English & Malay)
- Favorites saved locally in the browser
- Dark / Light theme
- Keyboard navigation (arrow keys, Escape)
- Admin dashboard — manage laws and users (create, edit, delete)

## Project Structure

```
app/
  page.tsx           # Home — law browsing and search
  favorites/         # Saved favorites page
  settings/          # Theme, language, and preferences
  law/[chapter]/     # Individual law detail page
  admin/             # Admin login, dashboard, law and user management

components/          # Reusable UI components
lib/
  api.ts             # All API calls
  auth.ts            # Session management and password hashing
  favorites.ts       # LocalStorage favorites management
  translations.ts    # English and Malay string definitions

types/               # TypeScript interfaces
```
