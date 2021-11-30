# SWAPI-SwiftUI

## This project in a Test sent by Prozis
To run the app just clone the project and build it up, no 3rd party frameworks were used.

Este exercício tem por objectivo apresentar uma listagem com informação relativa aos filmes Star Wars. 
A app terá um bottom app bar com duas secções “Star Wars People” e “About”.

## Stack
The App was built using SwiftUI, Combine and MVVM as structural Design Pattern;
Created two extensions, a few reusable components and some of the extras.

## Issues

The main issue I had was to find the language of each Character sinc it does not come clear where to find it,
I had to filter the "species" array on the "people" object, make an api call to /species/id to than map it out and get the lnaguage spoken by that species.
However the SWAPI api seem inconsistent and most of the times a few properties wont have any values. I will add a few examples of the json.

