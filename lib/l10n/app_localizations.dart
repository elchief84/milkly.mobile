import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it'),
  ];

  /// The application name
  ///
  /// In en, this message translates to:
  /// **'Milkly'**
  String get appName;

  /// Application tagline
  ///
  /// In en, this message translates to:
  /// **'Breastfeeding tracking made simple'**
  String get appTagline;

  /// Home tab label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Plan tab label
  ///
  /// In en, this message translates to:
  /// **'Plan'**
  String get plan;

  /// Growth tab label
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// Settings tab label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Welcome message in onboarding
  ///
  /// In en, this message translates to:
  /// **'Welcome to Milkly'**
  String get welcomeToMilkly;

  /// Onboarding subtitle
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up your breastfeeding plan together'**
  String get onboardingSubtitle;

  /// Get started button
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Home page placeholder text
  ///
  /// In en, this message translates to:
  /// **'Dashboard & feeding timer will go here'**
  String get dashboardTimerPlaceholder;

  /// Plan page placeholder text
  ///
  /// In en, this message translates to:
  /// **'Feeding plan & schedule will go here'**
  String get planSchedulePlaceholder;

  /// Growth page placeholder text
  ///
  /// In en, this message translates to:
  /// **'Baby growth tracking will go here'**
  String get growthTrackingPlaceholder;

  /// Settings page placeholder text
  ///
  /// In en, this message translates to:
  /// **'App settings & preferences will go here'**
  String get settingsPreferencesPlaceholder;

  /// Onboarding chatbot placeholder
  ///
  /// In en, this message translates to:
  /// **'(Guided chatbot flow will go here)'**
  String get chatbotPlaceholder;

  /// No description provided for @bfOnboarding_questionnaire_step_childProfile_title.
  ///
  /// In en, this message translates to:
  /// **'Baby details'**
  String get bfOnboarding_questionnaire_step_childProfile_title;

  /// No description provided for @bfOnboarding_questionnaire_step_feedingStatus_title.
  ///
  /// In en, this message translates to:
  /// **'Current feeding situation'**
  String get bfOnboarding_questionnaire_step_feedingStatus_title;

  /// No description provided for @bfOnboarding_questionnaire_step_pediatricPlan_title.
  ///
  /// In en, this message translates to:
  /// **'Pediatrician’s plan'**
  String get bfOnboarding_questionnaire_step_pediatricPlan_title;

  /// No description provided for @bfOnboarding_questionnaire_step_feedTimersAndBreast_title.
  ///
  /// In en, this message translates to:
  /// **'Feed timers and breast side'**
  String get bfOnboarding_questionnaire_step_feedTimersAndBreast_title;

  /// No description provided for @bfOnboarding_questionnaire_step_pumping_title.
  ///
  /// In en, this message translates to:
  /// **'Pumping'**
  String get bfOnboarding_questionnaire_step_pumping_title;

  /// No description provided for @bfOnboarding_questionnaire_step_night_title.
  ///
  /// In en, this message translates to:
  /// **'Night-time management'**
  String get bfOnboarding_questionnaire_step_night_title;

  /// No description provided for @bfOnboarding_questionnaire_step_otherChildren_title.
  ///
  /// In en, this message translates to:
  /// **'Other children'**
  String get bfOnboarding_questionnaire_step_otherChildren_title;

  /// No description provided for @bfOnboarding_questionnaire_childName_title.
  ///
  /// In en, this message translates to:
  /// **'What is your baby’s name?'**
  String get bfOnboarding_questionnaire_childName_title;

  /// No description provided for @bfOnboarding_questionnaire_childBirthDate_title.
  ///
  /// In en, this message translates to:
  /// **'What is your baby’s date of birth?'**
  String get bfOnboarding_questionnaire_childBirthDate_title;

  /// No description provided for @bfOnboarding_questionnaire_childSex_title.
  ///
  /// In en, this message translates to:
  /// **'What is your baby’s sex?'**
  String get bfOnboarding_questionnaire_childSex_title;

  /// No description provided for @bfOnboarding_questionnaire_childSex_option_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get bfOnboarding_questionnaire_childSex_option_male;

  /// No description provided for @bfOnboarding_questionnaire_childSex_option_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get bfOnboarding_questionnaire_childSex_option_female;

  /// No description provided for @bfOnboarding_questionnaire_childSex_option_other.
  ///
  /// In en, this message translates to:
  /// **'Other / prefer not to specify'**
  String get bfOnboarding_questionnaire_childSex_option_other;

  /// No description provided for @bfOnboarding_questionnaire_childrenInThisBirth_title.
  ///
  /// In en, this message translates to:
  /// **'How many babies are you following from this birth?'**
  String get bfOnboarding_questionnaire_childrenInThisBirth_title;

  /// No description provided for @bfOnboarding_questionnaire_childrenInThisBirth_option_one.
  ///
  /// In en, this message translates to:
  /// **'One'**
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_one;

  /// No description provided for @bfOnboarding_questionnaire_childrenInThisBirth_option_twins.
  ///
  /// In en, this message translates to:
  /// **'Twins'**
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_twins;

  /// No description provided for @bfOnboarding_questionnaire_childrenInThisBirth_option_moreThanTwo.
  ///
  /// In en, this message translates to:
  /// **'More than two'**
  String get bfOnboarding_questionnaire_childrenInThisBirth_option_moreThanTwo;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_title.
  ///
  /// In en, this message translates to:
  /// **'How are you currently feeding {childName}?'**
  String bfOnboarding_questionnaire_currentFeedingMode_title(String childName);

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_breastOnly.
  ///
  /// In en, this message translates to:
  /// **'Only at the breast'**
  String get bfOnboarding_questionnaire_currentFeedingMode_option_breastOnly;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_breastAndPumped.
  ///
  /// In en, this message translates to:
  /// **'Breast + pumped breast milk (bottle)'**
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndPumped;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_breastAndFormula.
  ///
  /// In en, this message translates to:
  /// **'Breast + formula'**
  String
  get bfOnboarding_questionnaire_currentFeedingMode_option_breastAndFormula;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_pumpedOnly.
  ///
  /// In en, this message translates to:
  /// **'Only pumped breast milk (no direct latch)'**
  String get bfOnboarding_questionnaire_currentFeedingMode_option_pumpedOnly;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_formulaOnly.
  ///
  /// In en, this message translates to:
  /// **'Only formula'**
  String get bfOnboarding_questionnaire_currentFeedingMode_option_formulaOnly;

  /// No description provided for @bfOnboarding_questionnaire_currentFeedingMode_option_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get bfOnboarding_questionnaire_currentFeedingMode_option_other;

  /// No description provided for @bfOnboarding_questionnaire_avgFeedsPerDay_title.
  ///
  /// In en, this message translates to:
  /// **'On average, how many feeds does {childName} have in 24 hours?'**
  String bfOnboarding_questionnaire_avgFeedsPerDay_title(String childName);

  /// No description provided for @bfOnboarding_questionnaire_bottleUsage_title.
  ///
  /// In en, this message translates to:
  /// **'Are you currently using a bottle with {childName}?'**
  String bfOnboarding_questionnaire_bottleUsage_title(String childName);

  /// No description provided for @bfOnboarding_questionnaire_bottleUsage_option_never.
  ///
  /// In en, this message translates to:
  /// **'No, never'**
  String get bfOnboarding_questionnaire_bottleUsage_option_never;

  /// No description provided for @bfOnboarding_questionnaire_bottleUsage_option_sometimes.
  ///
  /// In en, this message translates to:
  /// **'Yes, sometimes'**
  String get bfOnboarding_questionnaire_bottleUsage_option_sometimes;

  /// No description provided for @bfOnboarding_questionnaire_bottleUsage_option_regular.
  ///
  /// In en, this message translates to:
  /// **'Yes, regularly (at least 1–2 times a day)'**
  String get bfOnboarding_questionnaire_bottleUsage_option_regular;

  /// No description provided for @bfOnboarding_questionnaire_pediatricFeedingMode_title.
  ///
  /// In en, this message translates to:
  /// **'How did your pediatrician recommend feeding {childName}?'**
  String bfOnboarding_questionnaire_pediatricFeedingMode_title(
    String childName,
  );

  /// No description provided for @bfOnboarding_questionnaire_pediatricFeedingMode_option_onDemand.
  ///
  /// In en, this message translates to:
  /// **'On demand (whenever the baby asks)'**
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_onDemand;

  /// No description provided for @bfOnboarding_questionnaire_pediatricFeedingMode_option_intervals.
  ///
  /// In en, this message translates to:
  /// **'At more or less regular intervals'**
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_intervals;

  /// No description provided for @bfOnboarding_questionnaire_pediatricFeedingMode_option_mixed.
  ///
  /// In en, this message translates to:
  /// **'A combination of the two'**
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_mixed;

  /// No description provided for @bfOnboarding_questionnaire_pediatricFeedingMode_option_notDefined.
  ///
  /// In en, this message translates to:
  /// **'It has not been defined in detail'**
  String get bfOnboarding_questionnaire_pediatricFeedingMode_option_notDefined;

  /// No description provided for @bfOnboarding_questionnaire_dayIntervalDescription_title.
  ///
  /// In en, this message translates to:
  /// **'Roughly how far apart should daytime feeds be?'**
  String get bfOnboarding_questionnaire_dayIntervalDescription_title;

  /// No description provided for @bfOnboarding_questionnaire_dayIntervalDescription_note.
  ///
  /// In en, this message translates to:
  /// **'For example: every 2–3 hours'**
  String get bfOnboarding_questionnaire_dayIntervalDescription_note;

  /// No description provided for @bfOnboarding_questionnaire_nightIntervalType_title.
  ///
  /// In en, this message translates to:
  /// **'And at night, did the pediatrician give you a reference interval?'**
  String get bfOnboarding_questionnaire_nightIntervalType_title;

  /// No description provided for @bfOnboarding_questionnaire_nightIntervalType_option_sameAsDay.
  ///
  /// In en, this message translates to:
  /// **'Same interval as during the day'**
  String get bfOnboarding_questionnaire_nightIntervalType_option_sameAsDay;

  /// No description provided for @bfOnboarding_questionnaire_nightIntervalType_option_different.
  ///
  /// In en, this message translates to:
  /// **'Different interval (max X hours)'**
  String get bfOnboarding_questionnaire_nightIntervalType_option_different;

  /// No description provided for @bfOnboarding_questionnaire_nightIntervalType_option_notDefined.
  ///
  /// In en, this message translates to:
  /// **'No specific interval was defined'**
  String get bfOnboarding_questionnaire_nightIntervalType_option_notDefined;

  /// No description provided for @bfOnboarding_questionnaire_nightMaxIntervalHours_title.
  ///
  /// In en, this message translates to:
  /// **'What is the maximum night-time interval (in hours)?'**
  String get bfOnboarding_questionnaire_nightMaxIntervalHours_title;

  /// No description provided for @bfOnboarding_questionnaire_maxIntervalAnytimeDefined_title.
  ///
  /// In en, this message translates to:
  /// **'Did the pediatrician give you a maximum number of hours between feeds that should not be exceeded?'**
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_title;

  /// No description provided for @bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, a maximum number of hours'**
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_yes;

  /// No description provided for @bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_no;

  /// No description provided for @bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_dontKnow.
  ///
  /// In en, this message translates to:
  /// **'I don’t remember'**
  String
  get bfOnboarding_questionnaire_maxIntervalAnytimeDefined_option_dontKnow;

  /// No description provided for @bfOnboarding_questionnaire_maxIntervalAnytimeHours_title.
  ///
  /// In en, this message translates to:
  /// **'What is the maximum number of hours between feeds?'**
  String get bfOnboarding_questionnaire_maxIntervalAnytimeHours_title;

  /// No description provided for @bfOnboarding_questionnaire_trackLastBreast_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to track which breast you last used to feed {childName}?'**
  String bfOnboarding_questionnaire_trackLastBreast_title(String childName);

  /// No description provided for @bfOnboarding_questionnaire_trackLastBreast_option_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, that would be helpful'**
  String get bfOnboarding_questionnaire_trackLastBreast_option_yes;

  /// No description provided for @bfOnboarding_questionnaire_trackLastBreast_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, it’s not necessary'**
  String get bfOnboarding_questionnaire_trackLastBreast_option_no;

  /// No description provided for @bfOnboarding_questionnaire_breastPattern_title.
  ///
  /// In en, this message translates to:
  /// **'How do you usually manage breasts during a feed?'**
  String get bfOnboarding_questionnaire_breastPattern_title;

  /// No description provided for @bfOnboarding_questionnaire_breastPattern_option_onePerFeed.
  ///
  /// In en, this message translates to:
  /// **'One breast per feed'**
  String get bfOnboarding_questionnaire_breastPattern_option_onePerFeed;

  /// No description provided for @bfOnboarding_questionnaire_breastPattern_option_bothPerFeed.
  ///
  /// In en, this message translates to:
  /// **'Both breasts in the same feed'**
  String get bfOnboarding_questionnaire_breastPattern_option_bothPerFeed;

  /// No description provided for @bfOnboarding_questionnaire_breastPattern_option_depends.
  ///
  /// In en, this message translates to:
  /// **'It depends, I don’t have a fixed pattern'**
  String get bfOnboarding_questionnaire_breastPattern_option_depends;

  /// No description provided for @bfOnboarding_questionnaire_feedTimerUsage_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to use a timer to measure feed duration?'**
  String get bfOnboarding_questionnaire_feedTimerUsage_title;

  /// No description provided for @bfOnboarding_questionnaire_feedTimerUsage_option_fullTimer.
  ///
  /// In en, this message translates to:
  /// **'Yes, with a start/stop stopwatch'**
  String get bfOnboarding_questionnaire_feedTimerUsage_option_fullTimer;

  /// No description provided for @bfOnboarding_questionnaire_feedTimerUsage_option_approx.
  ///
  /// In en, this message translates to:
  /// **'Yes, but an approximate indication is enough'**
  String get bfOnboarding_questionnaire_feedTimerUsage_option_approx;

  /// No description provided for @bfOnboarding_questionnaire_feedTimerUsage_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, I don’t need it'**
  String get bfOnboarding_questionnaire_feedTimerUsage_option_no;

  /// No description provided for @bfOnboarding_questionnaire_nextFeedReminder_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like the app to remind you when the next feed is approaching, based on the pediatrician’s indications?'**
  String get bfOnboarding_questionnaire_nextFeedReminder_title;

  /// No description provided for @bfOnboarding_questionnaire_nextFeedReminder_option_before.
  ///
  /// In en, this message translates to:
  /// **'Yes, a few minutes before'**
  String get bfOnboarding_questionnaire_nextFeedReminder_option_before;

  /// No description provided for @bfOnboarding_questionnaire_nextFeedReminder_option_onTime.
  ///
  /// In en, this message translates to:
  /// **'Yes, at the estimated time'**
  String get bfOnboarding_questionnaire_nextFeedReminder_option_onTime;

  /// No description provided for @bfOnboarding_questionnaire_nextFeedReminder_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, I prefer to just see the history'**
  String get bfOnboarding_questionnaire_nextFeedReminder_option_no;

  /// No description provided for @bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_title.
  ///
  /// In en, this message translates to:
  /// **'Has your pediatrician (or consultant) given you specific times of day to pump?'**
  String get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_title;

  /// No description provided for @bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_yes;

  /// No description provided for @bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, only when I can'**
  String
  get bfOnboarding_questionnaire_pediatricPumpingScheduleDefined_option_no;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimes_title.
  ///
  /// In en, this message translates to:
  /// **'At what times of day should you pump?'**
  String get bfOnboarding_questionnaire_pumpingTimes_title;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimes_option_morning.
  ///
  /// In en, this message translates to:
  /// **'Morning (e.g. around HH:MM)'**
  String get bfOnboarding_questionnaire_pumpingTimes_option_morning;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimes_option_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon (e.g. around HH:MM)'**
  String get bfOnboarding_questionnaire_pumpingTimes_option_afternoon;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimes_option_eveningNight.
  ///
  /// In en, this message translates to:
  /// **'Evening/night (e.g. around HH:MM)'**
  String get bfOnboarding_questionnaire_pumpingTimes_option_eveningNight;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimes_option_other.
  ///
  /// In en, this message translates to:
  /// **'Other (specify in the notes)'**
  String get bfOnboarding_questionnaire_pumpingTimes_option_other;

  /// No description provided for @bfOnboarding_questionnaire_pumpingTimesNotes_title.
  ///
  /// In en, this message translates to:
  /// **'If you like, specify approximate times to pump (e.g. 7:00, 13:00, 21:00).'**
  String get bfOnboarding_questionnaire_pumpingTimesNotes_title;

  /// No description provided for @bfOnboarding_questionnaire_pumpingReminders_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like the app to remind you of these pumping times?'**
  String get bfOnboarding_questionnaire_pumpingReminders_title;

  /// No description provided for @bfOnboarding_questionnaire_pumpingReminders_option_onTime.
  ///
  /// In en, this message translates to:
  /// **'Yes, with a notification at the specified time'**
  String get bfOnboarding_questionnaire_pumpingReminders_option_onTime;

  /// No description provided for @bfOnboarding_questionnaire_pumpingReminders_option_before.
  ///
  /// In en, this message translates to:
  /// **'Yes, with a reminder shortly before'**
  String get bfOnboarding_questionnaire_pumpingReminders_option_before;

  /// No description provided for @bfOnboarding_questionnaire_pumpingReminders_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, it’s not necessary'**
  String get bfOnboarding_questionnaire_pumpingReminders_option_no;

  /// No description provided for @bfOnboarding_questionnaire_trackPumpedAmount_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to record the amount of milk you pump (in ml)?'**
  String get bfOnboarding_questionnaire_trackPumpedAmount_title;

  /// No description provided for @bfOnboarding_questionnaire_trackPumpedAmount_option_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_yes;

  /// No description provided for @bfOnboarding_questionnaire_trackPumpedAmount_option_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get bfOnboarding_questionnaire_trackPumpedAmount_option_no;

  /// No description provided for @bfOnboarding_questionnaire_nightNotifications_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to receive reminders during the night?'**
  String get bfOnboarding_questionnaire_nightNotifications_title;

  /// No description provided for @bfOnboarding_questionnaire_nightNotifications_option_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, if it helps follow the pediatrician’s plan'**
  String get bfOnboarding_questionnaire_nightNotifications_option_yes;

  /// No description provided for @bfOnboarding_questionnaire_nightNotifications_option_onlyIfExceeds.
  ///
  /// In en, this message translates to:
  /// **'Only if the maximum agreed interval is exceeded'**
  String get bfOnboarding_questionnaire_nightNotifications_option_onlyIfExceeds;

  /// No description provided for @bfOnboarding_questionnaire_nightNotifications_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, I don’t want notifications at night'**
  String get bfOnboarding_questionnaire_nightNotifications_option_no;

  /// No description provided for @bfOnboarding_questionnaire_nightIntervalOverrideHours_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to set a specific maximum interval at night (in hours)?'**
  String get bfOnboarding_questionnaire_nightIntervalOverrideHours_title;

  /// No description provided for @bfOnboarding_questionnaire_configureOtherChildren_title.
  ///
  /// In en, this message translates to:
  /// **'Would you like to apply these settings to another child?'**
  String get bfOnboarding_questionnaire_configureOtherChildren_title;

  /// No description provided for @bfOnboarding_questionnaire_configureOtherChildren_option_twin.
  ///
  /// In en, this message translates to:
  /// **'Yes, for another twin from the same birth'**
  String get bfOnboarding_questionnaire_configureOtherChildren_option_twin;

  /// No description provided for @bfOnboarding_questionnaire_configureOtherChildren_option_otherChild.
  ///
  /// In en, this message translates to:
  /// **'Yes, for another child'**
  String
  get bfOnboarding_questionnaire_configureOtherChildren_option_otherChild;

  /// No description provided for @bfOnboarding_questionnaire_configureOtherChildren_option_no.
  ///
  /// In en, this message translates to:
  /// **'No, only for {childName}'**
  String bfOnboarding_questionnaire_configureOtherChildren_option_no(
    String childName,
  );

  /// No description provided for @bfOnboarding_questionnaire_copySettingsForOtherChild_title.
  ///
  /// In en, this message translates to:
  /// **'For the new child, would you like to copy {childName}’s settings and edit them, or start from scratch?'**
  String bfOnboarding_questionnaire_copySettingsForOtherChild_title(
    String childName,
  );

  /// No description provided for @bfOnboarding_questionnaire_copySettingsForOtherChild_option_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy the settings and then I’ll edit them'**
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_copy;

  /// No description provided for @bfOnboarding_questionnaire_copySettingsForOtherChild_option_new.
  ///
  /// In en, this message translates to:
  /// **'Start from scratch'**
  String get bfOnboarding_questionnaire_copySettingsForOtherChild_option_new;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
