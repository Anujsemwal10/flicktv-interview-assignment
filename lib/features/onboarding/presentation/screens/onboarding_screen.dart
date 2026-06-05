import 'package:anujsemwal/core/constants/app_assets.dart';
import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:anujsemwal/core/constants/colors.dart';
import 'package:anujsemwal/core/constants/string_constants.dart';
import 'package:anujsemwal/core/utils/responsive_helper.dart';
import 'package:anujsemwal/core/widgets/app_button.dart';
import 'package:anujsemwal/features/onboarding/presentation/controller/onboarding_state_notifier.dart';
import 'package:anujsemwal/features/onboarding/presentation/widgets/feature_card.dart';
import 'package:anujsemwal/features/onboarding/presentation/widgets/gift_card.dart';
import 'package:anujsemwal/features/onboarding/presentation/widgets/wallet_logo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final OnboardingStateNotifier _stateNotifier = OnboardingStateNotifier();

  ///init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stateNotifier.onSplashStart();
  }

  @override
  Widget build(BuildContext context) {
    ///Instead of implementing complete UI in a single widget, divide it into
    /// smaller parts to get rid of unnecessary hot-reload
    return _rootWidget();
  }

  ///parent widget as rootWidget.
  Widget _rootWidget() {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundGradientColor(),
          _celebrationAnimation(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.d20),
              child: Column(
                mainAxisSize: .min,
                children: [
                  SizedBox(height: AppDimensions.d5),
                  _appBar(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: .start,
                        children: [
                          AnimatedBuilder(
                            animation: _stateNotifier,
                            builder: (BuildContext context, Widget? child) {
                              return AnimatedSlide(
                                ///ste7.
                                offset: _stateNotifier.topAnimationCompletion
                                    ? Offset(
                                        AppDimensions.d0,
                                        context.responsiveHeight(
                                          -AppDimensions.d1Point8,
                                        ),
                                      )
                                    : const Offset(
                                        AppDimensions.d0,
                                        AppDimensions.d0,
                                      ),
                                curve: Curves.easeInOutCirc,
                                duration: Duration(
                                  milliseconds: AppDimensions.int1000,
                                ),
                                child: Column(
                                  children: [
                                    ///step 1 to step 4
                                    _walletAnimation(),

                                    ///step 5 to step 6
                                    _blinkAndMoneyTextWidget(),
                                  ],
                                ),
                              );
                            },
                          ),
                          _cardAnimationWidget(),
                          _footerWidget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///complete footer part with animation
  Widget _footerWidget() {
    return AnimatedBuilder(
      animation: _stateNotifier,
      builder: (BuildContext context, Widget? child) {
        return AnimatedOpacity(
          opacity: _stateNotifier.settingIconAppear
              ? AppDimensions.d1
              : AppDimensions.d0,
          duration: const Duration(milliseconds: AppDimensions.int500),
          child: Column(
            mainAxisSize: .min,
            children: [
              AppButton(
                buttonColor: AppColors.primaryGreen,
                buttonText: StringConstants.addMoney,
              ),
              SizedBox(height: AppDimensions.d30),
              Flexible(child: GiftCard()),
              SizedBox(height: AppDimensions.d40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.d10,
                ),
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Text(
                      StringConstants.enjoySeamless,
                      style: TextStyle(
                        fontSize: AppDimensions.d40,
                        fontWeight: FontWeight.w800,
                        letterSpacing: AppDimensions.d1Point5,
                        height: AppDimensions.d1,
                        color: AppColors.textPrimary.withValues(
                          alpha: AppDimensions.d025,
                        ),
                      ),
                    ),

                    Text(
                      StringConstants.oneTapPay,
                      style: TextStyle(
                        height: AppDimensions.d1Point2,
                        fontSize: AppDimensions.d40,
                        fontWeight: FontWeight.w800,
                        letterSpacing: AppDimensions.d1Point5,
                        color: AppColors.textPrimary.withValues(
                          alpha: AppDimensions.d025,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.d10),
            ],
          ),
        );
      },
    );
  }

  /// all three card animation part
  Widget _cardAnimationWidget() {
    return AnimatedBuilder(
      animation: _stateNotifier,
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            _buildStrictStaggeredCard(
              isVisible: _stateNotifier.showCard1,
              child: FeatureCard(
                title: StringConstants.feature1Title,
                subtitle: StringConstants.feature1Subtitle,
                iconData: Icons.touch_app_outlined,
                imageName: AppAssets.singleTapPayment,
              ),
            ),
            const SizedBox(height: AppDimensions.d14),
            _buildStrictStaggeredCard(
              isVisible: _stateNotifier.showCard2,
              child: FeatureCard(
                title: StringConstants.feature2Title,
                subtitle: StringConstants.feature2Subtitle,
                iconData: Icons.gpp_good_outlined,
                imageName: AppAssets.zeroFailure,
              ),
            ),
            const SizedBox(height: AppDimensions.d14),
            _buildStrictStaggeredCard(
              isVisible: _stateNotifier.showCard3,
              child: FeatureCard(
                title: StringConstants.feature3Title,
                subtitle: StringConstants.feature3Subtitle,
                iconData: Icons.currency_rupee_outlined,
                imageName: AppAssets.refund,
              ),
            ),
          ],
        );
      },
    );
  }

  /// common opacity widget for cards
  Widget _buildStrictStaggeredCard({
    required bool isVisible,
    required Widget child,
  }) {
    return Opacity(
      opacity: isVisible ? AppDimensions.d1 : AppDimensions.d0,
      child: AnimatedSlide(
        duration: const Duration(milliseconds: AppDimensions.int200),
        curve: Curves.linear,
        offset: isVisible
            ? Offset(
                AppDimensions.d0,
                context.responsiveHeight(-AppDimensions.d03),
              )
            : Offset(AppDimensions.d0, AppDimensions.d0),
        child: child,
      ),
    );
  }

  ///blinkit And Money Text Part
  Widget _blinkAndMoneyTextWidget() {
    return AnimatedOpacity(
      opacity: _stateNotifier.animateText ? AppDimensions.d1 : AppDimensions.d0,
      duration: const Duration(milliseconds: AppDimensions.int600),
      child: Column(
        children: [
          ///step 5. animation for blinkit text
          AnimatedSlide(
            duration: const Duration(milliseconds: AppDimensions.int600),
            curve: Curves.linear,
            offset: _stateNotifier.animateText
                ? Offset(
                    AppDimensions.d0,
                    context.responsiveHeight(AppDimensions.d8Point4),
                  )
                : Offset(
                    AppDimensions.d0,
                    context.responsiveHeight(AppDimensions.d8Point7),
                  ),
            child: Text(
              StringConstants.blinkit,
              style: const TextStyle(
                fontSize: AppDimensions.d24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          ///step 5. animation for Money Text
          AnimatedSlide(
            duration: const Duration(milliseconds: AppDimensions.int700),
            curve: Curves.easeInSine,
            offset: _stateNotifier.animateText
                ? Offset(
                    AppDimensions.d0,
                    context.responsiveHeight(AppDimensions.d5Point8),
                  )
                : Offset(
                    AppDimensions.d0,
                    context.responsiveHeight(AppDimensions.d6Point1),
                  ),
            child: Text(
              StringConstants.money,
              style: TextStyle(
                letterSpacing: AppDimensions.d5,
                fontSize: AppDimensions.d34,
                fontWeight: FontWeight.w800,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }

  ///Celebration Gif part
  Widget _celebrationAnimation() {
    return AnimatedBuilder(
      animation: _stateNotifier,
      builder: (context, _) {
        if (!_stateNotifier.isLottieAnimation) {
          return const SizedBox.shrink();
        }
        return AnimatedSlide(
          offset: Offset(
            AppDimensions.d0,
            context.responsiveHeight(-AppDimensions.d02),
          ),
          duration: const Duration(milliseconds: AppDimensions.int100),
          child: Lottie.asset(
            AppAssets.celebrationGif,
            repeat: false,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }

  ///Wallet Animation Part
  Widget _walletAnimation() {
    return Column(
      mainAxisAlignment: .start,
      children: [
        ///step1. wallet visibility
        if (!_stateNotifier.isWalletShiftedDown)
          AnimatedSlide(
            offset: Offset(
              AppDimensions.d0,
              context.responsiveHeight(AppDimensions.d3),
            ),
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: AppDimensions.int100),
            child: WalletLogo(isVisible: _stateNotifier.animateWalletIcon),
          ),

        ///step3. drop wallet towards bottom center
        if (_stateNotifier.isWalletShiftedDown &&
            !_stateNotifier.justAfterWalletShiftedDown)
          AnimatedSlide(
            curve: Curves.easeInSine,
            offset: Offset(
              AppDimensions.d0,
              context.responsiveHeight(AppDimensions.d4),
            ),
            duration: const Duration(milliseconds: AppDimensions.int500),
            child: WalletLogo(isVisible: _stateNotifier.animateWalletIcon),
          ),

        ///step4. squash wallet a little bit
        if (_stateNotifier.justAfterWalletShiftedDown &&
            !_stateNotifier.isWalletSquashed)
          AnimatedSlide(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: AppDimensions.int700),
            offset: Offset(
              AppDimensions.d0,
              context.responsiveHeight(AppDimensions.d4),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: AppDimensions.int200),
              curve: Curves.easeOutBack,
              transform: Matrix4.diagonal3Values(
                _stateNotifier.squashX,
                _stateNotifier.squashY,
                AppDimensions.d1,
              ),
              alignment: Alignment.bottomCenter,
              child: WalletLogo(isVisible: _stateNotifier.animateWalletIcon),
            ),
          ),

        ///step5. back to initial position
        if (_stateNotifier.isWalletSquashed)
          AnimatedSlide(
            curve: Curves.easeInSine,
            offset: Offset(
              AppDimensions.d0,
              context.responsiveHeight(AppDimensions.d3Point2),
            ),
            duration: const Duration(milliseconds: AppDimensions.int500),
            child: WalletLogo(isVisible: _stateNotifier.animateWalletIcon),
          ),
      ],
    );
  }

  ///custom app bar with back button and setting button
  Widget _appBar() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cardBorder),
            borderRadius: BorderRadiusGeometry.circular(AppDimensions.d50),
            color: AppColors.cardBackground,
          ),
          height: AppDimensions.d40,
          width: AppDimensions.d40,
          child: Center(child: Icon(Icons.arrow_back_ios_rounded)),
        ),
        AnimatedBuilder(
          animation: _stateNotifier,
          builder: (BuildContext context, Widget? child) {
            return AnimatedOpacity(
              opacity: _stateNotifier.animateFooter
                  ? AppDimensions.d1
                  : AppDimensions.d0,
              duration: const Duration(milliseconds: AppDimensions.int500),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadiusGeometry.circular(
                    AppDimensions.d50,
                  ),
                  color: AppColors.cardBackground,
                ),
                height: AppDimensions.d40,
                width: AppDimensions.d40,
                child: Center(child: Icon(Icons.settings)),
              ),
            );
          },
        ),
      ],
    );
  }

  ///background color part
  Widget _backgroundGradientColor() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.accentYellow.withValues(alpha: AppDimensions.d02),
            AppColors.backgroundGradientStart,
            AppColors.backgroundGradientEnd,
            Colors.black87,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
