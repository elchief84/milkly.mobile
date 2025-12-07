import 'package:smart_breastfeeding/core/utils/asset_loader.dart';
import 'package:smart_breastfeeding/features/onboarding/data/models/questionnaire_model.dart';

/// Data source for loading questionnaire from assets
class QuestionnaireDatasource {
  /// Load questionnaire from JSON asset based on locale
  Future<QuestionnaireModel> loadQuestionnaire({String locale = 'it'}) async {
    final assetPath = 'assets/data/onboarding_$locale.json';
    final json = await AssetLoader.loadJson(assetPath);
    return QuestionnaireModel.fromJson(json);
  }
}
