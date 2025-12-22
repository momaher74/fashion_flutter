import 'package:fashion_flutter/core/models/filter_argument_model.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/widgets/show_all_widget.dart';

class OffersWidget extends StatelessWidget {
  final List<OfferModel> offers;

  const OffersWidget({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ShowAllWidget(title: "Offers"),
        const SizedBox(height: 12),
        SizedBox(
          height: 180, // a bit taller for image
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offers.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) {
              final offer = offers[index];
              final remainingDuration = offer.endDate.difference(
                DateTime.now(),
              );

              return GestureDetector(
                onTap: (){
                  context.pushNamed(filterView , extra:
                  FilterArgumentModel(offerId: offer.id , )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        // Background image
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(offer.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Gradient overlay
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.3),
                                Colors.black.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                        ),

                        // Content
                        Positioned(
                          left: 16,
                          right: 16,
                          top: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomText(
                                  offer.title,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              Gap(10),

                              // Countdown or ended label
                              remainingDuration.isNegative
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade800,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'Offer ended',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : SlideCountdown(
                                      duration: remainingDuration,
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      separatorType: SeparatorType.symbol,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
