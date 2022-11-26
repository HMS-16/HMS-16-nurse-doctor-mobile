final adddata = <ShowCard>[
  ShowCard(
      text: "Appoinment & Schedule as per your convinience",
      urlimage: "assets/onboarding_image'1.png"),
  ShowCard(
      text: "Manage Your Hospital on Your Fingertips",
      urlimage: "assets/onboarding_image'1.png"),
  ShowCard(
    text: "Manage Lab Reports easier than ever before!",
    urlimage: "assets/onboarding_image'2.png",
  )
];

class ShowCard {
  String text;
  String urlimage;

  ShowCard({
    required this.text,
    required this.urlimage,
  });
}
