import 'package:bloc/bloc.dart';
import 'package:custom_menu/utils/constanst.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_item_event.dart';
part 'dropdown_item_state.dart';

class DropdownItemBloc extends Bloc<DropdownItemEvent, DropdownItemState> {
  DropdownItemBloc() : super(DropdownItemInitial()) {
    on<ChangeisExpandedEvent>((event, emit) {
      emit(ChangeisExpandedState(
          isExpanded: !state.isExpanded,
          heightFactor: !state.isExpanded
              ? -1 * AppConstants.dropdownHeight * 2.5
              : AppConstants.dropdownHeight / 2.5,
          itemWidth: !state.isExpanded
              ? AppConstants.minItemWidth
              : AppConstants.minItemWidth * 10));
    });
  }
}
