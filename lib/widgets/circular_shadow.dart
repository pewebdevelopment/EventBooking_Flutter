import '../utils/common_imports.dart';

class CircularShadow extends StatelessWidget {
  const CircularShadow({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
