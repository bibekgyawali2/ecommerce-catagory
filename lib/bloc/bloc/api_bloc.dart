import 'package:bloc/bloc.dart';
import 'package:ecommerce/bloc/bloc/api_event.dart';
import 'package:ecommerce/bloc/bloc/api_state.dart';

import '../../repository/api_repositories.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductList>(
      (event, emit) async {
        try {
          emit(ProductLoading());
          final mList = await _apiRepository.fetchCovidList();
          emit(ProductLoaded(mList));
          //emit(ProductError(mList.title));
        } on NetworkError {
          emit(const ProductError(
              "Failed to fetch data. is your device online?"));
        }
      },
    );
  }
}
