import 'package:flutter/material.dart';

class UIHelper {
  static double bigPadding(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 16;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 14;
    } else {
      return 12;
    }
  }

  static double mediumPadding(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 10;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 8;
    } else {
      return 6;
    }
  }

  static double smallPadding(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 6;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 4;
    } else {
      return 2;
    }
  }

  static double extraBigSpacing(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 32;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 28;
    } else {
      return 24;
    }
  }

  static double bigSpacing(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 24;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 21;
    } else {
      return 18;
    }
  }

  static double mediumSpacing(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 16;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 14;
    } else {
      return 12;
    }
  }

  static double smallSpacing(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 10;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 8;
    } else {
      return 6;
    }
  }

  static double extraSmallSpacing(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    if (originalScreenHeight > 800) {
      return 4;
    } else if (800 >= originalScreenHeight && originalScreenHeight > 650) {
      return 3;
    } else {
      return 2;
    }
  }

  static double deviceHeight(BuildContext context) {
    double originalScreenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top);

    return originalScreenHeight;
  }

  static double deviceWidth(BuildContext context) {
    double originalScreenWidth = MediaQuery.of(context).size.width;

    return originalScreenWidth;
  }
}
