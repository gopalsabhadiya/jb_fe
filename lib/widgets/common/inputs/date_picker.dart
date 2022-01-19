import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDatePicker extends StatefulWidget {
  final TextEditingController? _textEditingController;
  final DateTime? _initialValue;
  final void Function(DateTime) _onSetValue;
  final IconData _prefixIcon;
  final String _hint;
  final String? Function(String?)? _validator;

  const AppDatePicker({
    Key? key,
    DateTime? initialValue,
    required IconData prefixIcon,
    TextEditingController? textEditingController,
    required void Function(DateTime) onSetValue,
    required String hint,
    String? Function(String?)? validator,
  })  : _initialValue = initialValue,
        _onSetValue = onSetValue,
        _prefixIcon = prefixIcon,
        _textEditingController = textEditingController,
        _hint = hint,
        _validator = validator,
        super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  late final TextEditingController _textFieldController;

  late final FocusNode _focusNode;

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _textFieldController =
        widget._textEditingController ?? TextEditingController();

    if (widget._initialValue != null) {
      DateTime dateTime = widget._initialValue!;
      _textFieldController.text =
          "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}";
    } else {
      _textFieldController.text = DefaultTexts.EMPTY;
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context)!.insert(_overlayEntry);
      } else {
        _overlayEntry.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            child: SfDateRangePicker(
              backgroundColor: AppColors.blue_1,
              selectionColor: AppColors.blue_5,
              // allowViewNavigation: true,
              showNavigationArrow: true,
              onSelectionChanged: _onSubmit,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        validator: widget._validator,
        focusNode: _focusNode,
        controller: _textFieldController,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: AppColors.white,
          hoverColor: AppColors.blue_1,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red_2, width: 4),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue_5, width: 1.5),
          ),
          hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
          errorStyle: const TextStyle(fontSize: 0.001),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(1),
            child: Icon(
              widget._prefixIcon,
              color: AppColors.blue5WithOpacity(0.7),
              size: 25,
            ),
          ),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_right,
              color: AppColors.blue_5,
              size: 35,
            ),
            onPressed: _openDropdown,
          ),
          hintText: widget._hint,
        ),
      ),
    );
  }

  _onSubmit(DateRangePickerSelectionChangedArgs pickedDate) {
    DateTime dateTime = pickedDate.value as DateTime;
    _textFieldController.text =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString()}";
    widget._onSetValue(dateTime);
    _focusNode.unfocus();
  }

  void _openDropdown() {
    if (_focusNode.hasFocus && !_overlayEntry.mounted) {
      Overlay.of(context)!.insert(_overlayEntry);
    } else {
      _focusNode.requestFocus();
    }
  }
}
