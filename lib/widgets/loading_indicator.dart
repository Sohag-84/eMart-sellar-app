import 'package:e_mart_seller/const/const.dart';

Widget loadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(red),
    ),
  );
}
