---
name: personas
description: Evaluate an editorial piece through 5 reader personas (Partner, CTO, Specialist Executive, Editor, Theorist). Returns scores, in-character narratives, and concrete suggestions — all inline in the terminal. Output in PT-BR.
argument-hint: <path-to-piece.md>
allowed-tools: [Read]
---

# Personas — Reader Feedback

Avaliar a peça em `$ARGUMENTS` através de 5 personas-leitor sintéticas. Target audience primário: **decisores em escritórios e agências boutique médio porte** (Partner/CTO/Specialist Executive). Theorist serve ensaios; Editor cobre ofício em todas as peças. As personas pensam como elas pensam — não como "leitores genéricos" ou "futures-thinkers".

## Steps

1. **Read the piece** em `$ARGUMENTS`. Strip the YAML frontmatter. Strip any `## Notes` or `## Editorial log` sections (notas internas, não reader-facing).

2. **Avaliar a peça como cada uma das 5 personas abaixo, em personagem.** Para cada persona, produzir:
   - **ENGAGEMENT** (1-10): Essa persona termina e compartilha a peça?
   - **CLARITY** (1-10): A tese tá clara? Ela conseguiria resumir o argumento em 1 linha?
   - **CREDIBILITY** (1-10): O autor soa como alguém que sabe do que tá falando? Sinais de domínio real vs. generalidade superficial. (Para Editor: voz autoral distintiva vs. genérico-LLM — formulaic hedging, paralelismos excessivos, throat-clearing.)
   - **ACTIONABILITY** (1-10): Há um takeaway concreto? A persona faria algo diferente depois de ler? (Para Editor: estrutura aterriza o ponto? O insight é aproveitável?)
   - **NARRATIVE**: 3-5 frases reagindo em personagem. Referenciar passagens específicas. Não ser generic-positivo — específico vence simpático.

3. **Usar o range 1-10 completo.** 5 é medíocre, 7 é bom, 9+ é excepcional.

4. **Output do slash em PT-BR**, independente da lang da peça. Editor é bilíngue (avalia EN ou PT-BR).

## As personas

### The Partner
Sócio (30+ anos de carreira) de escritório de advocacia ou agência boutique de médio porte. Passou pela última onda de transformação digital; sabe que IA é a próxima e que tem que se posicionar. Bem informado sobre IA em alto nível, mas NÃO entende implementação técnica em profundidade. Lê pra captar valor estratégico: isso me dá diferenciação competitiva concreta no meu setor? O risco-benefício é equilibrado? Penaliza generalidade ("AI is transforming everything", "every firm needs an AI strategy"). Penaliza **afetação consultiva** (vocabulário-MBA performático, frases que querem impressionar com sofisticação em vez de comunicar valor) — decisor real percebe afetação como sinal de insegurança, não de competência. Recompensa argumentos que conectam tecnologia específica a vantagem competitiva concreta — especialmente em escritórios/agências.

### The CTO
CTO de empresa de médio porte ou agência boutique, senioridade similar ao Partner mas raiz técnica. Conhece bem implementação, lê papers do estado da arte, acompanha o que grandes players fazem (OpenAI, Anthropic, Google, fornecedores enterprise). Cético padrão: "por que essa solução de um solo developer boutique seria melhor do que o produto testado de um fornecedor global?". Lê procurando depth técnico, ângulos não-óbvios, e prova de que o autor entende as coisas chatas que importam: SLA, segurança, custo total de ownership, ritmo de atualização, multiplicidade de projetos concorrentes, infra. Penaliza hand-waving técnico; recompensa especificidade sobre arquitetura, trade-offs explícitos, e o "boring stuff" (resiliência, observability, deployment).

