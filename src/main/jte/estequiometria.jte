@param com.faber.chemtools.app.dto.ReactionDto reaction
<section class="grid lg:grid-cols-3 gap-6">
    @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getReagents())
        <div class="glass rounded-3xl p-8 border border-blue-500/10">

            <div class="text-sm tracking-wider text-slate-400 mb-3">
                ${moleculeDto.getFormula()} Necessário
            </div>

            <div class="text-4xl font-extrabold text-blue-400 mb-2">
                ${moleculeDto.getCoefficient()} mol
            </div>

            <div class="text-slate-500">
                Aproximadamente ${moleculeDto.getGrams()} g
            </div>

        </div>
    @endfor

    @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getProducts())
        <div class="glass rounded-3xl p-8 border border-blue-500/10">

            <div class="text-sm tracking-wider text-slate-400 mb-3">
                ${moleculeDto.getFormula()} Necessário
            </div>

            <div class="text-4xl font-extrabold text-blue-400 mb-2">
                ${moleculeDto.getCoefficient()} mol
            </div>

            <div class="text-slate-500">
                Aproximadamente ${moleculeDto.getGrams()} g
            </div>

        </div>
    @endfor


</section>