import 'package:firestore/import.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.onPress,
    this.paddingVertical,
    this.paddingHoriontal,
    required this.title,
    this.size,
    this.marginVertical,
    this.marginHoriontal,
  });

  final Function() onPress;
  final double? paddingVertical;
  final double? paddingHoriontal;
  final String title;
  final double? size;
  final double? marginVertical;
  final double? marginHoriontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: marginHoriontal ?? 20,
        vertical: marginVertical ?? 0,
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: kPrimaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: paddingHoriontal ?? 20,
            vertical: paddingVertical ?? 16,
          ),
        ),
        onPressed: onPress,
        child: Text(
          title,
          style: textSize18.copyWith(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
