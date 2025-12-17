import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/custom_drawer_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/home_view_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          key: _sliderDrawerKey,
          appBar: SliderAppBar(
            config: SliderAppBarConfig(
              drawerIconSize: 28,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  CustomText(
                    AppLocalizations.appName,

                    fontSize: size22,
                    fontWeight: bold,
                  ),
                  Spacer(),
                  Icon(PhosphorIcons.bell(), size: 28),
                ],
              ),
            ),
          ),
          sliderOpenSize: 250,
          slider: const CustomDrawerWidget(),
          child: HomeViewBodyWidget(),
        ),
      ),
    );
  }
}
