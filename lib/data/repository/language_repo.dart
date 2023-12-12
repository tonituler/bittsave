import 'package:flutter/material.dart';
import 'package:bittsave/data/model/response/language_model.dart';
import 'package:bittsave/util/app_constants.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstants.languages;
  }
}
