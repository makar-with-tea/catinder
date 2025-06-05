import 'package:mockito/annotations.dart';
import 'package:catinder/domain/usecases/get_liked_cats_usecase.dart';
import 'package:catinder/domain/usecases/delete_liked_cat_usecase.dart';
import 'package:catinder/domain/usecases/fetch_cats_usecase.dart';
import 'package:catinder/domain/usecases/save_liked_cat_usecase.dart';

@GenerateMocks([
  GetLikedCatsUseCase,
  DeleteLikedCatUseCase,
  FetchCatsUseCase,
  SaveLikedCatUseCase,
])
void main() {}
