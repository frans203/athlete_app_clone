String getInterestLabel({required String interest}) {
  switch (interest) {
    case "strength":
      return "Strength & Conditioning";
    case "nutrition":
      return "Performance Nutrition";
    case "therapy":
      return "Athletic Therapy";
    case "psychology":
      return "Performance Psychology";
    default:
      return "";
  }
}
