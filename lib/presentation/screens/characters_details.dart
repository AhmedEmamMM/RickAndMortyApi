import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import '../../busnices_layer/cubit/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 460.h,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp),
        ),
        background: Hero(
          tag: character.charID,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30.h,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2.h,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is LocationsLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var locations = (state).locations;
    if (locations.length != 0) {
      int randomQuoteIndex = Random().nextInt(locations.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.sp,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7.h,
                color: MyColors.myYellow,
                offset: const Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: false,
            animatedTexts: [
              FlickerAnimatedText(locations[randomQuoteIndex].id.toString()),
              FlickerAnimatedText(locations[randomQuoteIndex].name),
              FlickerAnimatedText(locations[randomQuoteIndex].type),
              FlickerAnimatedText(locations[randomQuoteIndex].dimension),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getAllLocations();
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14.h, 14.h, 14.h, 0),
                padding: EdgeInsets.all(8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterInfo('species : ', character.species),
                    buildDivider(280.w),
                    characterInfo('Status : ', character.statusIfDeadOrAlive),
                    buildDivider(290.w),
                    characterInfo('Gender : ', character.gender),
                    buildDivider(285.w),
                    characterInfo('Created : ', character.created),
                    buildDivider(285.w),
                    20.h.verticalSpace,
                    BlocBuilder<CharactersCubit, CharactersState>(
                      builder: (context, state) {
                        return checkIfQuotesAreLoaded(state);
                      },
                    ),
                  ],
                ),
              ),
              500.h.verticalSpace
            ]),
          ),
        ],
      ),
    );
  }
}
