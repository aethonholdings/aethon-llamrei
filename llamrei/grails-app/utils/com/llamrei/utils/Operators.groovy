package com.llamrei.utils

public enum Operators {
    EQUALS("=","EQ"),
    NOT_EQUALS("&ne;","NE"),
    GREATER_THAN(">","GT"),
    GREATER_THAN_EQUALS("&ge;","GE"),
    LESS_THAN(">","LT"),
    LESS_THAN_EQUALS("&le;","LE");

    String symbol;
    String shortName;

    String getShortName() {
        return shortName
    }

    String getSymbol() {
        return symbol
    }

    Operators(String symbol, String shortName) {
        this.symbol = symbol
        this.shortName = shortName
    }
}