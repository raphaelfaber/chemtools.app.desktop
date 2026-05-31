@param String aviso
@template.home(content = @`
    <body class="min-h-screen text-white overflow-hidden">

    <div class="absolute inset-0 opacity-30">
        <div class="absolute top-20 left-20 w-72 h-72 bg-blue-500 rounded-full blur-3xl"></div>
        <div class="absolute bottom-20 right-20 w-72 h-72 bg-emerald-500 rounded-full blur-3xl"></div>
    </div>


    <main class="relative z-10 min-h-screen flex items-center justify-center p-6">

        <div class="w-full max-w-6xl glass glow rounded-3xl overflow-hidden">

            <div class="grid lg:grid-cols-2">

                <section
                        class="p-10 lg:p-16 border-b lg:border-b-0 lg:border-r border-white/10 flex flex-col justify-center">


                    <h1 class="text-4xl lg:text-6xl font-extrabold leading-tight mb-6">
                        Chem
                        <span class="bg-gradient-to-r from-blue-400 to-emerald-400 bg-clip-text text-transparent">      tools
           </span>

                    </h1>

                    <p class="text-slate-300 text-lg leading-relaxed mb-10 max-w-xl">
                        Digite qualquer reação química
                    </p>

                </section>

                <section class="p-10 lg:p-16 flex items-center">

                    <div class="w-full">

                        <div class="mb-8">
                            <h2 class="text-3xl font-bold mb-3">
                                Inserir Equação
                            </h2>

                            <p class="text-slate-400 leading-relaxed">
                                Digite sua reação química abaixo utilizando o formato padrão.
                            </p>
                        </div>

                        <form action="/balancear" method="post" class="space-y-6">

                            <div>
                                <label class="block text-sm font-medium text-slate-300 mb-3">
                                    Equação Química
                                </label>

                                <textarea
                                        name="reaction"
                                        placeholder="Ex: H2 + O2 -> H2O"
                                        rows="5"
                                        class="w-full rounded-2xl bg-slate-900/70 border border-slate-700 focus:border-blue-500 focus:ring-4 focus:ring-blue-500/20 outline-none transition-all px-5 py-4 text-lg resize-none"
                                ></textarea>
                                @if(aviso != null && !aviso.isBlank())
                                    <p class="text-emerald-500 text-center font-medium mt-2">
                                        ${aviso}
                                    </p>
                                @endif
                            </div>

                            <button
                                    type="submit"
                                    class="w-full bg-gradient-to-r from-blue-500 to-emerald-500 hover:scale-[1.02] active:scale-[0.99] transition-all duration-200 rounded-2xl px-6 py-4 text-lg font-semibold shadow-2xl shadow-blue-500/20"
                            >
                                Balancear Equação
                            </button>

                        </form>

                        <form method="post" action="/balancear" class="mt-10 p-6 rounded-2xl bg-slate-900/60 border border-white/5">
                            <h3 class="text-sm uppercase tracking-wider text-slate-400 mb-4">
                                Exemplos
                            </h3>

                            <div class="flex flex-wrap gap-3">

                                <button class="px-4 py-2 rounded-xl bg-white/5 hover:bg-white/10 transition text-slate-300 border border-white/5"
                                        type="submit"
                                        name="reaction"
                                        value="H2 + O2 -> H2O"
                                >
                                    H2 + O2 -> H2O
                                </button>

                                <button class="px-4 py-2 rounded-xl bg-white/5 hover:bg-white/10 transition text-slate-300 border border-white/5"
                                        type="submit"
                                        name="reaction"
                                        value="Fe + O2 -> Fe2O3"
                                >
                                    Fe + O2 -> Fe2O3
                                </button>

                                <button class="px-4 py-2 rounded-xl bg-white/5 hover:bg-white/10 transition text-slate-300 border border-white/5"
                                        type="submit"
                                        name="reaction"
                                        value="C2H6 + O2 -> CO2 + H2O"
                                >
                                    C2H6 + O2 -> CO2 + H2O
                                </button>

                            </div>
                        </form>

                    </div>

                </section>

            </div>

        </div>

    </main>


    </body>
`
)