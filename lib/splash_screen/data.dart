import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Don't wish for a healthy body. Work for it.");
  sliderModel.setTitle("Dedication");
  sliderModel.setImageAssetPath("assets/images/GirlFitness.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Creating a healthy daily routine keeps you grounded and can have a big impact on your physical and mental health.");
  sliderModel.setTitle("Motivation");
  sliderModel.setImageAssetPath("assets/images/women-running.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("We bring to you, DIETEN");
  sliderModel.setTitle("YOUR PERSONAL TRAINER");
  sliderModel.setImageAssetPath("assets/images/illustration.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4
  sliderModel.setDesc(
      "With Dieten, you can always Plan your goals and work hard to Achieve them.");
  sliderModel.setTitle("Dieten");
  sliderModel.setImageAssetPath("assets/images/app-logo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
