package com.faber.chemtools.app.controller;

import com.faber.chemtools.app.entities.Unity;
import com.faber.chemtools.app.service.ReactionService;
import com.faber.chemtools.core.exceptions.BalanceEquationFailException;
import com.faber.chemtools.core.exceptions.InvalidReactionException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReactionController {
    ReactionService reactionService;
    public ReactionController(ReactionService reactionService){
        this.reactionService = reactionService;
    }

    @GetMapping({"/","/balancear", "/estequiometria"})
    public String home(){
        return "equacao";
    }

    @PostMapping("/balancear")
    public String balancear(Model model, @RequestParam String reaction){
        try {
            model.addAttribute("reaction",reactionService.balanceEquation(reaction));
        } catch (BalanceEquationFailException e) {
            model.addAttribute("aviso","Erro ao balancear");
            return "equacao";
        } catch (InvalidReactionException e) {
            model.addAttribute("aviso","Equação inválida");
            return "equacao";
        }
        return "balancear";
    }

    @PostMapping("/estequiometria")
    public String estequiometria(@RequestParam String reaction,
                                 @RequestParam String molecule,
                                 @RequestParam String value,
                                 @RequestParam String unity,
                                 Model model) {

        model.addAttribute("reaction", reactionService.calculate(reaction,molecule, Unity.fromSymbol(unity), Double.parseDouble(value)));

        return "estequiometria";
    }
}
