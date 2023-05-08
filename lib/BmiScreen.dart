import 'package:bmi_caculator/controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BmiScreen extends GetView<HomeController> {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = controller.getSize(context);
    Get.find<HomeController>();
    return Obx(()=> Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                width: size.width,
                height: size.height / 4,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changeGender(true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: (controller.isMale.value)
                                  ? Colors.black
                                  : Colors.black12,
                              width: 4,
                            ),
                            /*boxShadow: const [
                              BoxShadow(
                                color: Colors.black54,
                                offset: Offset(0, 1),
                                blurRadius: 5,
                              ),
                            ],*/
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/male.png',
                                width: 80,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'male',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.changeGender(false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: (!controller.isMale.value)
                                  ? Colors.black
                                  : Colors.black12,
                              width: 4,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/female.png',
                                width: 70,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'female',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width,
                height: size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0, 1),
                      blurRadius: 5,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height (in cm)',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${controller.sliderValue.value.round()}',
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SfSlider(
                      min: 150,
                      max: 230,
                      interval: 10.0,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      //dividerShape: ,
                      //tickShape: const SfTickShape(),
                      minorTicksPerInterval: 0,
                      tooltipShape: const SfPaddleTooltipShape(),
                      value: controller.sliderValue.value,
                      onChanged: (newValue) {
                        controller.changeSliderValue(newValue);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width,
                height: size.height / 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black12,
                            width: 4,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Weight (in kg)",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Stack(
                              //fit: StackFit.loose,
                              alignment: Alignment.topCenter,
                              //clipBehavior: Clip.antiAliasWithSaveLayer,
                              children: [
                                Container(
                                  height: size.height/10,
                                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color:Color(0xffe6f2ff) /*Colors.black12*/,
                                    borderRadius: BorderRadius.circular(40),
                                  ),

                                ),
                                const Positioned(
                                  top: -10,
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                                Positioned(
                                  top: 18,
                                  child: NumberPicker(
                                    axis: Axis.horizontal,
                                    minValue: 50,
                                    maxValue: 120,
                                    value: controller.weight.value,
                                    itemHeight: 50,
                                    itemWidth: 40,
                                    textStyle: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.grey,
                                    ),
                                    selectedTextStyle: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                    ),
                                    onChanged: (newValue){
                                      controller.changeWeight(newValue);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.black12, width: 4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Age",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: size.width/10,
                                    height: size.height/20,
                                    decoration: BoxDecoration(
                                      //color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 3,
                                      ),
                                    ),
                                    child: const Icon(Icons.add,color: Colors.black45),
                                  ),
                                  onTap: (){
                                    controller.changeAge(isAdd: true);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Text(controller.age.value.toString(),
                                    style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                ),
                                InkWell(
                                  child: Container(
                                    width: size.width/10,
                                    height: size.height/20,
                                    decoration: BoxDecoration(
                                      //color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 3,
                                      ),
                                    ),
                                    child: const Icon(Icons.remove,color: Colors.black45),
                                  ),
                                  onTap: (){
                                    controller.changeAge(isAdd: false);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),);
  }
}
