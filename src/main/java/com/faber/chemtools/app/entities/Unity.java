package com.faber.chemtools.app.entities;

public enum Unity {
    grama("g")
    ,mol("mol");
    final String unity;
    Unity(String unity){
        this.unity = unity;
    }
    public static Unity fromSymbol(String symbol) {
        for (Unity u : values()) {
            if (u.unity.equals(symbol)) {
                return u;
            }
        }
        throw new IllegalArgumentException("Unidade inválida: " + symbol);
    }

}
