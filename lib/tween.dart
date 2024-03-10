import 'package:flutter/material.dart';

class TweenTransform extends StatefulWidget {
  const TweenTransform({super.key});

  @override
  State<TweenTransform> createState() => _TweenTransformState();
}

class _TweenTransformState extends State<TweenTransform> {
  final Tween<double> _tween = Tween<double>(begin: 0, end: 10);

  @override
  Widget build(BuildContext context) {
    // Manually calculate some interpolated values
    double valueAt25 =
        _tween.transform(0.25); // 25% of the way through the tween
    double valueAt50 =
        _tween.transform(0.5); // 50% of the way through the tween
    double valueAt75 =
        _tween.transform(0.75); // 75% of the way through the tween

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Transform.scale(
            scale: valueAt25,
            child: Text(
              'Value at 25%: $valueAt25',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Transform.scale(
            scale: valueAt50,
            child: Text(
              'Value at 50%: $valueAt50',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Transform.scale(
            scale: valueAt75,
            child: Text(
              'Value at 75%: $valueAt75',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class TweenEvaluate extends StatefulWidget {
  const TweenEvaluate({super.key});

  @override
  State<TweenEvaluate> createState() => _TweenEvaluateState();
}

class _TweenEvaluateState extends State<TweenEvaluate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _tween = Tween<double>(begin: 0, end: 100);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 5), () {
        _controller.reverse();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tween Evaluate Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            return Text(
              'Tween value: ${_tween.evaluate(_animation)}',
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChainTween extends StatefulWidget {
  const ChainTween({super.key});

  @override
  State<ChainTween> createState() => _ChainTweenState();
}

class _ChainTweenState extends State<ChainTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5)
        .chain(CurveTween(curve: Curves.bounceOut))
        .animate(_controller);

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);

    // Add listener to rebuild the widget when the animation value changes
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Animation Demo'),
      ),
      body: Center(
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 100,
            height: 150,
            color: _colorAnimation.value,
            child: const Icon(Icons.book, size: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/*
In this example, we first create an AnimationController called _controller.
We define an original Tween, ColorTween, that interpolates from red to blue.
We then use ReverseTween to reverse the effect of the ColorTween. This means the animation will actually run from blue to red.
The AnimatedBuilder is used to rebuild the widget tree whenever the animation value changes. It applies the current color value (from blue to red) to the container.
We start the animation using _controller.forward(). Despite the forward direction, the color transition will run in reverse due to the ReverseTween.

*/

class ReversingTween extends StatefulWidget {
  const ReversingTween({super.key});

  @override
  State<ReversingTween> createState() => _ReversingTweenState();
}

class _ReversingTweenState extends State<ReversingTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Original Tween
    ColorTween originalTween = ColorTween(begin: Colors.red, end: Colors.blue);

    // Reverse Tween
    _colorAnimation = ReverseTween(originalTween).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ReverseTween Demo'),
          ),
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              color: _colorAnimation.value,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SizingTween extends StatefulWidget {
  const SizingTween({super.key});

  @override
  State<SizingTween> createState() => _SizingTweenState();
}

class _SizingTweenState extends State<SizingTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size?> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the SizeTween
    _sizeAnimation = SizeTween(
      begin: const Size(100, 100),
      end: const Size(200, 200),
    ).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SizeTween Demo'),
          ),
          body: Center(
            child: Container(
              width: _sizeAnimation.value?.width ?? 0,
              height: _sizeAnimation.value?.height ?? 0,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RectangeTween extends StatefulWidget {
  const RectangeTween({super.key});

  @override
  State<RectangeTween> createState() => _RectangeTweenState();
}

class _RectangeTweenState extends State<RectangeTween>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Rect?> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = RectTween(
      begin: const Rect.fromLTWH(0, 0, 0, 0),
      end: const Rect.fromLTWH(200, 200, 400, 200),
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final rect = _animation.value;
        return Scaffold(
          appBar: AppBar(
            title: const Text('RectTween Demo'),
          ),
          body: Container(
            width: rect?.width ?? 0,
            height: rect?.height ?? 0,
            color: Colors.blue,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ConstantTweenAnimation extends StatefulWidget {
  const ConstantTweenAnimation({super.key});

  @override
  ConstantTweenAnimationState createState() => ConstantTweenAnimationState();
}

class ConstantTweenAnimationState extends State<ConstantTweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation;
  late Animation<double> _yAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Tween for animating the x position
    _xAnimation = Tween<double>(begin: 0, end: 200).animate(_controller);

    // ConstantTween to keep the y position constant
    _yAnimation = ConstantTween<double>(100).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ConstantTween Demo')),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_xAnimation.value, _yAnimation.value),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class IntegerTween extends StatefulWidget {
  const IntegerTween({super.key});

  @override
  State<IntegerTween> createState() => _IntegerTweenState();
}

class _IntegerTweenState extends State<IntegerTween>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    animation = IntTween(begin: 0, end: 100).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Center(
            child: Text(
              "${animation.value}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class StepCounterAnimation extends StatefulWidget {
  const StepCounterAnimation({super.key});

  @override
  StepCounterAnimationState createState() => StepCounterAnimationState();
}

class StepCounterAnimationState extends State<StepCounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // Duration of the animation
      vsync: this,
    );

    // Define the StepTween
    _animation = StepTween(
      begin: 0, // Starting value
      end: 100, // Ending value
    ).animate(_controller)
      ..addListener(() {
        setState(() {}); // Trigger rebuild with the updated animation value
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _animation.value.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CombinedTweensAnimation extends StatefulWidget {
  const CombinedTweensAnimation({super.key});

  @override
  CombinedTweensAnimationState createState() => CombinedTweensAnimationState();
}

class CombinedTweensAnimationState extends State<CombinedTweensAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Color tween: Animate color from red to blue.
    _colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller);

    // Opacity tween: Animate opacity from 0.0 (invisible) to 1.0 (fully visible).
    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Position tween: Animate movement along the x-axis.
    _positionAnimation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(200, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _positionAnimation.value,
            child: Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                width: 100,
                height: 100,
                color: _colorAnimation.value,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StaggeredAnimationDemo extends StatefulWidget {
  const StaggeredAnimationDemo({super.key});

  @override
  StaggeredAnimationDemoState createState() => StaggeredAnimationDemoState();
}

class StaggeredAnimationDemoState extends State<StaggeredAnimationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Width animation (0s to 1s)
    _widthAnimation = Tween<double>(begin: 50, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeInOut),
      ),
    );

    // Color animation (1.5s to 2.5s)
    _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.375, 0.625, curve: Curves.easeInOut),
      ),
    );

    // Position animation (3s to 4s)
    _positionAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.5, 0))
            .animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(
                left: _positionAnimation.value.dx *
                    100), // Moving position based on animation
            child: Container(
              width: _widthAnimation.value,
              height: 100,
              color: _colorAnimation.value,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
