import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/constants/shared_preference_constant.dart';
import 'package:flutter_practice/src/core/services/shared_preference_service.dart';
import 'package:flutter_practice/src/features/flutter_show_case_view/widgets/show_case_widget.dart';
import 'package:showcaseview/showcaseview.dart';

class FlutterShowCaseView extends StatefulWidget {
  const FlutterShowCaseView({super.key, required this.title});

  final String title;

  @override
  State<FlutterShowCaseView> createState() => _FlutterShowCaseViewState();
}

class _FlutterShowCaseViewState extends State<FlutterShowCaseView> {
  final GlobalKey globalKeyOne = GlobalKey();
  final GlobalKey globalKeyTwo = GlobalKey();
  final GlobalKey globalKeyThree = GlobalKey();
  final GlobalKey globalKeyFour = GlobalKey();
  bool? isFirstTimeView;

  @override
  void initState() {
    super.initState();
    _initShowCaseWidget();
  }

  void _initShowCaseWidget() async{
    isFirstTimeView = await SharedPreferencesService.singleton.getValue(
      SharedPreferenceConstant.viewFlutterShowCaseViewFirstTime,
      false,
    );

    if(isFirstTimeView ?? true) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context).startShowCase([
        globalKeyOne,
        globalKeyTwo,
        globalKeyThree,
        globalKeyFour,
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SharedPreferencesService.singleton.saveValue(
      SharedPreferenceConstant.viewFlutterShowCaseViewFirstTime,
      true,
      (_) => {},
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: ShowCaseView(
          globalKey: globalKeyOne,
          title: 'Title',
          description: 'This is page title',
          child: Text(widget.title),
        ),
        actions: [
          ShowCaseView(
            globalKey: globalKeyTwo,
            title: 'Info action button',
            description: 'This is info action button for display information',
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info),
            ),
          ),
        ],
      ),
      body: Center(
        child: ShowCaseView(
          globalKey: globalKeyThree,
          title: 'Normal text',
          description: 'This is normal text for show information',
          child: Text(widget.title),
        ),
      ),
      floatingActionButton: ShowCaseView(
        globalKey: globalKeyFour,
        title: 'Floating action button',
        description: 'This is floating action button for user interaction',
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
