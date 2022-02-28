import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jb_fe/backend_integration/dto/party/party_presentation.dart';
import 'package:jb_fe/constants/colors.dart';
import 'package:jb_fe/constants/texts/defaults.dart';
import 'package:jb_fe/constants/texts/party_text.dart';
import 'package:jb_fe/controllers/bloc/party/search_party/search_party_bloc.dart';
import 'package:jb_fe/widgets/calligraphy/app_text.dart';
import 'package:jb_fe/widgets/common/inputs/search_input.dart';

class PartySelectionSearch extends StatefulWidget {
  final List<PartyPresentation> _partyList;
  final Function(PartyPresentation) _onPartySelectCallback;
  final PartyPresentation? _party;
  const PartySelectionSearch(
      {Key? key,
      required List<PartyPresentation> partyList,
      required Function(PartyPresentation) onPartySelectCallback,
      required PartyPresentation? party})
      : _partyList = partyList,
        _onPartySelectCallback = onPartySelectCallback,
        _party = party,
        super(key: key);

  @override
  State<PartySelectionSearch> createState() => _PartySelectionSearchState();
}

class _PartySelectionSearchState extends State<PartySelectionSearch> {
  late int _selectedIndex;
  final FocusNode _focusNode = FocusNode();
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _selectedIndex = 0;
    _textEditingController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: AppSearchInput(
        validator: _partySelectionValidator,
        prefixIcon: Icons.account_circle,
        hint: PartyText.SEARCH_PARTY_HINT,
        tooltip: PartyText.SEARCH_PARTY_TOOLTIP,
        onChanged: _onPartySearchChange,
        searchSubmitHandler: _partySearchSubmitHandler,
        clearSearchResult: _clearSearchTerm,
        focusNode: _focusNode,
        controller: _textEditingController,
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      maintainState: true,
      builder: (BuildContext context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: AppColors.blue_1,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget._partyList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) =>
                    _getDropdownChildren(
                  context,
                  index,
                  widget._partyList[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getDropdownChildren(
      BuildContext context, int index, PartyPresentation party) {
    return ListTile(
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      title: AppTextBuilder("${party.partyId} ${party.name} ${party.contactNo}")
          .textAlign(TextAlign.start)
          .color(_selectedIndex == index ? AppColors.grey_1 : AppColors.black)
          .size(16)
          .build(),
      onTap: () => _onSelection(index, party),
      hoverColor: _selectedIndex == index ? AppColors.blue_5 : AppColors.blue_2,
      tileColor: _selectedIndex == index ? AppColors.blue_5 : AppColors.blue_1,
    );
  }

  _onSelection(int index, PartyPresentation party) {
    _textEditingController.text =
        "${party.partyId} ${party.name} ${party.contactNo}";
    _focusNode.unfocus();
    setState(() {
      _selectedIndex = index;
    });
    widget._onPartySelectCallback(party);
  }

  _onPartySearchChange(String value) {
    if (value.length > 3) {
      BlocProvider.of<SearchPartyBloc>(context)
          .add(SearchParty(searchTerm: value));
    }
  }

  _partySearchSubmitHandler(String value) {
    print("Party search submitted: $value");
  }

  _clearSearchTerm() {
    print("Search term cleared");
  }

  String? _partySelectionValidator(String? p1) {
    print("Validator party called");
    if (widget._party != null) {
      return null;
    }
    return DefaultTexts.EMPTY;
  }
}
