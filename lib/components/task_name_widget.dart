import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskNameWidget extends StatelessWidget {
  const TaskNameWidget({super.key, required this.taskName});
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Center(
        child: Text(
          taskName,
          style: GoogleFonts.poppins(
              fontSize: 10, color: Colors.white, letterSpacing: 0.5),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
