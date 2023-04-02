import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/widgets/custom_text.dart';
import '../../business/home_cubit/quran_cubit.dart';
import '../widgets/get_juz_details_widget.dart';

class JuzDetailsScreen extends StatefulWidget {
  const JuzDetailsScreen({super.key, required this.juzNum, required this.index});
  final int juzNum;
  final int index;

  @override
  State<JuzDetailsScreen> createState() => _JuzDetailsScreenState();
}

class _JuzDetailsScreenState extends State<JuzDetailsScreen> {
  
  
  @override
  void dispose() {
    AudioPlayer().dispose();
    AudioPlayer().stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<QuranCubit>()
        ..getSurahData()
        ..getAllJuzData(widget.juzNum),
      child: Scaffold(
        appBar: AppBar(
          title: CustomText.displayMedium(
            "Juz' ${widget.juzNum}",
            context: context,
          ),
        ),
        body: GetJuzDetailsWidget(ayahIndex: widget.index),
      ),
    );
  }
}
