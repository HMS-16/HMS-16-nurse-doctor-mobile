import 'package:flutter/material.dart';
import 'package:hms_16/models/doctor_model.dart';

class DoctorViewModel extends ChangeNotifier {
  List<DoctorModel> _listDoctors = [
    DoctorModel(
        urlProfile:
            "https://calonpengangguran.com/wp-content/uploads/2019/10/close-up-1-FILEminimizer.jpg",
        name: "Dr. Abednego",
        specialist: "Docter Gigi",
        startTime: 1),
    DoctorModel(
        urlProfile:
            "https://p4.wallpaperbetter.com/wallpaper/645/718/530/women-brunette-closeup-green-eyes-wallpaper-preview.jpg",
        name: "Dr. Baiq Nastasya Nurprawiyanti",
        specialist: "Docter Gigi",
        startTime: 2),
    DoctorModel(
        urlProfile:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9l4R96u-xSP_I_Bhp1zpCIf6MPvrQf-_QSg&usqp=CAU",
        name: "Dr. Alief Rachman Hakim",
        specialist: "Docter Umum",
        startTime: 3),
    DoctorModel(
        urlProfile:
            "https://cdns.diadona.co.id/diadona.id/resources/photonews/2022/06/28/65806/664xauto-ini-foto-close-up-natasha-wilona-yang-kerap-dibilang-mirip-orang-korea-cantiknya-bikin-lupa-ingatan-220628j-002.jpg",
        name: "Dr. Putri Raudatul Jannah",
        specialist: "Docter Umum",
        startTime: 4),
    DoctorModel(
        urlProfile:
            "https://st4.depositphotos.com/4678277/28245/i/600/depositphotos_282454178-stock-photo-close-up-photo-amazing-beautiful.jpg",
        name: "Dr. Nurul Zakiah",
        specialist: "Docter Umum",
        startTime: 1),
  ];
  List<DoctorModel> get listDoctors => _listDoctors;
}
