import 'package:flutter/material.dart';
import 'package:flutter_practice/src/core/styles/app_colors.dart';
import 'package:flutter_practice/src/features/multi_tap_detector/widgets/multi_tap_detector.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MultiTapDetectorPage extends StatefulWidget {
  const MultiTapDetectorPage({super.key, required this.title});

  final String title;

  @override
  State<MultiTapDetectorPage> createState() => _MultiTapDetectorPageState();
}

class _MultiTapDetectorPageState extends State<MultiTapDetectorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildMultiTapDetector(
              onTap: (){
                Fluttertoast.showToast(
                  msg: "Single trap button is working",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              title: 'Single tap Button (1)',
              taps: 1,
            ),
            const SizedBox(height: 20),
            _buildMultiTapDetector(
              onTap: (){
                Fluttertoast.showToast(
                  msg: "Double trap button is working",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              title: 'Double tap Button (2)',
              taps: 2,
            ),
            const SizedBox(height: 20),
            _buildMultiTapDetector(
              onTap: (){
                Fluttertoast.showToast(
                  msg: "Triple trap button is working",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              title: 'Triple tap Button (3)',
              taps: 3,
            ),
            const SizedBox(height: 20),
            _buildMultiTapDetector(
              onTap: (){
                Fluttertoast.showToast(
                  msg: "Quadruple trap button is working",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              title: 'Quadruple tap Button (4)',
              taps: 4,
            ),
            const SizedBox(height: 20),
            _buildMultiTapDetector(
              onTap: (){
                Fluttertoast.showToast(
                  msg: "Quintuple trap button is working",
                  toastLength: Toast.LENGTH_SHORT,
                );
              },
              title: 'Quintuple tap Button (5)',
              taps: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiTapDetector({
    required VoidCallback onTap,
    required String title,
    required int taps,
  }) {
    return MultiTapDetector(
      onMultiTap: onTap,
      taps: taps,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width/1.8,
        decoration: BoxDecoration(
          color: AppColors.deepPurple,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
