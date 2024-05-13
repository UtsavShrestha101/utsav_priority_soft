import 'package:flutter/widgets.dart';
import 'package:myapp/core/extensions/context_extension.dart';


// alert tile for showing empty
class EmptyAlertTile extends StatelessWidget {
  final String msg;
  const EmptyAlertTile({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Text(
            msg,
            style: context.headline600,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
