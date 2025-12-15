// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Milkly';

  @override
  String get appTagline => 'Breastfeeding tracking made simple';

  @override
  String get home => 'Home';

  @override
  String get plan => 'Plan';

  @override
  String get growth => 'Growth';

  @override
  String get settings => 'Settings';

  @override
  String get welcomeToMilkly => 'Welcome to Milkly';

  @override
  String get onboardingSubtitle =>
      'Let\'s set up your breastfeeding plan together';

  @override
  String get getStarted => 'Get Started';

  @override
  String get dashboardTimerPlaceholder =>
      'Dashboard & feeding timer will go here';

  @override
  String get planSchedulePlaceholder => 'Feeding plan & schedule will go here';

  @override
  String get growthTrackingPlaceholder => 'Baby growth tracking will go here';

  @override
  String get settingsPreferencesPlaceholder =>
      'App settings & preferences will go here';

  @override
  String get chatbotPlaceholder => '(Guided chatbot flow will go here)';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonSkip => 'Skip';

  @override
  String get chatAssistantLabel => 'Assistant';

  @override
  String get chatUserLabel => 'You';

  @override
  String get onboardingStartTitle => 'Start your journey';

  @override
  String get onboardingChatWelcomeMessage =>
      'Welcome! Let\'s set up your personalized feeding plan.';

  @override
  String get onboardingPhotoSourceTitle => 'Choose source';

  @override
  String get onboardingPhotoSourceCamera => 'Camera';

  @override
  String get onboardingPhotoSourceGallery => 'Gallery';

  @override
  String get onboardingReviewTitle => 'Confirm your plan';

  @override
  String get onboardingReviewAnswersTitle => 'Answers summary';

  @override
  String get onboardingReviewCreatePlanCta => 'Confirm and create the plan';

  @override
  String get onboardingInputHint => 'Enter your answer';

  @override
  String get onboardingNumberHint => 'Enter a number';

  @override
  String get onboardingTextPlaceholder => 'Type here...';

  @override
  String get onboardingNumberPlaceholder => 'Enter a number...';

  @override
  String get onboardingSelectDate => 'Select date';

  @override
  String get onboardingSelectTime => 'Select time';

  @override
  String onboardingPhotoLoadError(String error) {
    return 'Error loading photo: $error';
  }

  @override
  String get onboardingPhotoTake => 'Take a photo';

  @override
  String get onboardingPhotoPick => 'Choose from gallery';

  @override
  String get onboardingPhotoRemove => 'Remove photo';

  @override
  String get onboardingPhotoAdd => 'Add a photo';

  @override
  String get onboardingPhotoHint => 'Take or choose from gallery';

  @override
  String get onboardingPhotoUploadedLabel => '📷 Photo uploaded';

  @override
  String get onboardingSexUnspecified => 'Unspecified';

  @override
  String onboardingLoadError(String error) {
    return 'Failed to load questionnaire: $error';
  }

  @override
  String get bfOnboarding_questionnaire_step_childProfile_title =>
      'Baby details';

  @override
  String get bfOnboarding_questionnaire_step_feedingStatus_title =>
      'Current feeding situation';

  @override
  String get bfOnboarding_questionnaire_step_pediatricPlan_title =>
      'Pediatrician’s plan';

  @override
  String get bfOnboarding_questionnaire_step_feedTimersAndBreast_title =>
      'Feed timers and breast side';

  @override
  String get bfOnboarding_questionnaire_step_pumping_title => 'Pumping';

  @override
  String get bfOnboarding_questionnaire_step_night_title =>
      'Night-time management';

  @override
  String get bfOnboarding_questionnaire_step_otherChildren_title =>
      'Other children';

  @override
  String get bfOnboarding_questionnaire_childName_title =>
      'What is your baby’s name?';

  @override
  String get bfOnboarding_questionnaire_childBirthDate_title =>
      'What is your baby’s date of birth?';

  @override
  String get bfOnboarding_questionnaire_childSex_title =>
      'What is your baby’s sex?';

  @override
  String get bfOnboarding_questionnaire_childSex_option_male => 'Male';

  @override
  String get bfOnboarding_questionnaire_childSex_option_female => 'Female';

  @override
  String get bfOnboarding_questionnaire_childSex_option_other =>
      'Other / prefer not to specify';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_title =>
      'How many babies are you following from this birth?';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_one => 'One';

  @override
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_twins =>
      'Twins';

  @override
  String
  get bfOnboarding_questionnaire_childrenInThisBirth_option_moreThanTwo =>
      'More than two';

  @override
  String bfOnboarding_questionnaire_currentFeedingMode_title(String childName) {
    return 'How are you currently feeding $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_breastOnly =>
      'Only at the breast';

  @override
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndPumped =>
      'Breast + pumped breast milk (bottle)';

  @override
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndFormula =>
      'Breast + formula';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_pumpedOnly =>
      'Only pumped breast milk (no direct latch)';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_formulaOnly =>
      'Only formula';

  @override
  String get bfOnboarding_questionnaire_currentFeedingMode_option_other =>
      'Other';

  @override
  String bfOnboarding_questionnaire_avgFeedsPerDay_title(String childName) {
    return 'On average, how many feeds does $childName have in 24 hours?';
  }

  @override
  String bfOnboarding_questionnaire_bottleUsage_title(String childName) {
    return 'Are you currently using a bottle with $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_never => 'No, never';

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_sometimes =>
      'Yes, sometimes';

  @override
  String get bfOnboarding_questionnaire_bottleUsage_option_regular =>
      'Yes, regularly (at least 1–2 times a day)';

  @override
  String bfOnboarding_questionnaire_pediatricFeedingMode_title(
    String childName,
  ) {
    return 'How did your pediatrician recommend feeding $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_onDemand =>
      'On demand (whenever the baby asks)';

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_intervals =>
      'At more or less regular intervals';

  @override
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_mixed =>
      'A combination of the two';

  @override
  String
  get bfOnboarding_questionnaire_pediatricFeedingMode_option_notDefined =>
      'It has not been defined in detail';

  @override
  String get bfOnboarding_questionnaire_dayIntervalDescription_title =>
      'Roughly how far apart should daytime feeds be?';

  @override
  String get bfOnboarding_questionnaire_dayIntervalDescription_note =>
      'For example: every 2–3 hours';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_title =>
      'And at night, did the pediatrician give you a reference interval?';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_sameAsDay =>
      'Same interval as during the day';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_different =>
      'Different interval (max X hours)';

  @override
  String get bfOnboarding_questionnaire_nightIntervalType_option_notDefined =>
      'No specific interval was defined';

  @override
  String get bfOnboarding_questionnaire_nightMaxIntervalHours_title =>
      'What is the maximum night-time interval (in hours)?';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_title =>
      'Did the pediatrician give you a maximum number of hours between feeds that should not be exceeded?';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_yes =>
      'Yes, a maximum number of hours';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_no =>
      'No';

  @override
  String
  get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_dontKnow =>
      'I don’t remember';

  @override
  String get bfOnboarding_questionnaire_maxIntervalAnytimeHours_title =>
      'What is the maximum number of hours between feeds?';

  @override
  String bfOnboarding_questionnaire_trackLastBreast_title(String childName) {
    return 'Would you like to track which breast you last used to feed $childName?';
  }

  @override
  String get bfOnboarding_questionnaire_trackLastBreast_option_yes =>
      'Yes, that would be helpful';

  @override
  String get bfOnboarding_questionnaire_trackLastBreast_option_no =>
      'No, it’s not necessary';

  @override
  String get bfOnboarding_questionnaire_breastPattern_title =>
      'How do you usually manage breasts during a feed?';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_onePerFeed =>
      'One breast per feed';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_bothPerFeed =>
      'Both breasts in the same feed';

  @override
  String get bfOnboarding_questionnaire_breastPattern_option_depends =>
      'It depends, I don’t have a fixed pattern';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_title =>
      'Would you like to use a timer to measure feed duration?';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_fullTimer =>
      'Yes, with a start/stop stopwatch';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_approx =>
      'Yes, but an approximate indication is enough';

  @override
  String get bfOnboarding_questionnaire_feedTimerUsage_option_no =>
      'No, I don’t need it';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_title =>
      'Would you like the app to remind you when the next feed is approaching, based on the pediatrician’s indications?';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_before =>
      'Yes, a few minutes before';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_onTime =>
      'Yes, at the estimated time';

  @override
  String get bfOnboarding_questionnaire_nextFeedReminder_option_no =>
      'No, I prefer to just see the history';

  @override
  String get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_title =>
      'Has your pediatrician (or consultant) given you specific times of day to pump?';

  @override
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_yes =>
      'Yes';

  @override
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_no =>
      'No, only when I can';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_title =>
      'At what times of day should you pump?';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_morning =>
      'Morning (e.g. around HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_afternoon =>
      'Afternoon (e.g. around HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_eveningNight =>
      'Evening/night (e.g. around HH:MM)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimes_option_other =>
      'Other (specify in the notes)';

  @override
  String get bfOnboarding_questionnaire_pumpingTimesNotes_title =>
      'If you like, specify approximate times to pump (e.g. 7:00, 13:00, 21:00).';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_title =>
      'Would you like the app to remind you of these pumping times?';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_onTime =>
      'Yes, with a notification at the specified time';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_before =>
      'Yes, with a reminder shortly before';

  @override
  String get bfOnboarding_questionnaire_pumpingReminders_option_no =>
      'No, it’s not necessary';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_title =>
      'Would you like to record the amount of milk you pump (in ml)?';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_yes => 'Yes';

  @override
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_no => 'No';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_title =>
      'Would you like to receive reminders during the night?';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_option_yes =>
      'Yes, if it helps follow the pediatrician’s plan';

  @override
  String
  get bfOnboarding_questionnaire_nightNotifications_option_onlyIfExceeds =>
      'Only if the maximum agreed interval is exceeded';

  @override
  String get bfOnboarding_questionnaire_nightNotifications_option_no =>
      'No, I don’t want notifications at night';

  @override
  String get bfOnboarding_questionnaire_nightIntervalOverrideHours_title =>
      'Would you like to set a specific maximum interval at night (in hours)?';

  @override
  String get bfOnboarding_questionnaire_configureOtherChildren_title =>
      'Would you like to apply these settings to another child?';

  @override
  String get bfOnboarding_questionnaire_configureOtherChildren_option_twin =>
      'Yes, for another twin from the same birth';

  @override
  String
  get bfOnboarding_questionnaire_configureOtherChildren_option_otherChild =>
      'Yes, for another child';

  @override
  String bfOnboarding_questionnaire_configureOtherChildren_option_no(
    String childName,
  ) {
    return 'No, only for $childName';
  }

  @override
  String bfOnboarding_questionnaire_copySettingsForOtherChild_title(
    String childName,
  ) {
    return 'For the new child, would you like to copy $childName’s settings and edit them, or start from scratch?';
  }

  @override
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_copy =>
      'Copy the settings and then I’ll edit them';

  @override
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_new =>
      'Start from scratch';
}
