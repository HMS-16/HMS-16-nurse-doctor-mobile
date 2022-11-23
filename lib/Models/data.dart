final adddata = <ShowCard>[
  ShowCard(
    text:
        "UI/UX adalah desain dalam pembuatan aplikasi. Program Program ini dapat sangat cocok untuk pemula baik bidang IT maupun non-IT dan peminat desain",
    networkimage:
        "https://static.vecteezy.com/system/resources/previews/010/140/787/original/ui-ux-icon-sign-design-free-png.png",
  ),
  ShowCard(
      text:
          "Flutter adalah framework untuk membuat aplikasi mobile. Program ini dapat sangat cocok untuk pemula baik bidang IT maupun non-IT",
      networkimage:
          "https://user-images.githubusercontent.com/51419598/152648731-567997ec-ac1c-4a9c-a816-a1fb1882abbe.png"),
  ShowCard(
    text:
        "Go Langungae (Golang) adalah bahasa pemrograman dengan sintaks sederhana. Program ini cocok untuk belajar bahasa pemrograman baru",
    networkimage:
        "https://academy.alterra.id/wp-content/uploads/2021/05/golang-img.png",
  )
];

class ShowCard {
  String text;
  String networkimage;

  ShowCard({
    required this.text,
    required this.networkimage,
  });
}
