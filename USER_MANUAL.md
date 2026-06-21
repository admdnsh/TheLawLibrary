# The Law Library — User Manual

**Version:** 1.2
**Date:** June 2026
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
13. [Backend Setup (Docker)](#13-backend-setup-docker)
14. [Project Structure for Developers](#14-project-structure-for-developers)
15. [Database & API Reference](#15-database--api-reference)

### Part 2 — Mobile & Desktop App Usage Manual
16. [First Launch & Onboarding](#16-first-launch--onboarding)
17. [Login Screen](#17-login-screen)
18. [Home Screen](#18-home-screen)
19. [Dashboard](#19-dashboard)
20. [Browsing Laws by Category](#20-browsing-laws-by-category)
21. [Viewing a Law in Detail](#21-viewing-a-law-in-detail)
22. [Search](#22-search)
23. [Favorites](#23-favorites)
24. [Settings](#24-settings)
25. [Admin Panel](#25-admin-panel)
26. [Payment Screen](#26-payment-screen)
27. [About Screen](#27-about-screen)

### Part 3 — Web App Usage Manual
28. [Accessing the Web App](#28-accessing-the-web-app)
29. [Web App Login](#29-web-app-login)
30. [Home — Browsing & Searching Laws](#30-home--browsing--searching-laws)
31. [Viewing a Law in Detail (Web)](#31-viewing-a-law-in-detail-web)
32. [Favorites (Web)](#32-favorites-web)
33. [Settings (Web)](#33-settings-web)
34. [Admin Dashboard (Web)](#34-admin-dashboard-web)
35. [Manage Laws (Web)](#35-manage-laws-web)
36. [Manage Users (Web)](#36-manage-users-web)

---

---

# PART 1 — DEVELOPER SETUP GUIDE

> This section is for anyone who needs to download, install, and run the project on their computer. Follow every step in order. Do not skip steps.

---

## 1. System Requirements

Before you begin, make sure your computer meets these minimum requirements:

### Windows

| Requirement | Minimum |
|---|---|
| Operating System | Windows 10 or Windows 11 (64-bit) |
| RAM (Memory) | 8 GB |
| Disk Space | 15 GB free space |
| Internet | Required (for setup and app to function) |
| Processor | Intel Core i5 / AMD Ryzen 5 or better |

> **What is 64-bit?** To check: press `Windows key + Pause/Break`, or go to `Start → Settings → System → About`. Look for "System type" — it should say "64-bit operating system".

### macOS

| Requirement | Minimum |
|---|---|
| Operating System | macOS 12 Monterey or later |
| RAM (Memory) | 8 GB |
| Disk Space | 15 GB free space |
| Internet | Required (for setup and app to function) |
| Processor | Apple Silicon (M1/M2/M3) or Intel Core i5 or better |

> **What version of macOS do I have?** Click the Apple menu () in the top-left corner and select **"About This Mac"**. The version number will be shown.

---

## 2. Install Git

Git is a tool that lets you download the project from the internet onto your computer.

### Windows Steps:

1. Open your web browser (Chrome, Edge, Firefox — any will work).
2. Go to: **https://git-scm.com/download/win**
3. A download will start automatically. If it does not, click the link that says **"Click here to download"**.
4. Once downloaded, open the file (it will be named something like `Git-2.xx.x-64-bit.exe`).
5. A setup window will open. **Click "Next" on every screen without changing anything.**
6. At the end, click **"Install"**, then **"Finish"**.

### macOS Steps:

1. Open the **Terminal** app (press `Command + Space`, type `Terminal`, press Enter).
2. Type the following and press Enter:
   ```
   git --version
   ```
3. If Git is not installed, macOS will automatically prompt you to install **Xcode Command Line Tools**. Click **"Install"** and wait for it to finish.
4. Once done, run `git --version` again to confirm.

### Verify Git is installed (Windows):

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

### Windows Steps:

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

### macOS Steps:

1. Go to: **https://developer.android.com/studio**
2. Click **"Download Android Studio"** and choose the macOS version (select **Mac with Apple Silicon** if you have an M1/M2/M3 chip, or **Mac with Intel chip** otherwise).
3. Once downloaded, open the `.dmg` file.
4. Drag **Android Studio** into the **Applications** folder.
5. Open **Android Studio** from your Applications folder.

### First-Time Android Studio Setup (all platforms):

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

### Windows Steps:

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

### Add Flutter to System PATH (Windows):

PATH is a setting that lets your computer find Flutter from anywhere. This step is required.

1. Click the **Start** button and search for **"Environment Variables"**.
2. Click **"Edit the system environment variables"**.
3. A window called "System Properties" opens. Click **"Environment Variables..."** at the bottom.
4. In the top section ("User variables"), find the row called **"Path"** and double-click it.
5. Click **"New"** on the right side.
6. Type exactly: `C:\flutter\bin`
7. Click **OK**, then **OK**, then **OK** to close all windows.

### macOS Steps:

1. Go to: **https://docs.flutter.dev/get-started/install/macos/mobile-android**
2. Download the Flutter SDK `.zip` file for macOS.
3. Open **Terminal** and run:
   ```
   cd ~/development
   unzip ~/Downloads/flutter_macos_arm64_xxx.zip
   ```
   (Replace `flutter_macos_arm64_xxx.zip` with the actual filename you downloaded.)
4. Add Flutter to your PATH by running:
   ```
   echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```

### Verify Flutter is installed (all platforms):

1. Open a new terminal / Command Prompt window.
2. Type:
   ```
   flutter doctor
   ```
3. Press Enter. Flutter will check your system. You will see a list of items with checkmarks or X marks.
4. At this stage, it is normal to see some X marks. Continue to the next step.

---

## 5. Connect Flutter to Android Studio

### Install the Flutter Plugin:

1. Open **Android Studio**.
2. On the welcome screen, click **"Plugins"** on the left sidebar.
   - (If a project is already open, go to: `File → Settings → Plugins` on Windows, or `Android Studio → Settings → Plugins` on macOS)
3. In the search bar at the top, type: `Flutter`
4. Click on the **Flutter** plugin (by flutter.dev) and click **Install**.
5. A message will appear asking to also install **Dart** — click **Install** to confirm.
6. Click **Restart IDE** when prompted.

### Set Flutter SDK Path in Android Studio:

**Windows:**
1. After Android Studio restarts, go to: `File → Settings` (or press `Ctrl + Alt + S`)
2. On the left, expand **Languages & Frameworks** and click **Flutter**.
3. In the **"Flutter SDK path"** field, type: `C:\flutter`
4. Click **OK**.

**macOS:**
1. Go to: `Android Studio → Settings`
2. On the left, expand **Languages & Frameworks** and click **Flutter**.
3. In the **"Flutter SDK path"** field, type: `~/development/flutter`
4. Click **OK**.

---

## 6. Get the Project Files

You will download the project onto your computer.

**Windows:**
1. Right-click the ZIP file and select **"Extract All..."**
2. Choose where to extract it (e.g., Desktop) and click **"Extract"**.
3. You will have a folder called `CPRBPF` (or similar). Remember where it is.

**macOS:**
1. Double-click the ZIP file — macOS will extract it automatically.
2. You will have a folder called `CPRBPF` (or similar) in the same location as the ZIP.

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

> **Note for macOS (Apple Silicon):** If the emulator is slow or fails to start, go to `Tools → Device Manager`, edit your virtual device, and make sure the system image says **"ARM"** (not x86). ARM images run natively on Apple Silicon and are much faster.

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

## 13. Backend Setup (Docker)

The backend is a PHP API with a MySQL database. It runs locally on your computer using **Docker**. You must have the backend running for the app to load laws.

> **What is Docker?** Docker is a tool that runs pre-configured software in isolated containers. It means you do not need to install PHP, Apache, or MySQL separately — Docker handles everything.

---

### Step 1 — Install Docker Desktop

**Windows:**

1. Go to: **https://www.docker.com/products/docker-desktop**
2. Click **"Download for Windows"**.
3. Open the downloaded installer and follow the on-screen steps.
4. When prompted, leave all default options and click **Next / Install**.
5. Restart your computer when asked.
6. After restart, open **Docker Desktop** from the Start menu. Wait until it says **"Docker Desktop is running"** in the system tray.

**macOS:**

1. Go to: **https://www.docker.com/products/docker-desktop**
2. Click **"Download for Mac"** — select **Apple Silicon** if you have an M1/M2/M3 chip, or **Intel Chip** otherwise.
3. Open the downloaded `.dmg` file.
4. Drag **Docker** into the **Applications** folder.
5. Open **Docker** from your Applications folder.
6. Wait until the Docker icon in the menu bar (top-right) stops animating — this means Docker is running.

---

### Step 2 — Start the Backend

**Windows:**

1. Open **Command Prompt** (`Windows key + R` → type `cmd` → Enter).
2. Navigate to the `docker` folder inside the project:
   ```
   cd C:\path\to\CPRBPF\docker
   ```
   (Replace `C:\path\to\CPRBPF` with where you saved the project.)
3. Run:
   ```
   docker compose up -d
   ```
4. Docker will download and start the backend containers. The first time may take a few minutes.
5. When done, you will see:
   ```
   Container lawlibrary_mysql      Started
   Container lawlibrary_api        Started
   Container lawlibrary_phpmyadmin Started
   ```

**macOS:**

1. Open **Terminal** (`Command + Space` → type `Terminal` → Enter).
2. Navigate to the `docker` folder:
   ```
   cd /path/to/CPRBPF/docker
   ```
3. Run:
   ```
   docker compose up -d
   ```
4. Same as above — wait for the three containers to start.

---

### Step 3 — Import the Database (First Time Only)

After starting Docker for the first time, you must import the database schema and data:

**Windows:**
```
docker exec -i lawlibrary_mysql mysql -u root -plawlibrary123 law_library < ..\law_library\database_setup.sql
```

**macOS / Linux:**
```
docker exec -i lawlibrary_mysql mysql -u root -plawlibrary123 law_library < ../law_library/database_setup.sql
```

> You only need to do this once. After the first import, data is saved and persists between restarts.

---

### Step 4 — Verify Everything is Running

Open your web browser and go to:

| Service | URL |
|---|---|
| **API** | http://localhost:8088 |
| **phpMyAdmin** (database GUI) | http://localhost:8087 |

- The API page will show a blank page or a JSON response — this is normal.
- phpMyAdmin lets you view and edit the database. Login: **Username:** `root` / **Password:** `lawlibrary123`

---

### Step 5 — Stop the Backend

When you are done, stop the containers to free up memory:

**Windows:**
```
docker compose down
```
(Run this from the `docker` folder in Command Prompt.)

**macOS:**
```
docker compose down
```
(Run this from the `docker` folder in Terminal.)

---

### Common Docker Commands

| Task | Command (run from the `docker` folder) |
|---|---|
| Start the backend | `docker compose up -d` |
| Stop the backend | `docker compose down` |
| View running containers | `docker ps` |
| View logs (if something is wrong) | `docker compose logs` |

---

## 14. Project Structure for Developers

This section explains what each folder and file in the project does. This is intended for developers who will continue building on this project.

```
CPRBPF/
├── law_library/              <- Main Flutter app
│   ├── lib/
│   │   ├── main.dart         <- App entry point. Initializes providers and starts SplashScreen
│   │   ├── screens/          <- All UI screens (pages) of the app
│   │   │   ├── splash_screen.dart       <- Loading screen shown on app start
│   │   │   ├── onboarding_screen.dart   <- Introduction slides for first-time users
│   │   │   ├── login_screen.dart        <- Officer login page
│   │   │   ├── home_screen.dart         <- Main screen after login (law categories)
│   │   │   ├── dashboard_screen.dart    <- Overview dashboard with stats
│   │   │   ├── law_detail_screen.dart   <- Full text view of a single law
│   │   │   ├── law_form_screen.dart     <- Form to add or edit a law (admin only)
│   │   │   ├── favorites_screen.dart    <- Saved/bookmarked laws
│   │   │   ├── settings_screen.dart     <- App language, theme, and preferences
│   │   │   ├── admin_panel_screen.dart  <- Admin tools: manage laws and users
│   │   │   ├── payment_screen.dart      <- Payment/subscription page
│   │   │   └── about_screen.dart        <- App info and credits
│   │   ├── providers/        <- State management (what data the app holds in memory)
│   │   │   ├── auth_provider.dart       <- Handles login, logout, current user
│   │   │   ├── law_provider.dart        <- Loads and manages law data from API
│   │   │   └── theme_provider.dart      <- Manages dark/light mode and language
│   │   ├── services/         <- Business logic and external connections
│   │   │   ├── api_service.dart         <- All HTTP calls to the local backend API
│   │   │   ├── database_service.dart    <- Local SQLite for favorites storage
│   │   │   └── recent_searches_service.dart <- Saves last 5 search terms
│   │   ├── models/           <- Data structures (what a "law" or "user" looks like)
│   │   ├── utils/
│   │   │   └── constants.dart           <- API base URL and app-wide constants
│   │   ├── widgets/          <- Reusable UI components used across screens
│   │   ├── theme/            <- App colors, fonts, and visual style
│   │   └── l10n/             <- Language translation files (English, Malay)
│   ├── android/              <- Android-specific build files
│   ├── windows/              <- Windows desktop build files
│   ├── web/                  <- Web build files
│   └── assets/               <- Images, fonts, and videos used in the app
│
├── api/                      <- PHP backend (runs locally via Docker)
│   ├── db_config.php         <- Database connection settings
│   └── *.php                 <- API endpoint files (one per feature)
│
└── docker/                   <- Docker configuration
    ├── docker-compose.yml    <- Defines all services (API, MySQL, phpMyAdmin)
    ├── Dockerfile.api        <- How the PHP/Apache container is built
    └── mysql/my.cnf          <- MySQL configuration
```

### Key Developer Notes:

**To change the API URL** (e.g., switching between local and a deployed server):

Open `lib/utils/constants.dart` and find these lines:
```dart
// Local development (Docker):
static const String baseUrl = 'http://localhost:8088';

// Android Emulator — use this instead of localhost:
// static const String baseUrl = 'http://10.0.2.2:8088';

// Physical Android device on the same Wi-Fi network:
// static const String baseUrl = 'http://YOUR_COMPUTER_IP:8088';
```

> **Why different URLs for Android?** On an Android emulator, `localhost` refers to the emulator itself, not your computer. Use `10.0.2.2` to reach your computer from the emulator. For a physical phone, find your computer's local IP address (run `ipconfig` on Windows or `ifconfig` on macOS) and use that.

**State Management:** The app uses the **Provider** pattern. The three main providers are initialized in `main.dart`. Any screen can read data from them using `Provider.of<X>(context)` or `context.read<X>()`.

**Local Database:** Favorites are stored locally in SQLite on the device. This data does not sync to the server. It is device-specific.

---

## 15. Database & API Reference

### Architecture Overview

```
Flutter App  ->  Local PHP API (Docker)  ->  MySQL Database (Docker)
```

The app does **not** connect to the database directly. All data goes through the PHP API running locally in Docker.

### API Base URL (local)

```
http://localhost:8088
```

> For Android emulator: `http://10.0.2.2:8088`
> For physical device on same Wi-Fi: `http://<your-computer-local-IP>:8088`

### Database

- **Type:** MySQL 8.0
- **Host:** localhost (Docker container)
- **Port:** 3311 (mapped from Docker)
- **Database name:** `law_library`
- **Root password:** `lawlibrary123`

> **Security Note:** Change the default MySQL password before deploying to any shared or production environment.

### phpMyAdmin

phpMyAdmin is a visual database management tool included in the Docker setup. Access it at `http://localhost:8087` to view, edit, or back up the database without writing SQL commands.

### Default Admin Account

The initial admin account is seeded by `database_setup.sql`:

| Field | Value |
|---|---|
| Username | `admin` |
| Password | `password` (change this immediately after setup) |

> **Security Note:** Change the default admin password immediately after first setup.

---

---

# PART 2 — APP USAGE MANUAL

> This section explains how to use the Law Library app after it has been launched. It covers every screen and feature.

---

## 16. First Launch & Onboarding

When you open the app for the very first time, you will see:

1. **Splash Screen** — The app logo appears for a few seconds while the app loads.
2. **Onboarding Screens** — A series of introduction slides explaining what the app does.
   - Swipe left or tap the **"Next"** button to go through the slides.
   - On the last slide, tap **"Get Started"** to proceed.
   - These screens only appear once. On future launches, the app will go straight to Login.

---

## 17. Login Screen

All users must log in before accessing the app.

### How to Log In:

1. Enter your **Username** in the first field.
2. Enter your **Password** in the second field.
   - Tap the eye icon to show or hide your password.
3. Tap the **"Login"** button.
4. If your credentials are correct, you will be taken to the Home screen.

### Login Errors:

| Error Message | What it means | What to do |
|---|---|---|
| "Invalid credentials" | Wrong username or password | Check your username and password. Contact your admin if forgotten. |
| "Network error" | Cannot reach the backend | Make sure Docker is running (see Section 13) and try again. |

> **Note:** There is no self-registration. Accounts are created by the system administrator via the Admin Panel.

---

## 18. Home Screen

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

## 19. Dashboard

The Dashboard gives an overview of the law library's content.

- Displays **total number of laws** in the system.
- Shows **laws by category** in a visual summary.
- May display **recent activity** or **recently viewed laws**.

To access: Tap the **Dashboard icon** in the bottom navigation bar.

---

## 20. Browsing Laws by Category

1. On the **Home screen**, you will see cards representing different law categories (e.g., Criminal Law, Traffic Law, etc.).
2. Tap any **category card** to open it.
3. A list of all laws within that category will appear.
4. Each law is shown with its **title** and a brief description.
5. Tap any law in the list to read it in full.

---

## 21. Viewing a Law in Detail

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

## 22. Search

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

## 23. Favorites

Favorites let you save laws you frequently refer to for quick access.

### How to Add a Favorite:

1. Open any law (see Section 21).
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

## 24. Settings

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

## 25. Admin Panel

The Admin Panel is only accessible to users with **administrator accounts**. Officers with regular accounts will not see this option.

### How to Access:

- After logging in as an admin, look for an **"Admin Panel"** option in the menu or settings.

### Features of the Admin Panel:

---

### 25a. Managing Laws

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

## 26. Payment Screen

The Payment screen handles subscription or access fees for the app (if applicable).

- Displays available plans or payment options.
- Follow the on-screen instructions to complete a payment.

> **Note for developers:** This screen may be a placeholder or in-progress feature. Verify with the project owner whether payment processing is fully configured.

---

## 27. About Screen

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

- **Cause:** The backend (Docker) is not running.
- **Fix:** Open a terminal, navigate to the `docker` folder, and run `docker compose up -d`. Wait for containers to start, then reload the app.

### "flutter doctor" shows errors during setup

- Run `flutter doctor --android-licenses` in the terminal and type `y` to accept all licenses.
- Make sure Android Studio is fully installed and the Android SDK is downloaded.

### The app crashes on startup

- Make sure you ran `flutter pub get` in the `law_library` folder before running.
- Try running `flutter clean` followed by `flutter pub get`, then run the app again.

### Android emulator is very slow

- **Windows:** Ensure your computer has **hardware virtualization** enabled in BIOS (usually on by default).
- **macOS (Apple Silicon):** Make sure your emulator system image is **ARM64**, not x86. ARM images run natively and are much faster.
- Close other programs to free up RAM.
- Alternatively, use a physical Android phone instead.

### Login does not work

- Make sure Docker is running and the backend containers are up (`docker ps` to check).
- Make sure the API URL in `constants.dart` matches your setup (see Section 14).
- For Android emulator, the URL should be `http://10.0.2.2:8088`, not `http://localhost:8088`.

### Docker says "port is already in use"

- Another program is using port 8088 or 3311. Either stop that program, or edit `docker-compose.yml` to use different port numbers (the left side of the `ports:` mapping).

### Docker Desktop won't start on macOS

- Make sure you downloaded the correct version (Apple Silicon vs Intel).
- Try restarting your Mac and opening Docker Desktop again.

---

## Quick Reference — Key Commands for Developers

### Flutter Commands

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

### Docker Commands (run from the `docker` folder)

| Task | Command |
|---|---|
| Start the backend | `docker compose up -d` |
| Stop the backend | `docker compose down` |
| View running containers | `docker ps` |
| View logs | `docker compose logs` |
| Import database (first time) | See Section 13, Step 3 |

---

---

---

# PART 3 — WEB APP USAGE MANUAL

> The Law Library Web App is a browser-based version of the system. It provides the same law browsing experience as the mobile app, plus full admin management tools accessible from any computer without installing anything.

---

## 28. Accessing the Web App

The web app runs in any modern web browser — no installation required.

1. Make sure the backend Docker containers are running (see Section 13).
2. Open your web browser (Chrome, Edge, or Firefox recommended).
3. Go to the web app URL provided by your system administrator.
4. The app will load immediately. You do not need to log in to browse laws — the law list is visible to everyone.

---

## 29. Web App Login

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

## 30. Home — Browsing & Searching Laws

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

## 31. Viewing a Law in Detail (Web)

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

## 32. Favorites (Web)

Favorites allow you to save laws for quick access. They are stored in your browser and do not require an account.

### How to Save a Favorite:

1. Open any law (see Section 31).
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

## 33. Settings (Web)

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

## 34. Admin Dashboard (Web)

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

## 35. Manage Laws (Web)

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

## 36. Manage Users (Web)

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

*End of User Manual — The Law Library*
*Prepared by: Muhammad Adam Danish | University of Technology Brunei |*
