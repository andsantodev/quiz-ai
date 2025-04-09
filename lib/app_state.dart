import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _temasSugeridos = [
    'Filmes e Séries',
    'História Mundial',
    'Curiosidades sobre o Espaço',
    'Música e Entretenimento',
    'Olimpíadas',
    'Cultura Pop e Games',
    'Geografia',
    'Animais e Natureza',
    'Invenções e Descobertas',
    'Tecnologia',
    'Ciência'
  ];
  List<String> get temasSugeridos => _temasSugeridos;
  set temasSugeridos(List<String> value) {
    _temasSugeridos = value;
  }

  void addToTemasSugeridos(String value) {
    temasSugeridos.add(value);
  }

  void removeFromTemasSugeridos(String value) {
    temasSugeridos.remove(value);
  }

  void removeAtIndexFromTemasSugeridos(int index) {
    temasSugeridos.removeAt(index);
  }

  void updateTemasSugeridosAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    temasSugeridos[index] = updateFn(_temasSugeridos[index]);
  }

  void insertAtIndexInTemasSugeridos(int index, String value) {
    temasSugeridos.insert(index, value);
  }
}
