import 'package:e_mart_seller/const/const.dart';

Widget customButton(
    {required String title,
    Color color = purpleColor,
    required VoidCallback onPressed,isLoading}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(13.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: isLoading
        ? "Loading..".text.white.bold.make()
        : normalText(text: title, size: 16),
  );
}
