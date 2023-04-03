import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sysmanagment/shared.dart';

class SnackMessager {
  static showMessage(BuildContext context, MessageType type, String message,
      {String? title}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 90,
              decoration: BoxDecoration(
                color: type == MessageType.ERROR
                    ? Color(0xFFC72C41)
                    : AppColors.bluedownswatch,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title ?? 'System Managment',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          message,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  'assets/icons/bubbles.svg',
                  height: 48,
                  width: 40,
                  color: type == MessageType.ERROR
                      ? Color(0xFF801336)
                      : AppColors.bluedark,
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/fail.svg',
                    height: 40,
                    color: type == MessageType.ERROR
                        ? Color(0xFF801336)
                        : AppColors.bluedark,
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      'assets/icons/close.svg',
                      height: 16,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum MessageType {
  ERROR,
  SUCESSULL,
  REJECTED,
}
