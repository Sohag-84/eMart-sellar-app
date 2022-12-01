// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontGrey),
        title: boldText(text: "Product Details", color: fontGrey, size: 16),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //show slider
            VxSwiper.builder(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  imgProduct,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
            //title and details section
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Product title", color: fontGrey, size: 16),
                  10.heightBox,

                  //rating
                  VxRating(
                    isSelectable: false,
                    value: 4.0,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  boldText(text: "\$300", color: red, size: 16),
                  10.heightBox,

                  //color selection
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Color", color: fontGrey),
                          ),
                          Row(
                            children: List.generate(
                              3,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(Vx.randomPrimaryColor)
                                  .margin(
                                    EdgeInsets.symmetric(horizontal: 4),
                                  )
                                  .make()
                                  .onTap(() {}),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Quantity", color: fontGrey),
                          ),
                          normalText(text: "20 items", color: fontGrey),
                        ],
                      ),
                    ],
                  ).box.white.p8.make(),
                  10.heightBox,
                  Divider(),
                  10.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "Description of this item", color: fontGrey)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
