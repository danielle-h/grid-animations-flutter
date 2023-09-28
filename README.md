# gridview_transitions

Example illustrating the use of Hero, AnimatedPositioned and Flow widgets to animate transition of widgets in a grid.

Sometimes, you need to transition between two different kinds of grids in your app. For example, you have a grid of images and the user wants to see only the user’s favorites. Some widgets may stay the same, while others change. How can you animate this transition, making existing widgets smoothly move and resize within the grid?

In depth step by step explanations in [Medium](https://dsavir-h.medium.com/animating-widgets-in-flutter-grids-69fecd17ad68)

## Files

In `lib` folder:

- `none` shows hte two grids without animation
- `hero` shows how to animate the transition using the [Hero](https://api.flutter.dev/flutter/widgets/Hero-class.html) widget
- `animated` shows how to animate the transition using [AnimatedPositioned](https://api.flutter.dev/flutter/widgets/AnimatedPositioned-class.html) widget
- `flow` shows how to animate the transition using the [Flow](https://api.flutter.dev/flutter/widgets/Flow-class.html) widget
- `widgets` has the item shown in all grids
- `main.dart` is a page showing buttons to go to each option.

## Issues

If you found a bug, please [open an issue](https://github.com/danielle-h/grid-animations-flutter/issues)

## Contribute

Do you have other cool animation options? Feel free to submit a pull request
