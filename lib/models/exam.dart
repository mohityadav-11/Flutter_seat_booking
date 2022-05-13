
import 'dart:convert';

Exam examFromJson(String str) => Exam.fromJson(json.decode(str));

class Exam {
  Exam({
    this.id = 0,
    this.ticker ='',
    this.title ='',
    this.year ='',
    this.examDate= '',
    this.image='',
    this.detail1='',
    this.detail2='',
    this.detail3='',
    this.eligibility='',
  });

  int id;
  String ticker;
  String title;
  String year;
  String examDate;
  String image;
  String detail1;
  String detail2;
  String detail3;
  String eligibility;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
    id: json["id"],
    ticker: json["ticker"],
    title: json["title"],
    year: json["year"],
    examDate: json["exam_date"],
    image: json["image"],
    detail1: json["detail1"],
    detail2: json["detail2"],
    detail3: json["detail3"],
    eligibility: json["Eligibility"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ticker": ticker,
    "title": title,
    "year": year,
    "exam_date": examDate,
    "image": image,
    "detail1": detail1,
    "detail2": detail2,
    "detail3": detail3,
    "Eligibility": eligibility,
  };
}
