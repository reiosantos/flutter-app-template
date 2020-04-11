import 'package:san/src/index.dart';

class SanActionSheet extends StatelessWidget {
  ///
  /// An action sheet must have a non-null value for at least one of the
  /// following arguments: [actions], [title], [message], or [cancelButton].
  ///
  /// Generally, action sheets are used to give the user a choice between
  /// two or more choices for the current context.
  SanActionSheet({
    Key key,
    bool isAndroid,
    // For IOS
    Widget title,
    Widget message,
    List<Widget> actions,
    ScrollController messageScrollController,
    ScrollController actionScrollController,
    Widget cancelButton,
    // For android
    AnimationController animationController,
    bool enableDrag = true,
    Color backgroundColor,
    double elevation,
    ShapeBorder shape,
    Clip clipBehavior,
    @required VoidCallback onClosing,
    @required WidgetBuilder builder,
  }) {
    this.isAndroid = isAndroid;
    this.title = title;
    this.message = message;
    this.actions = actions;
    this.messageScrollController = messageScrollController;
    this.actionScrollController = actionScrollController;
    this.cancelButton = cancelButton;
    this.animationController = animationController;
    this.enableDrag = enableDrag;
    this.backgroundColor = backgroundColor;
    this.elevation = elevation;
    this.shape = shape;
    this.clipBehavior = clipBehavior;
    this.onClosing = onClosing;
    this.builder = builder;

    if (this.isAndroid) {
      assert(enableDrag != null);
      assert(onClosing != null);
      assert(builder != null);
      assert(elevation == null || elevation >= 0.0);
    } else {
      assert(
          actions != null ||
              title != null ||
              message != null ||
              cancelButton != null,
          'An action sheet must have a non-null value for at least one of the following arguments: '
          'actions, title, message, or cancelButton');
    }
//    super(key: key);
  }

  bool isAndroid;

  // IOS
  /// An optional title of the action sheet. When the [message] is non-null,
  /// the font of the [title] is bold.
  ///
  /// Typically a [Text] widget.
  Widget title;

  /// An optional descriptive message that provides more details about the
  /// reason for the alert.
  ///
  /// Typically a [Text] widget.
  Widget message;

  /// The set of actions that are displayed for the user to select.
  ///
  /// Typically this is a list of [CupertinoActionSheetAction] widgets.
  List<Widget> actions;

  /// A scroll controller that can be used to control the scrolling of the
  /// [message] in the action sheet.
  ///
  /// This attribute is typically not needed, as alert messages should be
  /// short.
  ScrollController messageScrollController;

  /// A scroll controller that can be used to control the scrolling of the
  /// [actions] in the action sheet.
  ///
  /// This attribute is typically not needed.
  ScrollController actionScrollController;

  /// The optional cancel button that is grouped separately from the other
  /// actions.
  ///
  /// Typically this is an [CupertinoActionSheetAction] widget.
  Widget cancelButton;

  // ANDROID
  /// The animation controller that controls the bottom sheet's entrance and
  /// exit animations.
  ///
  /// The BottomSheet widget will manipulate the position of this animation, it
  /// is not just a passive observer.
  AnimationController animationController;

  /// Called when the bottom sheet begins to close.
  ///
  /// A bottom sheet might be prevented from closing (e.g., by user
  /// interaction) even after this callback is called. For this reason, this
  /// callback might be call multiple times for a given bottom sheet.
  VoidCallback onClosing;

  /// A builder for the contents of the sheet.
  ///
  /// The bottom sheet will wrap the widget produced by this builder in a
  /// [Material] widget.
  WidgetBuilder builder;

  /// If true, the bottom sheet can be dragged up and down and dismissed by
  /// swiping downwards.
  ///
  /// Default is true.
  bool enableDrag;

  /// The bottom sheet's background color.
  ///
  /// Defines the bottom sheet's [Material.color].
  ///
  /// Defaults to null and falls back to [Material]'s default.
  Color backgroundColor;

  /// The z-coordinate at which to place this material relative to its parent.
  ///
  /// This controls the size of the shadow below the material.
  ///
  /// Defaults to 0. The value is non-negative.
  double elevation;

  /// The shape of the bottom sheet.
  ///
  /// Defines the bottom sheet's [Material.shape].
  ///
  /// Defaults to null and falls back to [Material]'s default.
  ShapeBorder shape;

  /// {@macro flutter.widgets.Clip}
  ///
  /// Defines the bottom sheet's [Material.clipBehavior].
  ///
  /// Use this property to enable clipping of content when the bottom sheet has
  /// a custom [shape] and the content can extend past this shape. For example,
  /// a bottom sheet with rounded corners and an edge-to-edge [Image] at the
  /// top.
  ///
  /// If this property is null then [ThemeData.bottomSheetTheme.clipBehavior] is
  /// used. If that's null then the behavior will be [Clip.none].
  Clip clipBehavior;

  Widget _ios() {
    return CupertinoActionSheet(
      key: key,
      title: title,
      message: message,
      actions: actions,
      messageScrollController: messageScrollController,
      actionScrollController: actionScrollController,
      cancelButton: cancelButton,
    );
  }

  Widget _android() {
    return BottomSheet(
        key: key,
        animationController: animationController,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        onClosing: onClosing,
        builder: builder);
  }

  Widget _web() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _ios();
    }
    if (Platform.isAndroid) {
      return _android();
    }
    return _web();
  }
}
