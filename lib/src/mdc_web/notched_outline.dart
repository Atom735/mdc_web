part of mdc_web;

/// The notched outline is a border around all sides of either a Text Field or
/// Select component. This is used for the Outlined variant of either a Text
/// Field or Select.
///
/// Javascript: `mdc.notchedOutline.MDCNotchedOutline`.
///
/// * [Component Reference](https://material.io/develop/web/components/input-controls/notched-outline/#mdcnotchedoutline-properties-and-methods)
/// * [Source Code](https://github.com/material-components/material-components-web/tree/master/packages/mdc-notched-outline/index.js)
class MDCNotchedOutline extends MDCComponent {
  static MDCNotchedOutline attachTo(Element root) =>
      MDCNotchedOutline._attach(root);
  MDCNotchedOutline._attach(Element root)
      : _js = _NotchedOutline.attachTo(root);

  MDCNotchedOutline(Element root, [foundation, args])
      : _js = _preserveUndefined(root, foundation, args);

  static _NotchedOutline _preserveUndefined(Element root, foundation, args) =>
      foundation == null
          ? _NotchedOutline(root)
          : args == null
              ? _NotchedOutline(root, foundation)
              : _NotchedOutline(root, foundation, args);

  _NotchedOutline get js => _js;
  final _NotchedOutline _js;

  void notch(num notchWidth, bool isRtl) => js.notch(notchWidth, isRtl);
  void closeNotch() => js.closeNotch();
}

@JS('notchedOutline.MDCNotchedOutline')
abstract class _NotchedOutline extends _Component {
  external static _NotchedOutline attachTo(Element root);
  external factory _NotchedOutline(Element root, [foundation, args]);

  external void notch(num notchWidth, bool isRtl);
  external void closeNotch();
}
