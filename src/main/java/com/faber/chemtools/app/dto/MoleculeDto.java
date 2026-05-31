package com.faber.chemtools.app.dto;
import com.faber.chemtools.core.entities.MoleculeInReaction;

public class MoleculeDto {
    String formula;
    double coefficient;
    double grams;
    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public double getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(double coefficient) {
        this.coefficient = coefficient;
    }

    public double getGrams() {
        return grams;
    }

    public void setGrams(double grams) {
        this.grams = grams;
    }

    public static MoleculeDto fromMolecule(MoleculeInReaction moleculeInReaction) {
        MoleculeDto moleculeDto = new MoleculeDto();
        moleculeDto.setFormula(moleculeInReaction.getFormula());
        moleculeDto.setCoefficient(moleculeInReaction.getStoichiometricCoefficient());
        moleculeDto.setGrams(moleculeInReaction.calculateWeight());
        return moleculeDto;
    }
}
