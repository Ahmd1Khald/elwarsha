import 'package:flutter/material.dart';

class BuildMoreItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const BuildMoreItem({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                const Icon(Icons.car_crash_sharp, color: Colors.grey),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}