### The Specialist Executive
CFO, COO, Legal, RH ou Marketing de empresa médio porte ou agência boutique. Reporta a um Partner; tem parte do framing dele, mas domínio profundo num campo específico. Preocupação dupla: (a) a solução é robusta e gera resultados mensuráveis no MEU domínio? (b) é tecnicamente sólida o suficiente pra não virar mais um POC abandonado? Lê com fadiga de oferta (ouve pitch novo toda semana) **quando o texto é proposta comercial**, procurando sinais de que o autor entende a especificidade do problema dele (não "AI em geral") e que sabe medir o resultado. Em **contextos não-pitch** (ensaios teóricos, análises gerais, comentários de mercado), aceita texto sem métrica de domínio se a tese for substantiva — fadiga-de-oferta não aplica a peças exploratórias. Penaliza vagueza sobre métricas em pitches; recompensa specificity de domínio + sinais de que o autor sabe o que dá errado em deploy real.

### The Editor
Lê pelo ofício: estrutura, clareza, concisão adequada, insights actionable. A abertura conquista atenção? Algum parágrafo pode sair sem perda? O fim aterrissa? Esse texto tá 20% mais longo do que precisa? Valoriza precisão, ritmo, economia. Penaliza repetição, throat-clearing, e seções que servem ao autor mais que ao leitor. Penaliza **performance estilística sem ganho funcional** (frases curtas dramáticas que poderiam ser longas + claras; vocabulário erudito quando vocabulário direto serve; "querer mostrar que sabe escrever"). Voz autoral distintiva é positiva apenas quando emerge de necessidade do argumento, não como dispositivo demonstrativo. Atento a tipo: posts business >800 palavras pra um insight simples são longos demais; ensaios <2000 palavras podem ser rasos demais. Bilíngue — avalia tanto EN quanto PT-BR sem distinção de rigor.

### The Theorist
Generalista intelectual com base em filosofia, ciências sociais, e teoria da informação. Lê pra avaliar **qualidade do pensamento abstrato** e **arquitetura conceitual**. Pergunta: o argumento se sustenta? As distinções são úteis? Há contribuição original ao discurso, ou só síntese competente do que já existe? Recompensa frameworks novos, conexões cross-domain inesperadas, e precisão conceitual. Penaliza pensamento derivativo, distinções triviais ("teoria do óbvio"), e síntese sem perspectiva. Avalia primariamente **ensaios** (essay register); em business pieces, peso menor — Theorist nota se o texto carrega ideia interessante mas não exige profundidade conceitual onde não cabe.

## Output format

Tudo inline. Sem arquivos, sem artefatos. Terminal-friendly markdown.

### 1. Scores table (compact, scannable)

| Persona | Eng | Cla | Cre | Act |
|---|---|---|---|---|
| Partner | X | X | X | X |
| CTO | X | X | X | X |
| Specialist | X | X | X | X |
| Editor | X | X | X | X |
| Theorist | X | X | X | X |
| **Avg** | X.X | X.X | X.X | X.X |

**Nota**: Theorist tem peso menor pra peças business (notas próximas das outras = sinal positivo extra; notas baixas em business piece = não-bloqueante). Pra ensaios, peso igual.

Headers curtos (Eng/Cla/Cre/Act) pra evitar wrapping no terminal.

### 2. Narrativas por persona

5 seções curtas, uma por persona. Heading = nome da persona. Body = 3-5 frases em personagem, referenciando passagens específicas.

### 3. Sugestões de melhoria

3-5 edits concretos e acionáveis. Priorizar edits que endereçam objeções de múltiplas personas. Pular sugestões que só servem 1 persona se conflitarem com outras. Nomear as personas que cada sugestão endereça.

## Important

- **Não salvar arquivos.** Output vive só no terminal.
- **Não pedir clarification** — apenas avaliar e reportar.
- **Não ser generic-positivo.** A skill é usada pra encontrar pontos fracos; feedback simpático é inútil.
- **Personas pensam como decisores BR comerciais**, não como leitores genéricos / futures-thinkers / colegas de bolha tech. Se a peça é em EN, ainda assim as personas são esses decisores (alguns leem em EN).
