import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  final Function() onTap;

  const HeartButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);

    _colorAnimation = ColorTween(
      begin: Color.fromARGB(255, 240, 214, 214),
      end: Colors.red,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });

        if (widget.onTap != null) {
          widget.onTap(); // Call the provided onTap function
        }

        if (isLiked) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) => Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 45,
          ),
        ),
      ),
    );
  }
}
