import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderPageView extends StatelessWidget {
  const SliderPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Slider"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 60,),
          const Center(child: Text("Slider : Phones")),
          const SizedBox(height: 60,),
          buildCarouselSlider(),
          const SizedBox(height: 60,),
          const Center(child: Text("Slider : Computers")),
          const SizedBox(height: 60,),
          buildCarouselSlider(),
        ],
      ),

    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      items: [

        //1st Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage("https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/09/iphone-13-9-scaled.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //2nd Image of Slider
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage("https://cdn.pocket-lint.com/r/s/970x/assets/images/155087-laptops-review-microsoft-surface-laptop-go-review-image1-6ezitk9ymj.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 400),
        viewportFraction: 0.8,
      ),
    );
  }
}
