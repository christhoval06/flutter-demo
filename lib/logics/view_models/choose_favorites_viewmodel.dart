import 'package:flutter/foundation.dart';
import 'package:moolax/logics/models/currency.dart';
import 'package:moolax/logics/models/rate.dart';
import 'package:moolax/services/currency/currency_service.dart';
import 'package:moolax/utils/iso_data.dart';
import 'package:moolax/services/service_locator.dart';

// This class manages choosing the favorite currencies to show on the main screen.
// It also puts the choices in a form that is easy to display on a view. It
// knows nothing about any particular view, though.
class ChooseFavoritesViewModel extends ChangeNotifier {
  final CurrencyService _currencyService = serviceLocator<CurrencyService>();

  List<FavoritePresentation> _choices = [];
  List<Currency> _favorites = [];

  List<FavoritePresentation> get choices => _choices;

  void loadData() async {
    final rates = await _currencyService.getAllExchangeRates();
    _favorites = await _currencyService.getFavoriteCurrencies();
    _prepareChoicePresentation(rates);
    notifyListeners();
  }

  void _prepareChoicePresentation(List<Rate> rates) {
    List<FavoritePresentation> list = [];
    for (Rate rate in rates) {
      String code = rate.quoteCurrency;
      bool isFavorite = _getFavoriteStatus(code);
      list.add(FavoritePresentation(
        flag: IsoData.flagOf(code),
        alphabeticCode: code,
        longName: IsoData.longNameOf(code),
        isFavorite: isFavorite,
      ));
    }
    _choices = list;
  }

  bool _getFavoriteStatus(String code) {
    for (Currency currency in _favorites) {
      if (code == currency.isoCode) return true;
    }
    return false;
  }

  void toggleFavoriteStatus(int choiceIndex) {
    final isFavorite = !_choices[choiceIndex].isFavorite;
    final code = _choices[choiceIndex].alphabeticCode;

    // update display
    _choices[choiceIndex].isFavorite = isFavorite;

    // update favorite list
    if (isFavorite) {
      _addToFavorites(code);
    } else {
      _removeFromFavorites(code);
    }

    notifyListeners();
  }

  void _addToFavorites(String alphabeticCode) {
    _favorites.add(Currency(alphabeticCode));
    _currencyService.saveFavoriteCurrencies(_favorites);
  }

  void _removeFromFavorites(String alphabeticCode) {
    for (final currency in _favorites) {
      if (currency.isoCode == alphabeticCode) {
        _favorites.remove(currency);
        break;
      }
    }
    _currencyService.saveFavoriteCurrencies(_favorites);
  }
}

class FavoritePresentation {
  final String flag;
  final String alphabeticCode;
  final String longName;
  bool isFavorite;

  FavoritePresentation({
    this.flag,
    this.alphabeticCode,
    this.longName,
    this.isFavorite,
  });
}
