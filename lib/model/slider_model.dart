final adddata = <ShowCard>[
  ShowCard(
      text: "Appoinment & Schedule as per your convinience",
      urlimage: "assets/images/landingpage_1.png"),
  ShowCard(
      text: "Manage Your Hospital on Your Fingertips",
      urlimage: "assets/images/landingpage_2.png"),
  ShowCard(
    text: "Manage Lab Reports easier than ever before!",
    urlimage: "assets/images/landingpage_3.png",
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
