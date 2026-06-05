import 'package:flutter/material.dart';

class OnboardingStateNotifier extends ChangeNotifier {
  bool _animateWalletIcon = false; //step1
  bool _isLottieAnimation = false; //step2
  bool _isWalletShiftedDown = false; //step3
  bool _justAfterWalletShiftedDown = false; //step4
  bool _isWalletSquashed = false; //step5
  bool _topAnimationCompletion = false; //step6  & //step7
  bool _animateText = false; //step6
  bool _showCard1 = false; //step8
  bool _showCard2 = false; //step8
  bool _showCard3 = false; //step8
  bool _animateFooter = false;
  bool _settingIconAppear = false;
  double _squashX = 1.0;
  double _squashY = 1.0;

  bool get animateWalletIcon => _animateWalletIcon;

  bool get topAnimationCompletion => _topAnimationCompletion;

  bool get isWalletShiftedDown => _isWalletShiftedDown;

  bool get justAfterWalletShiftedDown => _justAfterWalletShiftedDown;

  bool get isWalletSquashed => _isWalletSquashed;

  bool get animateText => _animateText;

  bool get showCard1 => _showCard1;

  bool get showCard2 => _showCard2;

  bool get showCard3 => _showCard3;

  bool get animateFooter => _animateFooter;

  bool get settingIconAppear => _settingIconAppear;

  bool get isLottieAnimation => _isLottieAnimation;

  double get squashX => _squashX;

  double get squashY => _squashY;

  Future<void> onSplashStart() async {
    /// step1.
    await Future.delayed(const Duration(milliseconds: 300));
    _animateWalletIcon = true;
    notifyListeners();

    ///step2.
    await Future.delayed(const Duration(milliseconds: 700));
    _isLottieAnimation = true;
    notifyListeners();

    ///step3.
    await Future.delayed(const Duration(milliseconds: 800));
    _isWalletShiftedDown = true;
    notifyListeners();

    ///step4.
    await Future.delayed(const Duration(milliseconds: 500));
    _justAfterWalletShiftedDown = true;
    notifyListeners();

    ///step4.1.
    await Future.delayed(const Duration(milliseconds: 100));
    _squashX = 1;
    _squashY = 0.8;
    notifyListeners();

    ///step4.2.
    await Future.delayed(const Duration(milliseconds: 100));
    _squashX = 1.0;
    _squashY = 1.0;
    notifyListeners();

    ///step5.
    await Future.delayed(const Duration(seconds: 2));
    _isWalletSquashed = true;
    notifyListeners();

    ///step6.
    await Future.delayed(const Duration(milliseconds: 800));
    _animateText = true;
    notifyListeners();

    ///step 7. top animation completion
    await Future.delayed(const Duration(seconds: 2));
    _topAnimationCompletion = true;
    notifyListeners();

    ///step8.1.
    await Future.delayed(const Duration(milliseconds: 800));
    _showCard1 = true;
    notifyListeners();

    ///step8.2.
    await Future.delayed(const Duration(milliseconds: 180));
    _showCard2 = true;
    notifyListeners();

    ///step8.3.
    await Future.delayed(const Duration(milliseconds: 180));
    _showCard3 = true;
    notifyListeners();

    ///step 9.
    await Future.delayed(const Duration(milliseconds: 400));
    _animateFooter = true;
    notifyListeners();

    ///step10.
    await Future.delayed(const Duration(milliseconds: 400));
    _settingIconAppear = true;
    notifyListeners();
  }
}
