import 'package:event/utils/common_imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EventCard extends StatelessWidget {
   EventCard({
    Key? key, required this.index, required this.backgroundImage, required this.title, required this.date, required this.address, required this.rating, required this.interestedPeople,
  }) : super(key: key);

  final int index;
  final String backgroundImage;
  final String title;
  final String date;
  final String address;
  final double rating;
  final int interestedPeople;
CalenderController calenderController=Get.put(CalenderController());
  @override
  Widget build(BuildContext context) {
    return Container(
         // margin: calenderController==true?EdgeInsets.only(right: 10):EdgeInsets.zero,
      padding: calenderController.isArabic==true? EdgeInsets.only(
          right: 16,left: index == 1 ?16:0):EdgeInsets.only(
          left: 16, right: index == 1 ? 16 : 0),
      // color: Colors.green,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
              height: 200,
              width: 300,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                width: 300,
                color: Colors.black.withOpacity(0.6),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: AppFontStyle.whiteSemiBold14,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            date,
                            style: AppFontStyle.whiteRegular12,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            address,
                            style: AppFontStyle.whiteRegular12,
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(width,),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RatingBar.builder(
                          itemSize: 14,
                          initialRating: rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          unratedColor: AppColors.white,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(
                              horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          '${interestedPeople}'+'+ Interested'.tr,
                          style: AppFontStyle.whiteRegular10,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
