// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:portfolio/models/meals.dart';
import 'package:portfolio/models/model.dart';
import 'dart:ui';

// ignore: constant_identifier_names
// ignore: unnecessary_const
const Dummy_Catagories = const [
  Model(
    id: 'b',
    color: Colors.orange,
    title: 'Burger',
  ),
  Model(
    id: 'p',
    color: Colors.teal,
    title: 'Pizza',
  ),
  Model(
    id: 'br',
    color: Colors.pink,
    title: 'Biriyani',
  ),
  Model(
    id: 'd',
    color: Colors.grey,
    title: 'Drinks',
  ),
  Model(
    id: 'platter',
    color: Colors.indigoAccent,
    title: 'Platter',
  ),
  Model(
    id: 'cpp',
    color: Colors.cyanAccent,
    title: 'chessBox',
  ),
];
// ignore: unnecessary_const
List<Meal> DUMMY_MEALS = [
  Meal(
      id: 'c1',
      catagoriesId: ['b'],
      duration: 20,
      imageUrl:
          'https://pr0.nicelocal.in/uDQxT_uM6bqmKsGbFk-lRg/1120x700,q85/4px-BW84_n2aGZJPv2Q_uysuQlRKXWAtkzmuAfqDQITcuO7_FYe_adbVn_ntvR81HEVh6ju1LLsnnKRLZR2Igl9ZR4vZTFwe4kjwoKh3pY3B-89D9c-GaELuu27elCDDgY_tFNYFMepHAlfHZnZjEg',
      ingredients: ['chicken', 'cheessss'],
      title: 'Burger of the city'),
       Meal(
      id: 'c2',
      catagoriesId: ['p'],
      duration: 20,
      imageUrl:
        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395__480.jpg',
      ingredients: ['chicken', 'cheessss'],
      title: 'pizza of the city'),
        Meal(
      id: 'c3',
      catagoriesId: ['br'],
      duration: 20,
      imageUrl:
        'https://img.onmanorama.com/content/dam/mm/en/food/in-season/Ramzan/Images/hyderabadi-dum-biryani.jpg',
      ingredients: ['chicken', 'Fried_Rice'],
      title: 'Biriyani of the city'),
       Meal(
      id: 'c4',
      catagoriesId: ['d'],
      duration: 0,
      imageUrl:
        'https://www.firmdalehotels.com/media/1201660/191210_fd_cocktails_39lores.jpg?a=1&anchor=center&mode=crop&width=1596&height=1088&bgcolor=fff&sig=2491ab2ab237c0021a1dadf66ff4295e',
      ingredients: ['chemical '],
      title: 'best for test'),
       Meal(
      id: 'c5',
      catagoriesId: ['platter'],
      duration: 20,
      imageUrl:
        'https://image.shutterstock.com/z/stock-photo-sea-food-plater-1169400553.jpg',
      ingredients: ['chicken', 'cheessss','pasta'],
      title: 'Platter of the city'),
       Meal(
      id: 'c6',
      catagoriesId: ['Cpp'],
      duration: 20,
      imageUrl:
        'https://www.greatlakescheese.com/Data/Sites/24/images/homepage/hp-hero-quality.jpg',
      ingredients: ['CCCHHHEEESSSSeee'],
      title: 'love of the city'),
      Meal(
      id: 'c2',
      catagoriesId: ['b'],
      duration: 20,
      imageUrl:
          'https://images.unsplash.com/photo-1571091655789-405eb7a3a3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80',
      ingredients: ['chickennnnnn', 'cheezzzzzzz'],
      title: 'Small town Burger '),
      Meal(
      id: 'c1',
      catagoriesId: ['b','br','d','p',],
      duration: 20,
      imageUrl:
          'https://www.fontainebleau.com/dining/pizza-burgers/assets/images/instagram/118585869_331574824618055_634814694562600048_n.jpg',
      ingredients: ['you have everything'],
      title: 'RanDom'),
      


];
