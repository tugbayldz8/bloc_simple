import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_simple/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';
import '../../data/model/post_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeService = ProductStateItems.homeService;

  HomeBloc() : super(HomeInitialState()) {
    on<FetchPostEvent>(_fetchProduct);
  }

  FutureOr<void> _fetchProduct(event, emit) async {
    emit(HomeLoadingState());
    final response = await homeService.fetch();
    if (response.data != null) emit(HomeLoadedState(response.data));
    if (response.error != null) emit(HomeErrorState(response.error));
  }
}