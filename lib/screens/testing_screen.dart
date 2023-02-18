import 'package:event/utils/common_imports.dart';

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SvgPicture.asset(
          'assets/icons/Heart.svg',
          height: 43,
        ),
      ),
    );
  }
}
