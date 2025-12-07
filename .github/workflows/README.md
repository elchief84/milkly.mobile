# GitHub Actions CI/CD Workflows

Questo progetto utilizza GitHub Actions per l'automazione di CI/CD.

## 📋 Workflows Disponibili

### 1. **CI** (`ci.yml`)
**Trigger:** Push e Pull Request su `main` e `develop`

**Jobs:**
- ✅ **Analyze & Lint**: Verifica formattazione, analizza il codice, controlla dipendenze
- ✅ **Test**: Esegue i test unitari e genera coverage report
- ✅ **Build Android**: Compila APK debug per Android
- ✅ **Build iOS**: Compila app iOS (macOS runner con Apple Silicon)

**Durata stimata:** ~20-30 minuti

---

### 2. **Release Build** (`release.yml`)
**Trigger:** 
- Tag con formato `v*.*.*` (es: `v1.0.0`)
- Manuale tramite workflow dispatch

**Jobs:**
- 📦 **Android Release**: Compila APK e App Bundle (AAB) in modalità release
- 📦 **iOS Release**: Compila IPA non firmato
- 🚀 **GitHub Release**: Crea automaticamente una release su GitHub con gli artifact

**Come creare una release:**
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

---

### 3. **Code Quality** (`code-quality.yml`)
**Trigger:**
- Push e Pull Request su `main` e `develop`
- Schedulato settimanalmente (domenica a mezzanotte)

**Jobs:**
- 📊 **Code Metrics**: Analisi dettagliata del codice, cerca TODO/FIXME, conta righe di codice
- 🔒 **Dependency Review**: Verifica vulnerabilità nelle dipendenze (solo su PR)

---

## 🚀 Setup Iniziale

### 1. Configurazione Base
I workflow sono già configurati e pronti all'uso. Nessuna configurazione aggiuntiva richiesta per il CI base.

### 2. Code Coverage (Opzionale)
Per visualizzare la coverage su [Codecov](https://codecov.io):
1. Registrati su codecov.io con il tuo account GitHub
2. Aggiungi il repository
3. Il token viene automaticamente gestito da GitHub Actions

### 3. Android Signing (Per Release)
Per firmare le release Android:

1. Genera un keystore:
```bash
keytool -genkey -v -keystore release.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias milkly
```

2. Aggiungi i secrets su GitHub:
   - Settings → Secrets and variables → Actions → New repository secret
   - `ANDROID_KEYSTORE_BASE64`: keystore convertito in base64
   - `ANDROID_KEYSTORE_PASSWORD`: password del keystore
   - `ANDROID_KEY_ALIAS`: alias della chiave
   - `ANDROID_KEY_PASSWORD`: password della chiave

3. Aggiorna `release.yml` per usare il keystore

### 4. iOS Signing (Per App Store)
Per il deploy su App Store:

1. Ottieni certificati da Apple Developer:
   - Distribution certificate
   - Provisioning profile

2. Aggiungi secrets su GitHub:
   - `APPLE_CERTIFICATE_BASE64`
   - `APPLE_CERTIFICATE_PASSWORD`
   - `PROVISIONING_PROFILE_BASE64`
   - `APP_STORE_CONNECT_API_KEY`

---

## 📊 Status Badges

Aggiungi questi badge al README principale:

```markdown
[![CI](https://github.com/vromano/smart-breastfeeding/actions/workflows/ci.yml/badge.svg)](https://github.com/vromano/smart-breastfeeding/actions/workflows/ci.yml)
[![Release Build](https://github.com/vromano/smart-breastfeeding/actions/workflows/release.yml/badge.svg)](https://github.com/vromano/smart-breastfeeding/actions/workflows/release.yml)
[![Code Quality](https://github.com/vromano/smart-breastfeeding/actions/workflows/code-quality.yml/badge.svg)](https://github.com/vromano/smart-breastfeeding/actions/workflows/code-quality.yml)
```

---

## 🔧 Customizzazione

### Cambiare versione Flutter
Modifica `flutter-version` nei workflow:
```yaml
- name: Setup Flutter
  uses: subosito/flutter-action@v2
  with:
    flutter-version: '3.24.0'  # <-- Cambia qui
```

### Modificare branch protetti
Modifica i trigger:
```yaml
on:
  push:
    branches: [ main, develop ]  # <-- Aggiungi/rimuovi branch
```

### Self-hosted Runner (Opzionale)
Se vuoi usare il tuo Mac per iOS builds:

1. Settings → Actions → Runners → New self-hosted runner
2. Segui le istruzioni per macOS
3. Modifica `runs-on: macos-14` in `runs-on: self-hosted`

---

## 🐛 Troubleshooting

### Build fallisce per dipendenze
Prova a invalidare la cache aggiungendo al workflow:
```yaml
- name: Clean Flutter cache
  run: flutter clean
```

### Test timeout
Aumenta il timeout:
```yaml
timeout-minutes: 30  # Default: 15
```

### iOS build lento su GitHub runners
Considera di usare un self-hosted runner sul tuo Mac Apple Silicon per velocizzare i build iOS.

---

## 📚 Risorse Utili

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter CI/CD Best Practices](https://docs.flutter.dev/deployment/cd)
- [Fastlane for Flutter](https://docs.fastlane.tools/getting-started/cross-platform/flutter/)

