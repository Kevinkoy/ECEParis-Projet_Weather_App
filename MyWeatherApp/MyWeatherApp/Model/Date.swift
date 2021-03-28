//
//  Date.swift
//  MyWeatherApp
//
//  Created by Kévin Koy on 23/03/2021.
//

import Foundation

//MARK: - extension Date
extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

//MARK: - Code dateFormat : https://codabee.com/convertir-string-date-swift/

/*
Caractères    Exemple    Description
y    2018    Année complète
yy    18    Année 2 décimales
yyyy    2018    Année 4 décimales
Trimestre
Q    3    Trimestre de l'année
QQQ    Q3 / T3    Trimestre de l'année incluant le Q si en anglais, le T si en français
QQQQ    3th quarter / 3e trimestre    Trimestre écrit en entier
Mois
M    9    Nombre du mois de l'année
MM    09    Nombre du mois de l'année
MMM    Sep    Nom du mois abrégé
MMMM    September / Septembre    Nom du mois complet
MMMMM    S    Initiale du mois
Jour
d    5    Jour du mois.
dd    05    Jour du mois.
E    Wed / mer.    Nom du jour abrégé
EEEE    Wednesday / mercredi    Nom complet du jour
EEEEE    W / M    Initiale du jour de la semaine
Heure
h    2    Heure format 12h
hh    02    Heure format 12h
H    14     Heure format 24h
HH    14     Heure format 24h
a    PM    AM / PM uniquement pour le format 12H
Minute
m    8    Minute
mm    08    Minute
Seconde
s    0    Secondes
ss    00    Secondes
Fuseau Horaire
zzz    CST    Abréviation 3 lettres du fuseau horaire (si connu)
zzzz    Central Standard Time    Fuseau horaire complet.
zzzz    CST-06:00    Fuseau horaire abrégé avec décalage par rapport à GMT
Z    -0600    RFC 822  format GMT.
ZZZZZ    -06:00    ISO 8601  format.
*/
