part of 'dropdown_item_bloc.dart';

abstract class DropdownItemEvent extends Equatable {
  const DropdownItemEvent();

  @override
  List<Object> get props => [];
}


class ChangeisExpandedEvent extends DropdownItemEvent {
}
