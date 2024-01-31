import 'package:share_plus/share_plus.dart';

Future<void> shareFunction() async {
  try {
    await Share.share("Text");
  } catch (error) {
    print(error);
  }
}
