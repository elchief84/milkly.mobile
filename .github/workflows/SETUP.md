# Setup Guide per CI/CD

## 🔥 Firebase App Distribution Setup

### 1. Ottieni Firebase App IDs

1. Vai su [Firebase Console](https://console.firebase.google.com)
2. Seleziona il progetto `milkly`
3. Per **Android**:
   - Settings → General → Your apps → Android app
   - Copia l'**App ID** (formato: `1:123456789:android:abc123...`)
4. Per **iOS**:
   - Settings → General → Your apps → iOS app
   - Copia l'**App ID** (formato: `1:123456789:ios:xyz456...`)

### 2. Crea Service Account per GitHub Actions

1. Vai su [Google Cloud Console](https://console.cloud.google.com)
2. Seleziona il progetto Firebase (stesso nome)
3. IAM & Admin → Service Accounts → Create Service Account
   - Nome: `github-actions-milkly`
   - Role: **Firebase App Distribution Admin**
4. Clicca sul service account creato → Keys → Add Key → Create new key → JSON
5. Scarica il file JSON

### 3. Aggiungi Secrets su GitHub

Vai su: **Settings → Secrets and variables → Actions → New repository secret**

Aggiungi questi secrets:

```
FIREBASE_ANDROID_APP_ID
Valore: <App ID Android da step 1>

FIREBASE_IOS_APP_ID
Valore: <App ID iOS da step 1>

FIREBASE_SERVICE_CREDENTIALS
Valore: <Intero contenuto del file JSON da step 2>
```

### 4. Crea Tester Groups su Firebase

1. Firebase Console → App Distribution → Testers & Groups
2. Crea un gruppo chiamato `internal-testers`
3. Aggiungi gli email dei tester

---

## 🏃 Self-Hosted Runner Setup (macOS)

### Prerequisiti sul tuo Mac

```bash
# Installa Homebrew (se non presente)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Installa Flutter (se non presente)
# Scarica da: https://docs.flutter.dev/get-started/install/macos

# Installa CocoaPods
sudo gem install cocoapods

# Verifica installazioni
flutter doctor
pod --version
```

### Setup GitHub Self-Hosted Runner

1. **Su GitHub:**
   - Vai su: **Settings → Actions → Runners → New self-hosted runner**
   - Sistema operativo: **macOS**
   - Architettura: **ARM64** (M1/M2/M3)

2. **Sul tuo Mac, esegui i comandi forniti da GitHub:**

```bash
# Crea una directory per il runner
mkdir actions-runner && cd actions-runner

# Scarica il runner
curl -o actions-runner-osx-arm64-2.311.0.tar.gz -L \
  https://github.com/actions/runner/releases/download/v2.311.0/actions-runner-osx-arm64-2.311.0.tar.gz

# Estrai
tar xzf ./actions-runner-osx-arm64-2.311.0.tar.gz

# Configura
./config.sh --url https://github.com/vromano/smart-breastfeeding --token YOUR_TOKEN

# IMPORTANTE: Quando chiede "Enter name of runner", usa un nome descrittivo:
# es: "mac-studio-m1" o "macbook-pro-m2"

# Quando chiede "Enter any additional labels", premi Enter (usa i default)
```

3. **Avvia il runner come servizio (opzionale ma raccomandato):**

```bash
# Installa come servizio macOS
sudo ./svc.sh install

# Avvia il servizio
sudo ./svc.sh start

# Verifica status
sudo ./svc.sh status
```

4. **Verifica su GitHub:**
   - Torna su: **Settings → Actions → Runners**
   - Dovresti vedere il tuo runner con stato **Idle** (verde)

### Configurazione Labels (Opzionale)

Se vuoi usare label specifici invece di `self-hosted`:

```bash
# Durante config.sh, aggiungi label custom:
# Enter any additional labels: macos-m1,ios-builds

# Poi nei workflow usa:
runs-on: [self-hosted, macos-m1, ios-builds]
```

### Troubleshooting Runner

**Runner non parte:**
```bash
# Controlla i log
cd actions-runner
cat _diag/*.log
```

**Permessi Xcode:**
```bash
# Assicurati che Xcode sia configurato
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

**Permessi CocoaPods:**
```bash
# Se problemi con pod install
sudo gem install cocoapods
pod repo update
```

---

## 📱 Verifica Setup Completo

### Test Firebase Distribution

```bash
# Push su develop per testare
git checkout develop
git commit --allow-empty -m "Test Firebase distribution"
git push origin develop

# Controlla GitHub Actions → Firebase App Distribution workflow
# Dopo il completamento, vai su Firebase Console → App Distribution
# Dovresti vedere la build disponibile per i tester
```

### Test Self-Hosted Runner

```bash
# Il workflow ci.yml usa già self-hosted per iOS
git checkout -b test/runner-setup
git commit --allow-empty -m "Test self-hosted runner"
git push origin test/runner-setup

# Crea una PR verso develop
# Il workflow partirà e userà il tuo Mac per la build iOS
```

---

## 🔒 Secrets Richiesti (Riepilogo)

| Secret | Dove si trova | Uso |
|--------|---------------|-----|
| `FIREBASE_ANDROID_APP_ID` | Firebase Console → Settings → Android App | Deploy Android su Firebase |
| `FIREBASE_IOS_APP_ID` | Firebase Console → Settings → iOS App | Deploy iOS su Firebase |
| `FIREBASE_SERVICE_CREDENTIALS` | Google Cloud → Service Account JSON | Autenticazione Firebase |

---

## 🎯 Flusso Completo

1. **Sviluppo:** `feature/xyz` → Push
   - CI runs (analyze, test, build Android)
   - iOS build su self-hosted runner

2. **Merge in `develop`:**
   - CI completa
   - **Firebase App Distribution** distribuisce APK/IPA ai tester interni

3. **Tag release (`v1.0.0`):**
   - Build release completa (APK + AAB + IPA)
   - GitHub Release creata automaticamente
   - Artifact pronti per Play Store / App Store

---

## 📚 Comandi Utili

### Gestione Runner
```bash
# Start
sudo ./svc.sh start

# Stop
sudo ./svc.sh stop

# Restart
sudo ./svc.sh restart

# Uninstall
sudo ./svc.sh uninstall
```

### Debug Build Locale
```bash
# Test build come su CI
flutter clean
flutter pub get
flutter build apk --debug
flutter build ios --debug --no-codesign
```

### Firebase CLI (Opzionale)
```bash
# Installa Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Test deploy manuale
firebase appdistribution:distribute \
  build/app/outputs/flutter-apk/app-debug.apk \
  --app YOUR_APP_ID \
  --groups "internal-testers"
```

