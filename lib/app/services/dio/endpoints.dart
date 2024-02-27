class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://3.130.198.41:8082/v1/auth";
  static const String userUrl = "http://3.130.198.41:8082/v1/users";
  static const String subCategoriesUrl =
      "http://3.130.198.41:8082/v1/users/categories/";
  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String onBoarding = "/onboarding";
  static const String categories = "/categories";
  static const String subCategories = "subcategories/";
  static const String faqList = "/listFaqs?keyword&page&limit&sortOrder&sortBy";
  static const String privacyPolicy = "/privacyPolicy";
  static const String termsandcondition = "/termsAndConditions";
}

//  http://3.130.198.41:8082/v1/users/categories/subcategories/65b7783f503d2e949a166277
