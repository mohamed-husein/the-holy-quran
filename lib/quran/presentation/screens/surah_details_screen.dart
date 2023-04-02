import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/home_cubit/quran_cubit.dart';
import '../widgets/get_ayats_widget.dart';

class SurahDetailsScreen extends StatelessWidget {
  const SurahDetailsScreen({super.key, required this.surahName,required this.surahNo,required this.index});
  final int surahNo;
  final int index;
  final String surahName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuranCubit>()
        ..getSurahDetailsData(surahNo)
        ..getBookmark(),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText.displayMedium(
            surahName,
            context: context,
          ),
        ),
        body:  GetAyatsWidget(index: index),
      ),
    );
  }

 
}
