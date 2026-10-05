<div align="center">

# 🌦️ Météo — SwiftUI

**Test technique : une application iOS qui affiche la météo en temps réel de plusieurs villes françaises, avec un fond animé selon le temps qu'il fait.**

![Swift](https://img.shields.io/badge/Swift-F05138?style=flat&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0D96F6?style=flat&logo=swift&logoColor=white)
![OpenWeather](https://img.shields.io/badge/API-OpenWeatherMap-EB6E4B?style=flat)
![MVVM](https://img.shields.io/badge/Architecture-MVVM-555?style=flat)

<br>

<img src="./screenshots/demo.gif" alt="Démo de l'application" width="280">

</div>

## 📱 Aperçu

<div align="center">
  <img src="./screenshots/liste.png" alt="Liste des villes" width="250">
  &nbsp;
  <img src="./screenshots/detail-celsius.png" alt="Détail en Celsius" width="250">
  &nbsp;
  <img src="./screenshots/detail-fahrenheit.png" alt="Détail en Fahrenheit" width="250">
</div>

<p align="center"><i>Liste des villes · Détail d'une ville · Bascule °C / °F</i></p>

## ✨ Fonctionnalités

- Météo en temps réel de Lyon, Paris, Marseille, Lille et Toulouse via l'API OpenWeatherMap
- Fond illustré qui change selon le temps (soleil, nuages, pluie, neige…)
- Recherche d'une ville dans la liste
- Écran de détail avec conversion Celsius ↔ Fahrenheit
- Appels réseau asynchrones (`async/await`, `URLSession`)
- Architecture MVVM (Models / ViewModels / Views)

## 🛠️ Lancer le projet

1. Créer une clé gratuite sur [openweathermap.org](https://home.openweathermap.org/api_keys)
2. La coller dans `WeatherListViewModel.swift` à la place de `VOTRE_API_KEY`
3. Ouvrir le projet dans Xcode et lancer sur un simulateur (⌘R)

🎬 [Télécharger la vidéo de démo complète](./ScreenRecording_test.mp4)
