import 'package:flutter/material.dart';

const List workouts = [
  ["Gym", Color(0xffFFE8BF), "assets/images/day50/gym.png"],
  ["Football", Color(0xffC3C0FF), "assets/images/day50/football.png"],
  ["Tennis", Color(0xffF4F3F4), "assets/images/day50/tennis.png"],
  ["Running", Color(0xffFFCBFB), "assets/images/day50/running.png"],
];

class WorkoutsWidget extends StatelessWidget {
  const WorkoutsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListView.separated(
        itemCount: workouts.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) => _buildWiget(workout: workouts[index]),
      ),
    );
  }

  _buildWiget({required List workout}) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        workout[0],
        style: const TextStyle(color: Colors.black87, fontSize: 20),
      ),
      trailing: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[700]!),
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.grey[900],
          size: 18,
        )),
      ),
      leading: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: workout[1],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(workout[2], width: 25, height: 25),
      ),
    );
  }
}
