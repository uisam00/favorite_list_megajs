import 'package:flutter/material.dart';
import 'package:primeiroapp/pages/addmovie_page.dart';
import 'package:primeiroapp/pages/addserie_page.dart';
import 'package:primeiroapp/pages/home_page.dart';
import 'package:primeiroapp/pages/listcategory_page.dart';
import 'package:primeiroapp/pages/listserie_page.dart';
import 'package:primeiroapp/pages/login_page.dart';
import 'package:primeiroapp/pages/readfavmovie_page.dart';
import 'package:primeiroapp/pages/readfavserie_page.dart';
import 'package:primeiroapp/provider/favorites.provider-movie.dart';
import 'package:primeiroapp/provider/favorites.provider-serie.dart';
import 'package:primeiroapp/routes/app_routes.dart';
import 'package:provider/provider.dart';

import 'pages/listmovie_page.dart';
import 'pages/reset-password_page.dart';
import 'pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteMovieProvider>(
          create: (ctx) => FavoriteMovieProvider(),
        ),
        ChangeNotifierProvider<FavoriteSerieProvider>(
          create: (ctx) => FavoriteSerieProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Lista de Filmes e Séries',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            // primaryColor: Colors.grey[350],
            // accentColor: Colors.white,
          ),
          routes: {
            AppRoutes.LOGIN_PAGE: (_) => LoginPage(), //inicializar
            AppRoutes.HOME: (_) => HomePage(),
            AppRoutes.ADD_SERIE: (_) => AddSeriePage(),
            AppRoutes.ADD_MOVIE: (_) => AddMoviePage(),
            AppRoutes.LIST_MOVIE: (_) => ListMoviePage(),
            AppRoutes.LIST_SERIE: (_) => ListSeriePage(),
            AppRoutes.LIST_CATEGORY: (_) => ListCategoryPage(),
            AppRoutes.RESET_PASSWORD: (_) => ResetPasswordPage(),
            AppRoutes.SIGNUP: (_) => SignupPage(),
            AppRoutes.READFAVMOVIE: (_) => ReadFavoriteMovie(),
            AppRoutes.READFAVSERIE: (_) => ReadFavoriteSerie(),
          }),
    );
  }
}
