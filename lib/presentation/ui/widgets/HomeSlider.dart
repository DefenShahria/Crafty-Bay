import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/data/models/SliderData.dart';
import 'package:craftybay/presentation/ui/utility/ColorPallet.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  final List<SliderData> sliders;
  const HomeSlider({super.key, required this.sliders});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier<int> _selectedSlider  = ValueNotifier(0);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              onPageChanged: (int page, _){
                _selectedSlider.value = page ;
              }
          ),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    decoration:  BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Image.network(sliderData.image ?? '',height: 100,),
                        Positioned(
                            bottom: 0,
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(sliderData.title ?? '',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black
                            ),)
                          ],
                        ))
                      ],
                    )
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16,),
        ValueListenableBuilder(valueListenable: _selectedSlider, builder: (context,value,_){
          List<Widget> list = [];
          for(int i = 0 ; i < widget.sliders.length ;i++){
            list.add(
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColor.primaryColor:null
                ),
              ),
            );

          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list,
          );
        }),
      ],
    );
  }
}