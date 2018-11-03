part of mdc_web;

/// A set of [MDCChip]s that controls how they interact.
///
/// Javascript: `mdc.chips.MDCChipSet`.
///
/// * [Design Guidelines](https://material.io/go/design-chips)
/// * [Component Reference](https://material.io/develop/web/components/chips/#mdcchip-and-mdcchipset-properties-and-methods)
/// * [Demo](https://material-components.github.io/material-components-web-catalog/#/component/chips)
/// * [Source Code](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips/chip-set/index.js)
class MDCChipSet extends MDCComponent {
  static MDCChipSet attachTo(Element root) => MDCChipSet._attach(root);
  MDCChipSet._attach(Element root) : _js = _ChipSet.attachTo(root);

  MDCChipSet(Element root, [foundation, args])
      : _js = _preserveUndefined(root, foundation, args);

  static _ChipSet _preserveUndefined(Element root, foundation, args) =>
      foundation == null
          ? _ChipSet(root)
          : args == null
              ? _ChipSet(root, foundation)
              : _ChipSet(root, foundation, args);
  @override
  _ChipSet get js => _js;
  final _ChipSet _js;

  List<MDCChip> get chips =>
      List<_Chip>.from(js.chips).map((chip) => MDCChip._(chip)).toList();

  void addChip(Element chipEl, [bool appendToRoot = false]) {
    js.addChip(chipEl);
    if (appendToRoot) root_.append(chipEl);
  }

  List<int> getSelectedChipIds() => List.from(js.getSelectedChipIds());
}

@JS('chips.MDCChipSet')
abstract class _ChipSet extends _Component {
  external static _ChipSet attachTo(Element root);
  external factory _ChipSet(Element root, [foundation, args]);

  external List get chips;

  external void addChip(Element chipEl);
  external List getSelectedChipIds();
}

/// Encompasses the behavior of a single chip. All of MDCChip’s emitted events
/// bubble up through the DOM.
///
/// Javascript: `mdc.chips.MDCChip`.
///
/// * [Design Guidelines](https://material.io/go/design-chips)
/// * [Component Reference](https://material.io/develop/web/components/chips/#mdcchip-and-mdcchipset-properties-and-methods)
/// * [Demo](https://material-components.github.io/material-components-web-catalog/#/component/chips)
/// * [Source Code](https://github.com/material-components/material-components-web/tree/master/packages/mdc-chips/chip/index.js)
class MDCChip extends MDCComponent {
  static MDCChip attachTo(Element root) => MDCChip._attach(root);
  MDCChip._attach(Element root) : _js = _Chip.attachTo(root);
  MDCChip._(this._js);

  MDCChip(Element root, [foundation, args])
      : _js = _preserveUndefined(root, foundation, args);

  static _Chip _preserveUndefined(Element root, foundation, args) =>
      foundation == null
          ? _Chip(root)
          : args == null
              ? _Chip(root, foundation)
              : _Chip(root, foundation, args);

  _Chip get js => _js;
  final _Chip _js;

  /// This will be the same as the id attribute on the root element. If an id is
  /// not provided, a unique one will be generated.
  String get id => js.id;
  bool get selected => js.selected;
  void set selected(bool value) => js.selected = value;
  bool get shouldRemoveOnTrailingIconClick =>
      js.shouldRemoveOnTrailingIconClick;
  void set shouldRemoveOnTrailingIconClick(bool value) =>
      js.shouldRemoveOnTrailingIconClick = value;
  MDCRipple get ripple => MDCRipple._(js.ripple);

  /// If [shouldRemoveOnTrailingIconClick] is set to false, you must manually
  /// call beginExit() on the chip to remove it.
  void beginExit() => js.beginExit();

  /// Indicates the chip was interacted with (via click/tap or Enter key).
  ///
  /// `event.detail` contents: {chipId: string}
  static const interactionEvent = 'MDCChip:interaction';

  /// Indicates the chip’s selection state has changed (for choice/filter chips).
  ///
  /// `event.detail` contents: {chipId: string, selected: boolean}
  static const selectionEvent = 'MDCChip:selection';

  /// Indicates the chip is ready to be removed from the DOM.
  ///
  /// `event.detail` contents: {chipId: string, root: Element}
  static const removalEvent = 'MDCChip:removal';

  /// Indicates the chip’s trailing icon was interacted with (via click/tap or
  /// Enter key).
  ///
  /// `event.detail` contents: {chipId: string}
  static const trailingIconInteractionEvent = 'MDCChip:trailingIconInteraction';
}

@JS('chips.MDCChip')
abstract class _Chip extends _Component {
  external static _Chip attachTo(Element root);
  external factory _Chip(Element root, [foundation, args]);

  /// This will be the same as the id attribute on the root element. If an id is
  /// not provided, a unique one will be generated.
  external String get id;
  bool selected;
  bool shouldRemoveOnTrailingIconClick;
  external _Ripple get ripple;

  /// If [shouldRemoveOnTrailingIconClick] is set to false, you must manually
  /// call beginExit() on the chip to remove it.
  external void beginExit();
}
