import 'package:flutter/material.dart';
import 'package:get/get.dart';


//enum RequestStatus{LOADING,SUCCESS,ERROR}
class HomeController extends GetxController{

  //final FetchGlobalSummary gh ;

  //Size size = MediaQuery.of(context).size;
  Size getSize(context) =>MediaQuery.of(context).size;

  RxBool isMale = true.obs;
  changeGender(bool value){
    isMale.value = value;
    //update();
  }

  RxDouble sliderValue = 170.0.obs;
  changeSliderValue(double newValue){
    sliderValue.value = newValue;
    //print(sliderValue.round());
    //update();
  }
  RxInt weight = 70.obs;
  changeWeight(int newValue){
    weight.value = newValue;
    //update();
  }

  RxInt age = 22.obs;
  changeAge({bool isAdd = true}){
    if(isAdd){age.value++;}
    else{age.value--;}
    //update();
  }
}