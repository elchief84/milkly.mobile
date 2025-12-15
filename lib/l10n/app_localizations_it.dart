// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'Milkly';

  @override
  String get appTagline => 'Tracciamento dell\'allattamento semplificato';

  @override
  String get home => 'Home';

  @override
  String get plan => 'Piano';

  @override
  String get growth => 'Crescita';

  @override
  String get settings => 'Impostazioni';

  @override
  String get welcomeToMilkly => 'Benvenuto in Milkly';

  @override
  String get onboardingSubtitle =>
      'Configuriamo insieme il tuo piano di allattamento';

  @override
  String get getStarted => 'Inizia';

  @override
  String get dashboardTimerPlaceholder =>
      'Dashboard e timer di allattamento andranno qui';

  @override
  String get planSchedulePlaceholder =>
      'Piano e programmazione allattamento andranno qui';

  @override
  String get growthTrackingPlaceholder =>
      'Tracciamento crescita del bambino andrà qui';

  @override
  String get settingsPreferencesPlaceholder =>
      'Impostazioni e preferenze dell\'app andranno qui';

  @override
  String get chatbotPlaceholder => '(Il flusso guidato del chatbot andrà qui)';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonConfirm => 'Conferma';

  @override
  String get commonSkip => 'Salta';

  @override
  String get chatAssistantLabel => 'Assistente';

  @override
  String get chatUserLabel => 'Tu';

  @override
  String get onboardingStartTitle => 'Inizia il tuo percorso';

  @override
  String get onboardingChatWelcomeMessage =>
      'Benvenuta! Configuriamo il tuo piano personalizzato di allattamento.';

  @override
  String get onboardingPhotoSourceTitle => 'Scegli sorgente';

  @override
  String get onboardingPhotoSourceCamera => 'Fotocamera';

  @override
  String get onboardingPhotoSourceGallery => 'Galleria';

  @override
  String get onboardingReviewTitle => 'Conferma il tuo piano';

  @override
  String get onboardingReviewAnswersTitle => 'Riepilogo risposte';

  @override
  String get onboardingReviewCreatePlanCta => 'Conferma e crea il piano';

  @override
  String get onboardingInputHint => 'Inserisci la risposta';

  @override
  String get onboardingNumberHint => 'Inserisci un numero';

  @override
  String get onboardingTextPlaceholder => 'Scrivi qui...';

  @override
  String get onboardingNumberPlaceholder => 'Inserisci un numero...';

  @override
  String get onboardingSelectDate => 'Seleziona data';

  @override
  String get onboardingSelectTime => 'Seleziona orario';

  @override
  String onboardingPhotoLoadError(String error) {
    return 'Errore nel caricamento della foto: $error';
  }

  @override
  String get onboardingPhotoTake => 'Scatta una foto';

  @override
  String get onboardingPhotoPick => 'Scegli dalla galleria';

  @override
  String get onboardingPhotoRemove => 'Rimuovi foto';

  @override
  String get onboardingPhotoAdd => 'Aggiungi una foto';

  @override
  String get onboardingPhotoHint => 'Scatta o scegli dalla galleria';

  @override
  String get onboardingPhotoUploadedLabel => '📷 Foto caricata';

  @override
  String get onboardingSexUnspecified => 'Non specificato';

  @override
  String onboardingLoadError(String error) {
    return 'Impossibile caricare il questionario: $error';
  }

  @override
  String get bfOnboarding_questionnaire_step_childProfile_title =>
      'Dati del bambino';

  @override
  String get bfOnboarding_questionnaire_step_feedingStatus_title =>
      'Situazione attuale di alimentazione';

  @override
  String get bfOnboarding_questionnaire_step_pediatricPlan_title =>
      'Indicazioni del pediatra';

  @override
  String get bfOnboarding_questionnaire_step_feedTimersAndBreast_title =>
      'Timer poppate e lato del seno';

  @override
  String get bfOnboarding_questionnaire_step_pumping_title => 'Tiralatte';

  @override
  String get bfOnboarding_questionnaire_step_night_title =>
      'Gestione della notte';

  @override
  String get bfOnboarding_questionnaire_step_otherChildren_title =>
      'Altri bambini';

  @override
  String get bfOnboarding_questionnaire_childName_title =>
      'Come si chiama il tuo bambino?';

  @override
  String get bfOnboarding_questionnaire_childBirthDate_title =>
      'Qual è la sua data di nascita?';

  @override
  String get bfOnboarding_questionnaire_childSex_title =>
      'Qual è il suo sesso?';

  @override
  String get bfOnboarding_questionnaire_childSex_option_male => 'Maschio';

  @override
  String get bfOnboarding_questionnaire_childSex_option_female => 'Femmina';

  @override
  String get bfOnboarding_questionnaire_childSex_option_other =>
      'Altro / non voglio specificare';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_title =>
      'Quanti bambini stai seguendo con questo parto?';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_one => 'Uno';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_twins =>
      'Gemelli';

  @override
  String
  get bfOnboarding_questionnaire_childrenInThisBirth_option_moreThanTwo =>
      'Più di due';

  @override
  String bfOnboarding_questionnaire_currentFeedingMode_title(String childName) {
    return 'In questo momento come stai nutrendo $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_breastOnly =>
      'Solo al seno';

  @override
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndPumped =>
      'Seno + latte materno tirato (biberon)';

  @override
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndFormula =>
      'Seno + latte artificiale (formula)';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_pumpedOnly =>
      'Solo latte materno tirato (no attacco al seno)';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_formulaOnly =>
      'Solo latte artificiale';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_other =>
      'Altro';

  @override
  String bfOnboarding_questionnaire_avgFeedsPerDay_title(String childName) {
    return 'In media quante poppate fa $childName in 24 ore?';
  }

  @override
  String bfOnboarding_questionnaire_bottleUsage_title(String childName) {
    return 'Al momento usi già il biberon con $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_never => 'No, mai';

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_sometimes =>
      'Sì, ogni tanto';

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_regular =>
      'Sì, regolarmente (almeno 1–2 volte al giorno)';

  @override
  String bfOnboarding_questionnaire_pediatricFeedingMode_title(
    String childName,
  ) {
    return 'Il tuo pediatra ti ha consigliato di allattare $childName…';
  }

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_onDemand =>
      'A richiesta (quando il bambino lo chiede)';

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_intervals =>
      'A intervalli più o meno regolari';

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_mixed =>
      'Una combinazione delle due';

  @override
  String
  get bfOnboarding_questionnaire_pediatricFeedingMode_option_notDefined =>
      'Non è stato definito in dettaglio';

  @override
  String get bfOnboarding_questionnaire_dayIntervalDescription_title =>
      'Ogni quanto circa dovrebbero essere distanziate le poppate di giorno?';

  @override
  String get bfOnboarding_questionnaire_dayIntervalDescription_note =>
      'Ad esempio: ogni 2–3 ore';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_title =>
      'E di notte, il pediatra ti ha dato un intervallo indicativo?';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_sameAsDay =>
      'Stesso intervallo del giorno';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_different =>
      'Intervallo diverso (max X ore)';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_notDefined =>
      'Non è stato definito un intervallo specifico';

  @override
  String get bfOnboarding_questionnaire_nightMaxIntervalHours_title =>
      'Qual è l’intervallo massimo notturno (in ore)?';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_title =>
      'Il pediatra ti ha indicato un numero massimo di ore da non superare tra una poppata e l’altra?';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_yes =>
      'Sì, un numero massimo di ore';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_no =>
      'No';

  @override
  String
  get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_dontKnow =>
      'Non ricordo';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeHours_title =>
      'Quante ore al massimo tra una poppata e l’altra?';

  @override
  String bfOnboarding_questionnaire_trackLastBreast_title(String childName) {
    return 'Vuoi tenere traccia da che lato hai allattato $childName per ultimo?';
  }

  @override
  String get bfOnboarding_questionnaire_trackLastBreast_option_yes =>
      'Sì, mi sarebbe utile';

  @override
  String get bfOnboarding_questionnaire_trackLastBreast_option_no =>
      'No, non è necessario';

  @override
  String get bfOnboarding_questionnaire_breastPattern_title =>
      'Di solito come preferisci gestire i seni durante la poppata?';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_onePerFeed =>
      'Un solo seno per poppata';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_bothPerFeed =>
      'Entrambi i seni nella stessa poppata';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_depends =>
      'Dipende, non ho uno schema fisso';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_title =>
      'Vuoi usare un timer per misurare la durata delle poppate?';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_fullTimer =>
      'Sì, con cronometro avvio/stop';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_approx =>
      'Sì, ma mi basta un’indicazione approssimativa';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_no =>
      'No, non mi serve';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_title =>
      'Vuoi che l’app ti avvisi quando si avvicina il momento della prossima poppata, in base alle indicazioni del pediatra?';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_before =>
      'Sì, qualche minuto prima';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_onTime =>
      'Sì, all’orario stimato';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_no =>
      'No, preferisco solo vedere lo storico';

  @override
  String get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_title =>
      'Il tuo pediatra (o consulente) ti ha indicato momenti specifici della giornata in cui tirare il latte?';

  @override
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_yes =>
      'Sì';

  @override
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_no =>
      'No, solo quando riesco';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_title =>
      'In quali momenti della giornata dovresti tirare il latte?';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_morning =>
      'Mattina (es. verso le HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_afternoon =>
      'Pomeriggio (es. verso le HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_eveningNight =>
      'Sera/notte (es. verso le HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_other =>
      'Altro (specifica nelle note)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimesNotes_title =>
      'Se vuoi, specifica orari indicativi per tirare il latte (es. 7:00, 13:00, 21:00).';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_title =>
      'Vuoi che l’app ti ricordi questi momenti per tirare il latte?';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_onTime =>
      'Sì, con notifica all’orario indicato';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_before =>
      'Sì, con un promemoria poco prima';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_no =>
      'No, non è necessario';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_title =>
      'Ti interessa registrare la quantità di latte tirato (in ml)?';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_yes => 'Sì';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_no => 'No';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_title =>
      'Vuoi ricevere promemoria anche durante la notte?';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_option_yes =>
      'Sì, se serve a seguire le indicazioni del pediatra';

  @override
  String
  get bfOnboarding_questionnaire_nightNotifications_option_onlyIfExceeds =>
      'Solo se si supera l’intervallo massimo che avete stabilito';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_option_no =>
      'No, di notte non voglio notifiche';

  @override
  String get bfOnboarding_questionnaire_nightIntervalOverrideHours_title =>
      'Per la notte vuoi impostare un intervallo massimo specifico (in ore)?';

  @override
  String get bfOnboarding_questionnaire_configureOtherChildren_title =>
      'Vuoi impostare queste impostazioni anche per un altro bambino?';

  @override
  String get bfOnboarding_questionnaire_configureOtherChildren_option_twin =>
      'Sì, per un altro gemello dello stesso parto';

  @override
  String
  get bfOnboarding_questionnaire_configureOtherChildren_option_otherChild =>
      'Sì, per un altro bambino';

  @override
  String bfOnboarding_questionnaire_configureOtherChildren_option_no(
    String childName,
  ) {
    return 'No, solo per $childName';
  }

  @override
  String bfOnboarding_questionnaire_copySettingsForOtherChild_title(
    String childName,
  ) {
    return 'Per il nuovo bambino preferisci copiare le impostazioni di $childName e modificarle dopo, oppure ripartire da zero?';
  }

  @override
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_copy =>
      'Copia le impostazioni e poi modifico';

  @override
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_new =>
      'Ripartiamo da capo';
}
