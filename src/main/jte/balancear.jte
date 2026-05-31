@param com.faber.chemtools.app.dto.ReactionDto reaction
@template.home(content = @`

    <body class="min-h-screen text-white overflow-x-hidden">

    <div class="absolute inset-0 opacity-30">
        <div class="absolute top-20 left-20 w-72 h-72 bg-blue-500 rounded-full blur-3xl"></div>
        <div class="absolute bottom-20 right-20 w-72 h-72 bg-emerald-500 rounded-full blur-3xl"></div>
    </div>

    <main class="relative z-10 p-6 lg:p-10">
        <input type="hidden" name="reaction" value="${reaction.getEquation()}">
        <div class="max-w-7xl mx-auto space-y-8">

            <!-- EQUAÇÃO -->

            <section class="glass glow rounded-3xl p-10 lg:p-14">

                <div class="mb-8">

                    <div class="flex items-center gap-6 mb-3">
                        <h2 class="text-2xl font-bold">
                            Equação Balanceada
                        </h2>

                        <button
                                onclick="location.replace('/')"
                                class="bg-white/5 hover:bg-white/10 border border-white/10 transition px-2 py-1 rounded-2xl text-slate-300 font-medium">
                            ↺ Nova Equação
                        </button>
                    </div>

                    <p class="text-slate-400">
                        Relação estequiométrica ajustada automaticamente.
                    </p>

                </div>
                <div class="bg-slate-950/50 border border-white/5 rounded-3xl p-8 overflow-auto">
                    !{
                        int tamanho = reaction.getReagents().size();
                        int contador = 0;
                    }
                    <div class="text-2xl lg:text-4xl font-bold text-center leading-relaxed">
                        @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getReagents())
                            <span class="text-blue-400">${(int)moleculeDto.getCoefficient()} ${moleculeDto.getFormula()}</span>
                            @if(contador < tamanho-1)
                                <span class="mx-4 text-slate-500">+</span>
                            @endif
                            !{ contador++; }
                        @endfor
                        <span class="mx-6 text-emerald-400">→</span>
                        !{
                        tamanho = reaction.getProducts().size();
                        contador = 0;
                    }
                        @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getProducts())
                            <span class="text-blue-400">${(int)moleculeDto.getCoefficient()} ${moleculeDto.getFormula()}</span>
                            @if(contador < tamanho-1)
                                <span class="mx-4 text-slate-500">+</span>
                            @endif
                            !{ contador++; }
                        @endfor

                    </div>

                </div>

            </section>

            <!-- ESTEQUIOMETRIA -->

            <section class="glass glow rounded-3xl p-10 lg:p-14">

                <div class="mb-10">

                    <h2 class="text-2xl font-bold mb-3">
                        Cálculo Estequiométrico
                    </h2>

                    <p class="text-slate-400">
                        Informe a quantidade de qualquer substância em mols ou gramas.
                    </p>

                </div>

                <form class="grid lg:grid-cols-4 gap-6" method="post" action="/balancear">

                    <!-- SUBSTANCIA -->

                    <div class="lg:col-span-2">

                        <label class="block text-sm font-medium text-slate-300 mb-3">
                            Substância
                        </label>

                        <select
                                name="molecule"
                                class="w-full rounded-2xl bg-slate-900/70 border border-slate-700 focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 outline-none transition-all px-5 py-4 text-lg">
                            @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getReagents())
                                <option value="${moleculeDto.getFormula()}">${moleculeDto.getFormula()}</option>
                            @endfor
                            @for(com.faber.chemtools.app.dto.MoleculeDto moleculeDto : reaction.getProducts())
                                <option value="${moleculeDto.getFormula()}">${moleculeDto.getFormula()}</option>
                            @endfor

                        </select>

                    </div>

                    <!-- VALOR -->

                    <div>

                        <label class="block text-sm font-medium text-slate-300 mb-3">
                            Quantidade
                        </label>

                        <input
                                name="value"
                                type="number"
                                step="0.10"
                                min="0"
                                placeholder="0.00"
                                class="w-full rounded-2xl bg-slate-900/70 border border-slate-700 focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 outline-none transition-all px-5 py-4 text-lg"
                        />

                    </div>

                    <!-- UNIDADE -->

                    <div>

                        <label class="block text-sm font-medium text-slate-300 mb-3">
                            Unidade
                        </label>

                        <select
                                name="unity"
                                class="w-full rounded-2xl bg-slate-900/70 border border-slate-700 focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 outline-none transition-all px-5 py-4 text-lg">

                            <option value="mol">mol</option>
                            <option value="g">gramas</option>

                        </select>

                    </div>

                </form>

                <!-- BOTÃO -->

                <div class="mt-8">

                    <button
                            class="w-full lg:w-auto bg-gradient-to-r from-blue-500 to-emerald-500 hover:scale-[1.02] active:scale-[0.99] transition-all duration-200 rounded-2xl px-10 py-4 text-lg font-semibold shadow-2xl shadow-blue-500/20"
                            hx-target="#resultado-calculo"
                            hx-post="/estequiometria"
                            hx-include="[name='reaction'], [name='molecule'], [name='value'], [name='unity']"

                    >

                        Calcular Quantidades

                    </button>

                </div>

            </section>

            <!-- RESULTADOS -->
            <section id="resultado-calculo"></section>

        </div>

    </main>

    </body>
`)