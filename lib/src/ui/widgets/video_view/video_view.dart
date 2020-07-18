import 'package:san/src/index.dart';

// TODO(reiosantos): implement thumbnails for the video player
class VideoView extends StatefulWidget {
  final String dataSource;
  final bool looping;
  final bool autoPlay;

  VideoView(
    this.dataSource, {
    this.autoPlay = false,
    this.looping = false,
    Key key,
  }) : super(key: key);

  @override
  _VideoView createState() => _VideoView();
}

class _VideoView extends State<VideoView> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  bool isWakeLockEnabled = false;
  bool isPlaying = false;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.dataSource);
    _videoPlayerController.addListener(_videoPlayerListener);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      allowedScreenSleep: false,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      autoInitialize: true,
    );
    _chewieController.addListener(_chewieListener);

    super.initState();
  }

  void _videoPlayerListener() {
    if (_chewieController != null &&
        _chewieController.videoPlayerController.value.isPlaying &&
        !isWakeLockEnabled) {
      _wakeLock();
    }
  }

  void _chewieListener() {
    if (_chewieController.isFullScreen) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }

  void _wakeLock() async {
    isWakeLockEnabled = await Wakelock.isEnabled;
    if (!isWakeLockEnabled) {
      await Wakelock.enable();
    }
  }

  void _disableWakeLock() {
    if (isWakeLockEnabled) {
      Wakelock.disable();
    }
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_videoPlayerListener);
    _videoPlayerController.dispose();

    _chewieController.removeListener(_chewieListener);
    _chewieController.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _disableWakeLock();
    super.dispose();
  }

  @override
  void deactivate() {
    _disableWakeLock();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: AspectRatio(
            aspectRatio: _chewieController.aspectRatio,
            child: Chewie(controller: _chewieController),
          ),
        ),
      ],
    );
  }
}
