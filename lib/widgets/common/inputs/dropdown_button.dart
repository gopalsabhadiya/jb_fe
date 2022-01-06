import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';

class AppDropDownButton extends StatefulWidget {
  final String? _initialValue;
  final IconData _prefixIcon;
  final List<String> _items;
  final void Function(String) _onSetValue;
  final String _hint;
  final String? Function(String?) _validator;
  final TextEditingController? _textEditingController;

  const AppDropDownButton({
    Key? key,
    String? initialValue,
    required IconData prefixIcon,
    required List<String> items,
    required void Function(String) onSetValue,
    required String hint,
    required String? Function(String?) validator,
    TextEditingController? textEditingController,
  })  : assert(items.length > 0),
        _initialValue = initialValue,
        _prefixIcon = prefixIcon,
        _items = items,
        _onSetValue = onSetValue,
        _hint = hint,
        _validator = validator,
        _textEditingController = textEditingController,
        super(key: key);

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  late final TextEditingController _textFieldController;
  late int _selectedIndex;

  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textFieldController =
        widget._textEditingController ?? TextEditingController();
    if (widget._initialValue != null || widget._initialValue!.isNotEmpty) {
      _selectedIndex = widget._items.indexOf(widget._initialValue!);
      _textFieldController.text = widget._initialValue!;
    } else {
      _selectedIndex = 0;
      _textFieldController.text = widget._items.first;
      widget._onSetValue(widget._items.first);
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
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget._items.length,
                shrinkWrap: true,
                itemBuilder: _getDropdownChildren,
              ),
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
        controller: _textFieldController,
        focusNode: _focusNode,
        onFieldSubmitted: _dropDownSubmitted,
        decoration: InputDecoration(
          filled: true,
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
            padding: const EdgeInsets.all(10),
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

  Widget _getDropdownChildren(BuildContext context, int index) {
    return ListTile(
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      title: AppTextBuilder(widget._items[index])
          .textAlign(TextAlign.start)
          .size(16)
          .color(_selectedIndex == index ? AppColors.grey_1 : AppColors.black)
          .build(),
      onTap: () => _onSelection(widget._items[index]),
      hoverColor: _selectedIndex == index ? AppColors.blue_5 : AppColors.blue_2,
      tileColor: _selectedIndex == index ? AppColors.blue_5 : AppColors.blue_1,
    );
  }

  _onSelection(String selectedItem) {
    _textFieldController.text = selectedItem;
    _selectedIndex = widget._items.indexOf(selectedItem);
    _focusNode.unfocus();
    widget._onSetValue(selectedItem);
  }

  void _openDropdown() {
    if (_focusNode.hasFocus && !_overlayEntry.mounted) {
      Overlay.of(context)!.insert(_overlayEntry);
    } else {
      _focusNode.requestFocus();
    }
  }

  void _dropDownSubmitted(String value) {
    print("Dropdown submitted");
    final List<String> filteredList = widget._items
        .where(
          (element) =>
              element.toLowerCase() == value.toLowerCase() ||
              element.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
        )
        .toList();
    if (filteredList.isNotEmpty) {
      _textFieldController.text = filteredList.first;
      setState(() {
        _selectedIndex = widget._items.indexOf(filteredList.first);
      });
      widget._onSetValue(filteredList.first);
    } else {
      _textFieldController.text = widget._items.first;
      setState(() {
        _selectedIndex = widget._items.indexOf(widget._items.first);
        widget._onSetValue(widget._items.first);
      });
    }
  }
}

//
// class AppDropDownButton extends StatefulWidget {
//   final String? _initialValue;
//   final IconData _prefixIcon;
//   final List<String> _items;
//   final void Function(String?) _onSetValue;
//
//   const AppDropDownButton({
//     Key? key,
//     initialValue,
//     required IconData prefixIcon,
//     List<String> items = const ["a", "b", "c", "d", "e"],
//     required void Function(String?) onSetValue,
//   })  : assert(items.length > 0),
//         _initialValue = initialValue,
//         _prefixIcon = prefixIcon,
//         _items = items,
//         _onSetValue = onSetValue,
//         super(key: key);
//
//   @override
//   State<AppDropDownButton> createState() => _AppDropDownButtonState();
// }
//
// class _AppDropDownButtonState extends State<AppDropDownButton> {
//   String dropdownValue = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: dropdownValue,
//       // icon: const Icon(Icons.arrow_downward),
//       // elevation: -70,
//       // style: const TextStyle(color: AppColors.blue_5),
//
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: <String>['One', 'Two', 'Free', 'Four']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColors.white,
//         hoverColor: AppColors.blue_1,
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.red_2, width: 4),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.red_2, width: 1.5),
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.blue_4, width: 1.5),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.blue_5, width: 1.5),
//         ),
//         hintStyle: const TextStyle(color: AppColors.grey_3, fontSize: 16),
//         errorStyle: const TextStyle(fontSize: 0.001),
//         prefixIcon: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Icon(
//             widget._prefixIcon,
//             color: AppColors.blue5WithOpacity(0.7),
//             size: 25,
//           ),
//         ),
//         suffixIcon: IconButton(
//           icon: const Icon(
//             Icons.arrow_right,
//             color: AppColors.blue_5,
//             size: 25,
//           ),
//           onPressed: () {
//             print("Open Dropdown");
//           },
//         ),
//         hintText: "DropDownMenu",
//       ),
//     );
//   }
// }
//
class AppDropDownButtonSearchable extends StatefulWidget {
  final String? _initialValue;
  final IconData _prefixIcon;
  final List<String> _items;
  final void Function(String?) _onSetValue;

