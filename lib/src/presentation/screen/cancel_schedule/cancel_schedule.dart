import '../../../../export.dart';

class CancelSchedule extends StatefulWidget {
  const CancelSchedule({super.key});

  @override
  State<CancelSchedule> createState() => _CancelScheduleState();
}

class _CancelScheduleState extends State<CancelSchedule> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: AppBarBackButton(),
        ),
      ),
      body: const Column(
        children: [
          ScheduleCard3(),
          MessageAndSubmit(),
        ],
      ),
    );
  }
}

class MessageAndSubmit extends StatelessWidget {
  const MessageAndSubmit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppData.msg,
            style: bodyStyle2.copyWith(fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 100,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColor.lightGrey,
                width: 2.0,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.message_outlined,
                  color: AppColor.lightBlue,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'The Lecutre',
                      style: bodyStyle2Grey.copyWith(fontSize: 16),
                      children: [
                        TextSpan(
                          text:
                              ' Computer Architecture and Organization (UCS415)',
                          style: bodyStyle2.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: ' scheduled for ',
                          style: bodyStyle2Grey.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: 'Jul 11, 2024 ',
                          style: bodyStyle2.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: 'at ',
                          style: bodyStyle2Grey.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: '08:00 AM ',
                          style: bodyStyle2.copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: 'has been cancelled.',
                          style: bodyStyle2Grey.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          LightBlueTextButton(
            onpressed: () {},
            text: 'Confirm Cancel',
          ),
        ],
      ),
    );
  }
}
