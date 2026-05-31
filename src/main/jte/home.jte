@param gg.jte.Content content
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>ChemTools - Balanceador Químico</title>

    @template.imports.tailwind()
    @template.imports.htmx()
    @template.imports.fonts-inter()

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: radial-gradient(circle at top left, rgba(59, 130, 246, 0.20), transparent 25%),
            radial-gradient(circle at bottom right, rgba(16, 185, 129, 0.16), transparent 25%),
            #020617;
        }

        .glass {
            background: rgba(15, 23, 42, 0.72);
            backdrop-filter: blur(18px);
            border: 1px solid rgba(255, 255, 255, 0.08);
        }

        .glow {
            box-shadow: 0 0 40px rgba(59, 130, 246, 0.15),
            0 0 80px rgba(16, 185, 129, 0.08);
        }
    </style>
</head>
${content}
</html>