  const AppDropDownButtonSearchable({
    Key? key,
    initialValue,
    required IconData prefixIcon,
    List<String> items = const ["a", "b", "c", "d", "e"],
    required void Function(String?) onSetValue,
  })  : assert(items.length > 0),
        _initialValue = initialValue,
        _prefixIcon = prefixIcon,
        _items = items,
        _onSetValue = onSetValue,
        super(key: key);

  @override
  State<AppDropDownButton> createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonSearchableState
    extends State<AppDropDownButtonSearchable> {
  late final ScrollController _scrollController;
  late final TextEditingController _textEditingController;
  late bool _showDropdown;
  late bool _isSearching;
  late String _searchText;

  @override
  void initState() {
    _scrollController = ScrollController();
    _showDropdown = false;
    _isSearching = false;
    _textEditingController = TextEditingController(text: widget._initialValue);
    _textEditingController.addListener(_handleControllerChanged);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Focus(
                onFocusChange: (isFocused) {
                  setState(() {
                    _isSearching = true;
                    _searchText = _textEditingController.text;
                    _showDropdown = isFocused;
                  });
                },
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _textEditingController,
                  //
                  // onTap: () {
                  //   setState(() {
                  //     _isSearching = true;
                  //     _searchText = _textEditingController.text;
                  //     _showDropdown = true;
                  //   });
                  // },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hoverColor: AppColors.blue_1,
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red_2, width: 4),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.red_2, width: 1.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.blue_4, width: 1.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.blue_5, width: 1.5),
                    ),
                    hintStyle:
                        const TextStyle(color: AppColors.grey_3, fontSize: 16),
                    errorStyle: const TextStyle(fontSize: 0.001),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        widget._prefixIcon,
                        color: AppColors.blue5WithOpacity(0.7),
                        size: 25,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.arrow_right,
                        color: AppColors.blue_5,
                        size: 25,
                      ),
                      onPressed: () {
                        print("Open Dropdown");
                      },
                    ),
                    hintText: "DropDownMenu",
                  ),
                  // style: textStyle,
                  textAlign: TextAlign.start,
                  autofocus: false,
                  obscureText: false,
                  // maxLengthEnforced: true,
                  maxLines: 1,
                  // validator: (String? newValue) {
                  //   if (newValue == null || newValue.isEmpty) {
                  //     return 'This field cannot be empty!';
                  //   }
                  //
                  //   //Items null check added since there could be an initial brief period of time
                  //   //when the dropdown items will not have been loaded
                  //   // if (items != null) {
                  //   //   if (strict &&
                  //   //       newValue.isNotEmpty &&
                  //   //       !items.contains(newValue))
                  //   //     return 'Invalid value in this field!';
                  //   // }
                  //
                  //   return null;
                  // },
                  onSaved: widget._onSetValue,
                  enabled: true,
                  // inputFormatters: inputFormatters,
                ),
              ),
            ),
            // IconButton(
            //   icon: Icon(Icons.close),
            //   onPressed: () {
            //     if (!enabled) return;
            //     state.clearValue();
            //   },
            // )
          ],
        ),
        !_showDropdown
            ? Container()
            : Positioned(
                child: Container(
                  alignment: Alignment.topCenter,
                  height:
                      100, //limit to default 3 items in dropdownlist view and then remaining scrolls
                  // width: MediaQuery.of(field.context).size.width,
                  child: ListView(
                    cacheExtent: 0.0,
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    // padding: const EdgeInsets.only(left: 40.0),
                    children: widget._items.isNotEmpty
                        ? ListTile.divideTiles(
                            context: context,
                            tiles: _getChildren(widget._items),
                          ).toList()
                        : [],
                  ),
                ),
              ),
      ],
    );
  }

  List<ListTile> _getChildren(List<String> items) {
    List<ListTile> childItems = [];
    for (var item in items) {
      if (_textEditingController.text.isNotEmpty) {
        if (item
            .toUpperCase()
            .contains(_textEditingController.text.toUpperCase()))
          childItems.add(_getListTile(item));
      } else {
        childItems.add(_getListTile(item));
      }
    }
    _isSearching ? childItems : [];
    return childItems;
  }

  ListTile _getListTile(String text) {
    return ListTile(
      dense: true,
      title: Text(
        text,
      ),
      onTap: () {
        setState(() {
          _textEditingController.text = text;
          // _handleControllerChanged();
          _showDropdown = false;
          _isSearching = false;
          // if (widget.onValueChanged != null) widget.onValueChanged(text);
        });
      },
    );
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.

    if (_textEditingController.text.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchText = "";
      });
    } else {
      setState(() {
        _isSearching = true;
        _searchText = _textEditingController.text;
        _showDropdown = true;
      });
    }
  }
}
