# The Law Library — User Manual

**Version:** 1.1  
**Date:** May 2026  
**Prepared for:** RBPF Officers, Testers & Future Developers  
**Platform:** Android · Windows Desktop · Web Browser (Next.js)

---

## Table of Contents

### Part 1 — Developer Setup Guide
1. [System Requirements](#1-system-requirements)
2. [Install Git](#2-install-git)
3. [Install Android Studio](#3-install-android-studio)
4. [Install Flutter SDK](#4-install-flutter-sdk)
5. [Connect Flutter to Android Studio](#5-connect-flutter-to-android-studio)
6. [Get the Project Files](#6-get-the-project-files)
7. [Open the Project in Android Studio](#7-open-the-project-in-android-studio)
8. [Install Project Dependencies](#8-install-project-dependencies)
9. [Run on Android (Emulator)](#9-run-on-android-emulator)
10. [Run on Android (Physical Phone)](#10-run-on-android-physical-phone)
11. [Run on Windows Desktop](#11-run-on-windows-desktop)
12. [Run on Web Browser](#12-run-on-web-browser)
13. [Project Structure for Developers](#13-project-structure-for-developers)
14. [Database & API Reference](#14-database--api-reference)

### Part 2 — Mobile & Desktop App Usage Manual
15. [First Launch & Onboarding](#15-first-launch--onboarding)
16. [Login Screen](#16-login-screen)
17. [Home Screen](#17-home-screen)
18. [Dashboard](#18-dashboard)
19. [Browsing Laws by Category](#19-browsing-laws-by-category)
20. [Viewing a Law in Detail](#20-viewing-a-law-in-detail)
21. [Search](#21-search)
22. [Favorites](#22-favorites)
23. [Settings](#23-settings)
24. [Admin Panel](#24-admin-panel)
25. [Payment Screen](#25-payment-screen)
26. [About Screen](#26-about-screen)

### Part 3 — Web App Usage Manual
27. [Accessing the Web App](#27-accessing-the-web-app)
28. [Web App Login](#28-web-app-login)
29. [Home — Browsing & Searching Laws](#29-home--browsing--searching-laws)
30. [Viewing a Law in Detail (Web)](#30-viewing-a-law-in-detail-web)
31. [Favorites (Web)](#31-favorites-web)
32. [Settings (Web)](#32-settings-web)
33. [Admin Dashboard (Web)](#33-admin-dashboard-web)
34. [Manage Laws (Web)](#34-manage-laws-web)
35. [Manage Users (Web)](#35-manage-users-web)

---

---

# PART 1 — DEVELOPER SETUP GUIDE

> This section is for anyone who needs to download, install, and run the project on their computer. Follow every step in order. Do not skip steps.

---

## 1. System Requirements

Before you begin, make sure your computer meets these minimum requirements:

| Requirement | Minimum |
|---|---|
| Operating System | Windows 10 or Windows 11 (64-bit) |
| RAM (Memory) | 8 GB |
| Disk Space | 15 GB free space |
| Internet | Required (for setup and app to function) |
| Processor | Intel Core i5 / AMD Ryzen 5 or better |

> **What is 64-bit?** To check: press `Windows key + Pause/Break`, or go to `Start → Settings → System → About`. Look for "System type" — it should say "64-bit operating system".

---

## 2. Install Git

Git is a tool that lets you download the project from the internet onto your computer.

### Steps:

1. Open your web browser (Chrome, Edge, Firefox — any will work).
2. Go to: **https://git-scm.com/download/win**
3. A download will start automatically. If it does not, click the link that says **"Click here to download"**.
4. Once downloaded, open the file (it will be named something like `Git-2.xx.x-64-bit.exe`).
5. A setup window will open. **Click "Next" on every screen without changing anything.**
6. At the end, click **"Install"**, then **"Finish"**.

### Verify Git is installed:

1. Press `Windows key + R` on your keyboard.
2. Type `cmd` and press Enter. A black window (Command Prompt) will open.
3. Type the following and press Enter:
   ```
   git --version
   ```
4. You should see something like: `git version 2.44.0`. If you see this, Git is installed correctly.

---

## 3. Install Android Studio

Android Studio is the main program you will use to run and edit the project.

### Steps:

1. Go to: **https://developer.android.com/studio**
2. Click the big green button that says **"Download Android Studio"**.
3. A box will pop up. Check the box that says "I have read and agree..." and click **"Download Android Studio"**.
4. Once downloaded, open the file (named something like `android-studio-xxx-windows.exe`).
5. The setup wizard will open:
   - Click **Next**
   - Leave everything as default (do not change any checkboxes)
   - Click **Next** again, then **Install**
   - This will take several minutes. Let it finish.
6. Click **Finish**. Android Studio will open for the first time.

### First-Time Android Studio Setup:

When Android Studio opens for the first time, a setup wizard appears:

1. Click **Next**
2. On "Install Type" — choose **Standard** and click **Next**
3. Choose a theme (Light or Dark) — pick whichever you prefer — click **Next**
4. Click **Next** again, then **Finish**
5. Android Studio will now download Android SDK tools. **This can take 10–30 minutes.** Let it finish completely before continuing.
6. When done, click **Finish**.

---

## 4. Install Flutter SDK

Flutter is the framework that the Law Library app is built with. You must install it separately.

### Steps:

1. Go to: **https://docs.flutter.dev/get-started/install/windows/mobile**
2. Scroll down until you see a section called **"Download and install"**.
3. Click the button to download Flutter (it will be a `.zip` file, around 1 GB).
4. Once downloaded, go to your `C:` drive:
   - Open **File Explorer** (the folder icon in your taskbar)
   - Click **"This PC"** on the left
   - Double-click on **"Local Disk (C:)"**
5. Create a new folder here called `flutter`:
   - Right-click in an empty area → **New → Folder**
   - Name it exactly: `flutter`
   - Full path should be: `C:\flutter`
6. Open the `.zip` file you downloaded.
7. Inside the zip, there is a folder called `flutter`. **Copy everything inside it** into `C:\flutter`.
   - After copying, you should have files like `C:\flutter\bin\flutter.bat`

### Add Flutter to System PATH:

PATH is a setting that lets your computer find Flutter from anywhere. This step is required.

1. Click the **Start** button and search for **"Environment Variables"**.
2. Click **"Edit the system environment variables"**.
3. A window called "System Properties" opens. Click **"Environment Variables..."** at the bottom.
4. In the top section ("User variables"), find the row called **"Path"** and double-click it.
5. Click **"New"** on the right side.
6. Type exactly: `C:\flutter\bin`
7. Click **OK**, then **OK**, then **OK** to close all windows.

### Verify Flutter is installed:

1. Close any Command Prompt windows that are open.
2. Open a new Command Prompt (`Windows key + R` → type `cmd` → Enter).
3. Type:
   ```
   flutter doctor
   ```
4. Press Enter. Flutter will check your system. You will see a list of items with checkmarks (✓) or X marks (✗).
5. At this stage, it is normal to see some X marks. Continue to the next step.

---

## 5. Connect Flutter to Android Studio

### Install the Flutter Plugin:

1. Open **Android Studio**.
2. On the welcome screen, click **"Plugins"** on the left sidebar.
   - (If a project is already open, go to: `File → Settings → Plugins`)
3. In the search bar at the top, type: `Flutter`
4. Click on the **Flutter** plugin (by flutter.dev) and click **Install**.
5. A message will appear asking to also install **Dart** — click **Install** to confirm.
6. Click **Restart IDE** when prompted.

### Set Flutter SDK Path in Android Studio:

1. After Android Studio restarts, go to: `File → Settings` (or press `Ctrl + Alt + S`)
2. On the left, expand **Languages & Frameworks** and click **Flutter**.
3. In the **"Flutter SDK path"** field, type: `C:\flutter`
4. Click **OK**.

---

## 6. Get the Project Files

You will download the project from GitHub onto your computer.

### Steps:

### If you received a ZIP file:

1. Right-click the ZIP file and select **"Extract All..."**
2. Choose where to extract it (e.g., Desktop) and click **"Extract"**.
3. You will have a folder called `TheLawLibrary` (or similar). Remember where it is.

---

## 7. Open the Project in Android Studio

1. Open **Android Studio**.
2. On the welcome screen, click **"Open"**.
3. Navigate to the folder where you saved the project.
4. Inside the project folder, find the subfolder called `law_library` and select it.
5. Click **OK**.
6. Android Studio will open the project. Wait for it to finish loading (you will see a progress bar at the bottom).
7. If a message appears saying **"Pub get"** or asking to get packages — click **"Get dependencies"** or **"OK"**.

---

## 8. Install Project Dependencies

Dependencies are extra packages of code that the app needs to work. You must download them before running the app.

### Steps:

1. In Android Studio, look at the bottom of the screen for the **Terminal** tab. Click it.
   - Alternatively: go to `View → Tool Windows → Terminal`
2. In the terminal, make sure you are inside the `law_library` folder. The terminal prompt should show the path ending with `law_library`. If not, type:
   ```
   cd law_library
   ```
3. Type the following command and press Enter:
   ```
   flutter pub get
   ```
4. Wait for it to finish. You will see messages appearing. When it shows **"Got dependencies!"**, it is done.

### Generate Localization Files:

The app supports multiple languages. Run this command next:

```
flutter gen-l10n
```

> If this fails, it is not critical for the app to run. Continue to the next step.

---

## 9. Run on Android (Emulator)

An emulator is a virtual Android phone that runs on your computer. You do not need a real phone for this.

### Create an Android Emulator:

1. In Android Studio, go to the menu: `Tools → Device Manager`
2. A panel will open on the right. Click **"Create Virtual Device"** (or the `+` button).
3. Select a phone from the list — choose **"Pixel 7"** (or any phone with a Play Store icon).
4. Click **Next**.
5. You will see a list of Android versions. Click **Download** next to **"API 34 (Android 14)"**.
   - This will download the Android version. It may take 5–15 minutes.
6. After downloading, select it and click **Next**.
7. Click **Finish**.

### Run the App on the Emulator:

1. At the top of Android Studio, you will see a dropdown that shows your device. Click it and select the emulator you just created (e.g., "Pixel 7").
2. Click the green **Play button (▶)** at the top.
3. The emulator will open and the app will install and launch automatically.
   - **First launch may take 3–5 minutes.** Be patient.

---

## 10. Run on Android (Physical Phone)

If you want to run the app on a real Android phone instead of the emulator:

### Enable Developer Options on your phone:

1. On your Android phone, go to **Settings**.
2. Scroll down and tap **"About phone"**.
3. Find **"Build number"** and tap it **7 times** rapidly.
4. You will see a message: **"You are now a developer!"**

### Enable USB Debugging:

1. Go back to **Settings**.
2. Find **"Developer options"** (usually near the bottom of Settings, or under System).
3. Turn on **"Developer options"** (toggle at the top).
4. Scroll down and turn on **"USB debugging"**.

### Connect phone to computer:

1. Plug your phone into your computer with a USB cable.
2. On your phone, a message will appear: **"Allow USB debugging?"** — tap **"Allow"**.
3. In Android Studio, the dropdown at the top should now show your phone's name.
4. Select your phone and click the green **Play button (▶)**.
5. The app will install on your phone and launch automatically.

---

## 11. Run on Windows Desktop

You can also run the app as a regular Windows application on your computer.

### Steps:

1. In the Android Studio Terminal, type:
   ```
   flutter run -d windows
   ```
2. Press Enter.
3. The app will build and a Windows desktop window will open with the app running.
   - **First build may take 3–5 minutes.**

> **Alternative:** In Android Studio, click the device dropdown at the top and select **"Windows (desktop)"**, then click the green Play button.

---

## 12. Run on Web Browser

You can run the app in your web browser (Chrome is recommended).

### Steps:

1. Make sure Google Chrome is installed on your computer.
2. In the Android Studio Terminal, type:
   ```
   flutter run -d chrome
   ```
3. Press Enter.
4. Chrome will open automatically with the app running.

> **Alternative:** In Android Studio, click the device dropdown at the top and select **"Chrome (web)"**, then click the green Play button.

---

## 13. Project Structure for Developers

This section explains what each folder and file in the project does. This is intended for developers who will continue building on this project.

```
TheLawLibrary/
├── law_library/              ← Main Flutter app
│   ├── lib/
│   │   ├── main.dart         ← App entry point. Initializes providers and starts SplashScreen
│   │   ├── screens/          ← All UI screens (pages) of the app
│   │   │   ├── splash_screen.dart       ← Loading screen shown on app start
│   │   │   ├── onboarding_screen.dart   ← Introduction slides for first-time users
│   │   │   ├── login_screen.dart        ← Officer login page
│   │   │   ├── home_screen.dart         ← Main screen after login (law categories)
│   │   │   ├── dashboard_screen.dart    ← Overview dashboard with stats
│   │   │   ├── law_detail_screen.dart   ← Full text view of a single law
│   │   │   ├── law_form_screen.dart     ← Form to add or edit a law (admin only)
│   │   │   ├── favorites_screen.dart    ← Saved/bookmarked laws
│   │   │   ├── settings_screen.dart     ← App language, theme, and preferences
│   │   │   ├── admin_panel_screen.dart  ← Admin tools: manage laws and users
│   │   │   ├── payment_screen.dart      ← Payment/subscription page
│   │   │   └── about_screen.dart        ← App info and credits
│   │   ├── providers/        ← State management (what data the app holds in memory)
│   │   │   ├── auth_provider.dart       ← Handles login, logout, current user
│   │   │   ├── law_provider.dart        ← Loads and manages law data from API
│   │   │   └── theme_provider.dart      ← Manages dark/light mode and language
│   │   ├── services/         ← Business logic and external connections
│   │   │   ├── api_service.dart         ← All HTTP calls to the Railway backend API
│   │   │   ├── database_service.dart    ← Local SQLite for favorites storage
│   │   │   └── recent_searches_service.dart ← Saves last 5 search terms
│   │   ├── models/           ← Data structures (what a "law" or "user" looks like)
│   │   ├── utils/
│   │   │   └── constants.dart           ← API base URL and app-wide constants
│   │   ├── widgets/          ← Reusable UI components used across screens
│   │   ├── theme/            ← App colors, fonts, and visual style
│   │   └── l10n/             ← Language translation files (English, Malay)
│   ├── android/              ← Android-specific build files
│   ├── windows/              ← Windows desktop build files
│   ├── web/                  ← Web build files
│   └── assets/               ← Images, fonts, and videos used in the app
│       └── images/logo.png   ← App logo
│
└── api/                      ← PHP backend (hosted on Railway)
    ├── db_config.php         ← Database connection using environment variables
    ├── .env.example          ← Template for environment variables
    └── *.php                 ← API endpoint files (one per feature)
```

### Key Developer Notes:

**To change the API URL** (e.g., point to a local server for testing):

Open `lib/utils/constants.dart` and find these lines:
```dart
// Production (Railway):
static const String baseUrl = 'https://law-library-api-production.up.railway.app';

// Development (comment out production and uncomment this):
// static const String baseUrl = 'http://localhost:80/law_library_api';
```
Comment out the production URL and uncomment the local URL when developing locally.

**State Management:** The app uses the **Provider** pattern. The three main providers are initialized in `main.dart`. Any screen can read data from them using `Provider.of<X>(context)` or `context.read<X>()`.

**Local Database:** Favorites are stored locally in SQLite on the device. This data does not sync to the server. It is device-specific.

---

## 14. Database & API Reference

### Architecture Overview

```
Flutter App  →  Railway PHP API  →  MySQL Database (Railway)
```

The app does **not** connect to the database directly. All data goes through the PHP API hosted on Railway.

### API Base URL

```
https://law-library-api-production.up.railway.app
```

### Database

- **Type:** MySQL
- **Host:** Railway (cloud-hosted, always on)
- **Internet required:** Yes — the app will not load laws without an internet connection

### Backend Environment Variables (for backend developers)

If you need to redeploy or modify the backend PHP API, these environment variables must be set in Railway:

| Variable | Description |
|---|---|
| `MYSQLHOST` | Database server address (Railway provides this) |
| `MYSQLDATABASE` | Database name (`law_library`) |
| `MYSQLUSER` | Database username |
| `MYSQLPASSWORD` | Database password |
| `MYSQLPORT` | Port number (usually `3306`) |
| `APP_ENV` | Set to `production` on Railway |

Railway injects these automatically when you attach a MySQL plugin to the project.

### Default Admin Account

The initial admin account is seeded by `database_setup.sql`:

| Field | Value |
|---|---|
| Username | `admin` |
| Password | `password` (change this immediately in production) |

> **Security Note:** Change the default admin password immediately after first setup.

---

---

# PART 2 — APP USAGE MANUAL

> This section explains how to use the Law Library app after it has been launched. It covers every screen and feature.

---

## 15. First Launch & Onboarding

When you open the app for the very first time, you will see:

1. **Splash Screen** — The app logo appears for a few seconds while the app loads.
2. **Onboarding Screens** — A series of introduction slides explaining what the app does.
   - Swipe left or tap the **"Next"** button to go through the slides.
   - On the last slide, tap **"Get Started"** to proceed.
   - These screens only appear once. On future launches, the app will go straight to Login.

---

## 16. Login Screen

All users must log in before accessing the app.

### How to Log In:

1. Enter your **Username** in the first field.
2. Enter your **Password** in the second field.
   - Tap the eye icon (👁) to show or hide your password.
3. Tap the **"Login"** button.
4. If your credentials are correct, you will be taken to the Home screen.

### Login Errors:

| Error Message | What it means | What to do |
|---|---|---|
| "Invalid credentials" | Wrong username or password | Check your username and password. Contact your admin if forgotten. |
| "Network error" | No internet connection | Connect to the internet and try again. |

> **Note:** There is no self-registration. Accounts are created by the system administrator via the Admin Panel.

---

## 17. Home Screen

The Home screen is the main page you see after logging in. It displays:

- **Law categories** — All laws are organized into categories. Each category is shown as a card.
- **Search bar** — At the top, for quickly finding a specific law.
- **Navigation bar** — At the bottom, for switching between main sections of the app.

### Navigation Bar Icons:

| Icon | Screen |
|---|---|
| House icon | Home (law categories) |
| Chart/Dashboard icon | Dashboard (statistics overview) |
| Heart/Star icon | Favorites (your saved laws) |
| Settings icon | Settings |

---

## 18. Dashboard

The Dashboard gives an overview of the law library's content.

- Displays **total number of laws** in the system.
- Shows **laws by category** in a visual summary.
- May display **recent activity** or **recently viewed laws**.

To access: Tap the **Dashboard icon** in the bottom navigation bar.

---

## 19. Browsing Laws by Category

1. On the **Home screen**, you will see cards representing different law categories (e.g., Criminal Law, Traffic Law, etc.).
2. Tap any **category card** to open it.
3. A list of all laws within that category will appear.
4. Each law is shown with its **title** and a brief description.
5. Tap any law in the list to read it in full.

---

## 20. Viewing a Law in Detail

When you tap on a law, the **Law Detail screen** opens.

### What you will see:

- **Law Title** — The name of the law at the top.
- **Category** — Which category this law belongs to.
- **Full Text** — The complete text of the law, scrollable.
- **Bookmark/Favorite button** — Tap the heart or bookmark icon to save this law to your Favorites.

### Actions available:

| Action | How |
|---|---|
| Save to Favorites | Tap the bookmark/heart icon (top right) |
| Go back | Tap the back arrow (top left) or press the back button |
| Share (if available) | Tap the share icon |

---

## 21. Search

The search feature allows you to quickly find any law by name or keyword.

### How to Search:

1. Tap the **search bar** at the top of the Home screen.
2. Start typing a keyword (e.g., "traffic", "theft", "penalty").
3. Results will appear instantly as you type — you do not need to press Enter.
4. Tap any result to open that law.

### Recent Searches:

- The app remembers your last **5 searches**.
- Tap the search bar to see your recent search history.
- Tap any recent search to run it again.

### Tips for Searching:

- You can search by law **title** or by **keywords** in the description.
- Search is not case-sensitive — "Traffic" and "traffic" give the same results.
- If no results appear, try a different or shorter keyword.

---

## 22. Favorites

Favorites let you save laws you frequently refer to for quick access.

### How to Add a Favorite:

1. Open any law (see Section 20).
2. Tap the **heart or bookmark icon** at the top right.
3. The icon will change color to show it has been saved.

### How to View Your Favorites:

1. Tap the **Favorites icon** in the bottom navigation bar.
2. All your saved laws will be listed here.

### How to Remove a Favorite:

1. Open the saved law from the Favorites screen.
2. Tap the heart/bookmark icon again to un-save it.
   - OR: On the Favorites list, swipe the law to the left to reveal a **Delete** option.

> **Note:** Favorites are saved on your device only. If you log in on a different device or reinstall the app, your favorites will not carry over.

---

## 23. Settings

The Settings screen allows you to personalize the app.

To access: Tap the **Settings icon** in the bottom navigation bar.

### Available Settings:

| Setting | Description |
|---|---|
| **Language** | Switch between English and Malay |
| **Theme** | Switch between Light mode and Dark mode |
| **Font Size** | Adjust text size for readability (if available) |
| **Logout** | Sign out of your account |

### How to Log Out:

1. Go to **Settings**.
2. Scroll to the bottom.
3. Tap **"Logout"** or **"Sign Out"**.
4. You will be returned to the Login screen.

---

## 24. Admin Panel

The Admin Panel is only accessible to users with **administrator accounts**. Officers with regular accounts will not see this option.

### How to Access:

- After logging in as an admin, look for an **"Admin Panel"** option in the menu or settings.

### Features of the Admin Panel:

---

### 24a. Managing Laws

**Add a New Law:**

1. In the Admin Panel, tap **"Add Law"** or the **"+" button**.
2. Fill in the form:
   - **Title** — The name of the law (required)
   - **Category** — Select from the dropdown list
   - **Description** — A short summary of the law
   - **Full Text** — The complete text of the law
3. Tap **"Save"** or **"Submit"** when done.
4. The new law will immediately appear in the app for all users.

**Edit an Existing Law:**

1. Find the law in the Admin Panel's law list.
2. Tap the **Edit button** (pencil icon) next to the law.
3. Change any fields you need to update.
4. Tap **"Save"**.

**Delete a Law:**

1. Find the law in the Admin Panel's law list.
2. Tap the **Delete button** (trash icon) next to the law.
3. A confirmation message will appear: **"Are you sure you want to delete this law?"**
4. Tap **"Delete"** or **"Confirm"** to permanently remove it.

> **Warning:** Deleting a law is permanent and cannot be undone. Be sure before deleting.

## 25. Payment Screen

The Payment screen handles subscription or access fees for the app (if applicable).

- Displays available plans or payment options.
- Follow the on-screen instructions to complete a payment.

> **Note for developers:** This screen may be a placeholder or in-progress feature. Verify with the project owner whether payment processing is fully configured.

---

## 26. About Screen

The About screen shows information about the app.

To access: Go to **Settings** and tap **"About"**, or look for it in the app's side menu.

### What you will see:

- **App Name:** The Law Library
- **Version Number**
- **Developer/Team information**
- **Institution:** University of Technology Brunei (UTB)
- **Purpose:** A digital law reference system for RBPF officers

---

---

## Troubleshooting

### The app shows a blank screen or "No data found"

- **Cause:** No internet connection, or the Railway server is temporarily down.
- **Fix:** Check your internet connection and try again. If the problem persists, contact the system administrator.

### "flutter doctor" shows errors during setup

- Run `flutter doctor --android-licenses` in the terminal and type `y` to accept all licenses.
- Make sure Android Studio is fully installed and the Android SDK is downloaded.

### The app crashes on startup

- Make sure you ran `flutter pub get` in the `law_library` folder before running.
- Try running `flutter clean` followed by `flutter pub get`, then run the app again.

### Android emulator is very slow

- Ensure your computer has **hardware virtualization** enabled in BIOS (usually on by default).
- Close other programs to free up RAM.
- Alternatively, use a physical Android phone instead.

### Login does not work

- Check that your internet is connected.
- Verify your username and password with the system administrator.
- Make sure you are not on a network that blocks external connections (e.g., some corporate or government networks may require VPN).

---

## Quick Reference — Key Commands for Developers

| Task | Command |
|---|---|
| Install dependencies | `flutter pub get` |
| Run on Android emulator | `flutter run -d emulator-xxxx` |
| Run on Windows | `flutter run -d windows` |
| Run on Chrome (web) | `flutter run -d chrome` |
| Clean build cache | `flutter clean` |
| Build Android APK | `flutter build apk` |
| Build Windows installer | `flutter build windows` |
| Build for web | `flutter build web` |
| Check Flutter setup | `flutter doctor` |

---

---

---

# PART 3 — WEB APP USAGE MANUAL

> The Law Library Web App is a browser-based version of the system. It provides the same law browsing experience as the mobile app, plus full admin management tools accessible from any computer without installing anything.

---

## 27. Accessing the Web App

The web app runs in any modern web browser — no installation required.

1. Open your web browser (Chrome, Edge, or Firefox recommended).
2. Go to the web app URL provided by your system administrator.
3. The app will load immediately. You do not need to log in to browse laws — the law list is visible to everyone.

> **Note for administrators:** The web app is hosted on Railway. The URL is configured by the project owner. If you do not have the URL, contact your system administrator.

---

## 28. Web App Login

Login is only required to access admin features (managing laws and users). Regular officers can browse and save favorites without logging in.

### How to Log In:

### Username: SuperAdmin
### Password: Super123

1. In the left sidebar, click **"Login"** (the shield icon).
2. Enter your **Username** and **Password**.
3. Click **"Login"**.
4. If successful:
   - **Officers** are taken to the Home page.
   - **Admins** are taken to the Admin Dashboard.

### How to Log Out:

1. In the left sidebar, scroll to the bottom.
2. Click **"Logout"**.
3. Your session will be cleared and you will return to the Home page as a guest.

---

## 29. Home — Browsing & Searching Laws

The Home page is the main screen of the web app. It has a two-panel layout:

- **Left panel** — List of laws with search and filters.
- **Right panel** — Full details of the selected law.

### Browsing Laws:

- Laws are listed 15 at a time.
- Use the **Previous** and **Next** buttons at the bottom of the list to navigate between pages.

### Searching:

1. Type a keyword into the **search bar** at the top of the left panel.
2. Results update automatically after a short pause — you do not need to press Enter.
3. To search immediately, click the **Search** button.

### Filtering by Category:

- Below the search bar, you will see category filter buttons (e.g., Traffic, Criminal, etc.).
- Click any category to show only laws from that category.
- Click **"All"** to remove the filter and show all laws.

### Clearing Filters:

- If a search or category filter is active, a **"Clear"** link appears below the search bar.
- Click it to reset all filters and show all laws.

### Keyboard Navigation:

- With the law list in focus, press the **Arrow Down / Arrow Up** keys to move between laws.
- Press **Escape** to close the detail panel and return focus to the list.

---

## 30. Viewing a Law in Detail (Web)

Click any law in the left panel list to open it in the right detail panel.

### What you will see:

- **Chapter number** — The law's reference code.
- **Category** — The law category shown as a coloured badge.
- **Title** — The full name of the law.
- **Compound Fine** — If applicable, the fine amount is shown.
- **Full Text** — The complete law text, scrollable.
- **Bookmark button** — Save the law to your Favorites.

### On mobile / narrow screens:

On smaller screens, clicking a law opens it in full-screen view. A **back arrow** appears at the top left to return to the list.

---

## 31. Favorites (Web)

Favorites allow you to save laws for quick access. They are stored in your browser and do not require an account.

### How to Save a Favorite:

1. Open any law (see Section 30).
2. Click the **bookmark / star icon** in the detail panel.
3. The icon will turn gold/filled to confirm it has been saved.

### How to View Your Favorites:

1. In the left sidebar, click **"Favorites"** (the star icon).
2. All your saved laws will be listed.
3. Click any law to view its full details in the right panel.

### Searching Within Favorites:

- A search bar appears at the top of the Favorites page.
- Type a keyword to filter your saved laws by title.

### How to Remove a Favorite:

- Open the saved law and click the bookmark/star icon again to un-save it.

> **Note:** Favorites are saved in your browser's local storage. They will be lost if you clear your browser data or use a different browser/device.

---

## 32. Settings (Web)

The Settings page lets you personalise the web app's appearance.

To access: Click **"Settings"** at the bottom of the left sidebar.

### Available Settings:

| Setting | Options | Description |
|---|---|---|
| **Theme** | Light / Dark / System | Changes the colour scheme of the app |
| **Font Size** | Small / Medium / Large | Adjusts the text size throughout the app |
| **Language** | English / Malay | Changes the interface language |
| **Favorites** | Clear All | Removes all saved favorites from this browser |

### How to Clear All Favorites:

1. Go to **Settings**.
2. Under the Favorites section, click **"Clear All"**.
3. A confirmation prompt will appear — click again to confirm.
4. All saved favorites will be permanently removed from this browser.

---

---

## 33. Admin Dashboard (Web)

> **Admin accounts only.** You must be logged in as an administrator to access this page.

The Admin Dashboard gives a statistical overview of the entire law library.

To access: Click **"Dashboard"** in the left sidebar (only visible after admin login).

### What you will see:

| Stat Card | Description |
|---|---|
| **Total Laws** | The total number of laws stored in the system |
| **Categories** | The number of distinct law categories |
| **Total Users** | The number of officer accounts registered |
| **Most Laws** | The category with the highest number of laws |

Below the stat cards, a **Laws by Category** bar chart shows the count and percentage for every category.

### Quick Actions:

At the bottom of the Dashboard, three shortcut buttons appear:
- **Add New Law** — Goes directly to the Manage Laws page with the add form ready.
- **Manage Laws** — Goes to the Manage Laws page.
- **Manage Users** — Goes to the Manage Users page.

### Refresh:

Click the **Refresh** button (top right) to reload the latest statistics from the server.

---

## 34. Manage Laws (Web)

> **Admin accounts only.**

This page lets administrators add, edit, and delete laws in the system.

To access: Click **"Manage Laws"** in the left sidebar.

### Browsing the Law List:

- Laws are shown in a table with their Chapter, Title, Category, and action buttons.
- Use the **search bar** and **category filters** to find specific laws.
- Use **Previous / Next** to navigate pages (20 laws per page).

### Add a New Law:

1. Click the **"+ Add Law"** button (top right of the page).
2. A form will appear. Fill in:
   - **Chapter** — The law's reference code (required)
   - **Title** — The full name of the law (required)
   - **Category** — Select from the dropdown list (required)
   - **Description** — A short summary of the law
   - **Full Text** — The complete text of the law
   - **Compound Fine** — Fine amount, if applicable
3. Click **"Save"** to add the law.
4. A green confirmation message will appear when saved successfully.

### Edit an Existing Law:

1. Find the law in the list.
2. Click the **pencil (edit) icon** on the right side of that row.
3. The same form opens, pre-filled with the current values.
4. Make your changes and click **"Save"**.

### Delete a Law:

1. Find the law in the list.
2. Click the **trash (delete) icon** on the right side of that row.
3. A confirmation dialog will appear: **"Are you sure you want to delete this law?"**
4. Click **"Delete"** to confirm, or **"Cancel"** to go back.

> **Warning:** Deleting a law is permanent and cannot be undone.

---

## 35. Manage Users (Web)

> **Admin accounts only.**

This page lets administrators create, delete, and reset passwords for officer accounts.

To access: Click **"Manage Users"** in the left sidebar.

### Viewing All Users:

- A table lists all registered accounts with their Username and Role (Officer or Admin).

### Add a New User:

1. Click the **"+ Add User"** button (top right).
2. A form will appear. Fill in:
   - **Username** — The login name for the officer (required)
   - **Password** — A temporary password (required)
   - **Role** — Select "Officer" or "Admin"
3. Click **"Create User"**.
4. The new account will appear in the list immediately.

> **Note:** Tell the new user their username and temporary password. They should change their password after first login.

### Reset a User's Password:

1. Find the user in the list.
2. Click the **"Reset Password"** button next to their name.
3. Enter a new password in the form that appears.
4. Click **"Reset"** to confirm.

### Delete a User:

1. Find the user in the list.
2. Click the **trash (delete) icon** next to their name.
3. Confirm the deletion in the dialog that appears.

> **Note:** You cannot delete your own account while logged in as that user.

---

*End of User Manual — Road Offence Act Mobile Application*  
*Prepared by: Muhammad Adam Danish | University of Technology Brunei |*
