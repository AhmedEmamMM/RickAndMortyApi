import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8.h, 8.h, 8.h, 8.h),
      padding: EdgeInsets.all(4.h),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          charactersDetailsScreen,
          arguments: character,
        ),
        child: GridTile(
          footer: Hero(
            tag: character.charID,
            child: Container(
              color: Colors.black54,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 15.h,
                vertical: 10.h,
              ),
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: TextStyle(
                  height: 1.3.h,
                  fontSize: 16.sp,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.image.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: 'assets/animations/LoadingGIF.gif',
                    image: character.image,
                    fit: BoxFit.cover,
                  )
                : Lottie.asset('assets/animations/Loading.json'),
          ),
        ),
      ),
    );
  }
}
