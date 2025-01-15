import '../../../export.dart';

class Common {
  const Common._();

  static Row palletTimeRow({String time = "08:00 AM", String type = "L"}) {
    return Row(
      children: [
        Common.sideOrangePallet(),
        const SizedBox(width: 15),
        RichText(
          text: TextSpan(
            text: time.split(" ").first,
            style: h1StyleBlack.copyWith(fontSize: 18),
            children: [
              TextSpan(
                text: ' AM',
                style: h1StyleBlack.copyWith(
                    fontSize: 18, color: AppColor.lightGrey),
              )
            ],
          ),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            text: type == 'P' ? '100' : '50',
            style: bodyStyle2Grey.copyWith(fontSize: 18),
            children: [
              TextSpan(
                text: ' min',
                style: bodyStyle2Grey.copyWith(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }

  static Container sideOrangePallet() {
    return Container(
      height: 10,
      width: 15,
      decoration: const BoxDecoration(
        color: AppColor.lightOrange,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    );
  }

  static Container rightSideOrangePallet() {
    return Container(
      height: 10,
      width: 15,
      decoration: const BoxDecoration(
        color: AppColor.lightOrange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
    );
  }
}
