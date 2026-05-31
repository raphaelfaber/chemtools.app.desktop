package com.faber.chemtools.app.dto;

import com.faber.chemtools.core.entities.Reaction;

import java.util.List;

public class ReactionDto {
    String equation;
    String balancedReaction;

    List<MoleculeDto> reagents;
    List<MoleculeDto> products;
    public String getEquation() {
        return equation;
    }

    public void setEquation(String equation) {
        this.equation = equation;
    }

    public String getBalancedReaction() {
        return balancedReaction;
    }

    public void setBalancedReaction(String balancedReaction) {
        this.balancedReaction = balancedReaction;
    }

    public List<MoleculeDto> getProducts() {
        return products;
    }

    public void setProducts(List<MoleculeDto> products) {
        this.products = products;
    }

    public List<MoleculeDto> getReagents() {
        return reagents;
    }

    public void setReagents(List<MoleculeDto> reagents) {
        this.reagents = reagents;
    }

    public static ReactionDto fromReaction(Reaction reaction) {
        ReactionDto reactionDto = new ReactionDto();
        reactionDto.setBalancedReaction(reaction.toString());
        reactionDto.setReagents(
                reaction.getReagents()
                        .stream()
                        .map(MoleculeDto::fromMolecule)
                        .toList()
        );
        reactionDto.setProducts(
                reaction.getProducts()
                        .stream()
                        .map(MoleculeDto::fromMolecule)
                        .toList()
        );
        return reactionDto;
    }

}
