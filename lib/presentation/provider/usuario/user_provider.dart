import 'package:cutap/domain/models/modelos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class UserProvider extends _$UserProvider {

  @override
  List<Usuario> build() => [];

  void agregarUsuario(Usuario usuario){
    state = [...state, usuario];
  }
}

