package com.faber.chemtools.app.service;

import com.faber.chemtools.app.dto.MoleculeDto;
import com.faber.chemtools.app.dto.ReactionDto;
import com.faber.chemtools.app.entities.Unity;
import com.faber.chemtools.core.business.StoichiometricCalculator;
import com.faber.chemtools.core.entities.Equation;
import com.faber.chemtools.core.entities.MoleculeInReaction;
import com.faber.chemtools.core.entities.Reaction;
import com.faber.chemtools.core.exceptions.BalanceEquationFailException;
import com.faber.chemtools.core.exceptions.InvalidReactionException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class ReactionService {
    public ReactionDto balanceEquation(String equation) throws BalanceEquationFailException, InvalidReactionException {
        Reaction reaction = Reaction.factory(equation);
        reaction.balance();
        ReactionDto reactionDto = ReactionDto.fromReaction(reaction);
        reactionDto.setEquation(equation);
        return reactionDto;
    }

    public ReactionDto calculate(String equation, String referenceMolecule ,Unity referenceUnity, double amount){
        try {
            Equation eq = Equation.factory(equation);
            StoichiometricCalculator calc = new StoichiometricCalculator(eq);
            calc.setReferenceMolecule(referenceMolecule);
            if(referenceUnity == Unity.mol){
                calc.setRefenceMoles(amount);
            }else if(referenceUnity == Unity.grama){
                calc.setReferenceMass(amount);
            }

            ReactionDto reactionDto = new ReactionDto();
            reactionDto.setProducts(new ArrayList<>());
            reactionDto.setReagents(new ArrayList<>());

            Reaction reaction = eq.copyReaction();
            for(MoleculeInReaction molecule : reaction.getReagents()){
                MoleculeDto moleculeDto = new MoleculeDto();
                moleculeDto.setFormula(molecule.getFormula());
                moleculeDto.setGrams(calc.calculateMass(molecule.getFormula()));
                moleculeDto.setCoefficient(calc.calculateMoles(molecule.getFormula()));
                reactionDto.getReagents().add(moleculeDto);
            }
            for(MoleculeInReaction molecule : reaction.getProducts()){
                MoleculeDto moleculeDto = new MoleculeDto();
                moleculeDto.setFormula(molecule.getFormula());
                moleculeDto.setGrams(calc.calculateMass(molecule.getFormula()));
                moleculeDto.setCoefficient(calc.calculateMoles(molecule.getFormula()));
                reactionDto.getProducts().add(moleculeDto);
            }

            return reactionDto;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
