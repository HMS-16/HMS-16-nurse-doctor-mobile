final adddata = <ShowCard>[
  ShowCard(
      text: "Appoinment & Schedule as per your convinience",
      urlimage: "assets/onboarding_1.png"),
  ShowCard(
      text: "Manage Your Hospital on Your Fingertips",
      urlimage: "assets/onboarding_2.png"),
  ShowCard(
      text: "Manage Lab Reports easier than ever before!",
      urlimage: "assets/onboarding_3.png"),
];

class ShowCard {
  String text;
  String urlimage;

  ShowCard({
    required this.text,
    required this.urlimage,
  });
}
