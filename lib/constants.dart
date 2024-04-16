import 'package:flutter/material.dart';

const Color correct = Color(0xFF32AB58);// mau cho dap an dung

const Color incorrect = Color(0xFFAB3232); // mau cho dap an sai

const Color unanswered = Color(0xFFE7E7E7);// mau cho dap an chua tra loi

const Color background = Color(0xFF1A3464); 

final BoxDecoration backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 26, 28, 138).withOpacity(0.5), // Màu gradient đầu
      Color.fromARGB(255, 22, 20, 139).withOpacity(0.9), // Màu gradient cuối
    ],
    begin: Alignment.topLeft, // Điểm bắt đầu của gradient
    end: Alignment.bottomRight, // Điểm kết thúc của gradient
    stops: const [0, 1], // Điểm dừng của gradient
  ),
);