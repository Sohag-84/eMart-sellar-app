// ignore_for_file: prefer_const_constructors

import 'package:e_mart_seller/const/const.dart';

class ProductDetails extends StatelessWidget {
  final dynamic data;
  const ProductDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: fontGrey),
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16),
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
              itemCount: data['p_images'].length,
              itemBuilder: (context, index) {
                return Image.network(
                  data['p_images'][index],
                  width: double.infinity,
                  fit: BoxFit.fill,
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
                  boldText(
                    text: "${data['p_name']}",
                    color: fontGrey,
                    size: 16,
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                          text: "${data['p_category']}",
                          color: fontGrey,
                          size: 16),
                      15.widthBox,
                      boldText(
                        text: "${data['p_subcategory']}",
                        color: fontGrey,
                        size: 16,
                      ),
                    ],
                  ),
                  10.heightBox,
                  //rating
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['p_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    maxRating: 5,
                  ),
                  10.heightBox,
                  boldText(text: "\$ ${data['p_price']}", color: red, size: 16),
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
                              data['p_colors'].length,
                              (index) => VxBox()
                                  .size(40, 40)
                                  .roundedFull
                                  .color(
                                    Color(int.parse(data['p_colors'][index])),
                                  )
                                  .margin(
                                    EdgeInsets.symmetric(horizontal: 4),
                                  )
                                  .make()
                                  .onTap(
                                    () {},
                                  ),
                            ),
                          ),
                        ],
                      ),
                      10.heightBox,
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(
                              text: "Quantity",
                              color: fontGrey,
                            ),
                          ),
                          normalText(
                            text: "${data['p_quantity']} items",
                            color: fontGrey,
                          ),
                        ],
                      ),
                    ],
                  ).box.white.p8.make(),
                  10.heightBox,
                  Divider(),
                  10.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "${data['p_desc']}", color: fontGrey)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
