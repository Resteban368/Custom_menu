part of 'dropdown_item_bloc.dart';

abstract class DropdownItemState extends Equatable {

final bool isExpanded = false;

  final double heightFactor = AppConstants.dropdownHeight / 2.5;

  final double itemWidth = AppConstants.minItemWidth;




  const DropdownItemState();
  
  @override
  List<Object> get props => [];
}

class DropdownItemInitial extends DropdownItemState {}

class ChangeisExpandedState extends DropdownItemState {
  final bool isExpanded;
  final double heightFactor;
  final double itemWidth;

  const ChangeisExpandedState({required this.heightFactor, required this.itemWidth, required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];
}
