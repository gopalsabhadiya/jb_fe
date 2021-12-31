import 'package:flutter/cupertino.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppTextMarquee extends StatefulWidget {
  final AppText _child;
  final Axis _direction;
  final Duration _animationDuration, _backDuration, _pauseDuration;
  const AppTextMarquee({
    Key? key,
    required child,
    direction = Axis.horizontal,
    animationDuration = const Duration(milliseconds: 1000),
    backDuration = const Duration(milliseconds: 8),
    pauseDuration = const Duration(milliseconds: 8),
  })  : _child = child,
        _direction = direction,
        _animationDuration = animationDuration,
        _backDuration = backDuration,
        _pauseDuration = pauseDuration,
        super(key: key);

  @override
  State<AppTextMarquee> createState() => _AppTextMarqueeState();
}

class _AppTextMarqueeState extends State<AppTextMarquee> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 50.0);
    WidgetsBinding.instance!.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget._child,
      scrollDirection: widget._direction,
      controller: _scrollController,
    );
  }

  void scroll(_) async {
    while (_scrollController.hasClients) {
      await Future.delayed(widget._pauseDuration);
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: widget._animationDuration,
          curve: Curves.ease,
        );
      }
      await Future.delayed(widget._pauseDuration);
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          0.0,
          duration: widget._backDuration,
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
