# `/personas` — reader feedback through 5 personas

> **Opinionated.** Built for Brazilian boutique professional-services decision-makers (Partner / CTO / Specialist Executive) plus a craft-focused Editor and a Theorist for essays. Fork to customize for your audience.

---

## English

### What it does

`/personas path/to/piece.md` evaluates a single markdown editorial piece (essay, business post, sales pitch, op-ed) through 5 synthetic reader personas, each rendered in character. It outputs a compact scores table (Engagement / Clarity / Credibility / Actionability), 5 short in-character narratives, and 3–5 concrete suggestions — all in the terminal, no files written.

Output is in PT-BR regardless of the piece's language. The Editor persona is bilingual (assesses EN or PT-BR equally).

### Why these 5 personas

The skill is opinionated. The target audience is **Brazilian boutique professional services** (law firms, consulting boutiques, mid-sized agencies) — a niche where generic "reader feedback" tools miss the actual decision lens.

- **The Partner** — 30+ year career, strategic, knows AI is the next wave but not a technical implementer. Penalizes generality and consulting-speak.
- **The CTO** — technically deep, skeptical of solo-developer boutique solutions vs. established global vendors. Wants the "boring stuff" (SLA, security, deployment).
- **The Specialist Executive** — CFO/COO/Legal/HR/Marketing. Pitch-fatigued; needs specificity in their domain and measurable outcomes (when reading commercial pitches; less strict on exploratory essays).
- **The Editor** — pure craft. Structure, clarity, economy. Penalizes stylistic performance without functional gain.
- **The Theorist** — generalist intellectual (philosophy, social sciences, information theory). Evaluates conceptual architecture; weighted lower for business pieces.

### Install

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/personas ~/.claude/skills/personas
```

Restart Claude Code (or open a new session) and `/personas` is available.

### Usage

```
/personas drafts/my-essay.md
```

Output (truncated example):

```
| Persona    | Eng | Cla | Cre | Act |
|------------|-----|-----|-----|-----|
| Partner    | 6   | 7   | 8   | 4   |
| CTO        | 5   | 6   | 9   | 5   |
| Specialist | 4   | 6   | 7   | 3   |
| Editor     | 7   | 8   | 8   | 6   |
| Theorist   | 8   | 9   | 9   | 5   |
| **Avg**    | 6.0 | 7.2 | 8.2 | 4.6 |

### Partner
Bom argumento técnico, mas eu não consigo dizer o que faço diferente
amanhã. Onde aterriza no meu escritório? [...]

### Sugestões
1. Adicionar 1 parágrafo de "what would change for a 30-lawyer firm" —
   endereça Partner + Specialist. [...]
```

### How to customize

The 5 personas are defined inline in `SKILL.md`. To adapt for a different audience:

1. **Replace Partner** if your audience isn't BR boutique decision-makers (e.g. swap for "Series A founder" or "academic peer reviewer").
2. **Replace Specialist** with the most common reader role in your domain.
3. **Keep Editor** — craft critique transfers across audiences.
4. **Keep or drop Theorist** depending on whether you write essays.
5. **Replace CTO** if your audience isn't technical.

The output-language rule (PT-BR) is hardcoded as an editorial position. To switch, edit `Steps` section step 4 and the closing `Important` block.

### FAQ

**Why is the output always in PT-BR?** Editorial position — this skill ships PT-BR as its first-class default because that audience is underserved. Fork and change if you need EN-output.

**Can it review multiple pieces at once?** No. One file per invocation. This is intentional — the persona work degrades with batch processing.

**Why not save the output to a file?** Reader feedback is a conversation, not an artifact. Saving encourages collecting reports nobody reads.

---

## Português (Brasil)

### O que faz

`/personas caminho/peça.md` avalia uma única peça editorial markdown (ensaio, post business, pitch comercial, op-ed) através de 5 personas-leitor sintéticas, cada uma em personagem. Saída: tabela compacta de scores (Engagement / Clarity / Credibility / Actionability), 5 narrativas curtas em personagem, e 3–5 sugestões concretas — tudo no terminal, sem arquivos salvos.

Saída sempre em PT-BR, independente da língua da peça. A persona Editor é bilíngue (avalia EN ou PT-BR igualmente).

### Por que essas 5 personas

A skill é opinionada. O target é **profissionais de serviços boutique brasileiros** (escritórios de advocacia, consultorias boutique, agências médio porte) — nicho onde ferramentas genéricas de "feedback de leitor" perdem a lente real de decisão.

- **The Partner** — 30+ anos de carreira, estratégico, sabe que IA é a próxima onda mas não é implementador técnico. Penaliza generalidade e afetação consultiva.
- **The CTO** — tecnicamente profundo, cético de solução solo-developer vs. fornecedor global testado. Quer o "boring stuff" (SLA, segurança, deploy).
- **The Specialist Executive** — CFO/COO/Legal/RH/Marketing. Fadiga de oferta; precisa specificity no domínio + métricas (em pitches; menos rigoroso em ensaios exploratórios).
- **The Editor** — ofício puro. Estrutura, clareza, economia. Penaliza performance estilística sem ganho funcional.
- **The Theorist** — generalista intelectual (filosofia, ciências sociais, teoria da informação). Avalia arquitetura conceitual; peso menor pra peças business.

### Instalar

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/personas ~/.claude/skills/personas
```

Reinicie o Claude Code e `/personas` fica disponível.

### Usar

```
/personas drafts/meu-ensaio.md
```

### Como customizar

As 5 personas estão definidas inline no `SKILL.md`. Pra adaptar pra outro público:

1. **Trocar Partner** se seu público não é decisor BR boutique (ex: "founder Series A" ou "revisor acadêmico").
2. **Trocar Specialist** pelo papel mais comum no seu domínio.
3. **Manter Editor** — crítica de ofício transfere entre públicos.
4. **Manter ou remover Theorist** dependendo se você escreve ensaios.
5. **Trocar CTO** se seu público não é técnico.

A regra de output em PT-BR é hardcoded como posição editorial. Pra trocar, edite o step 4 da seção `Steps` e o bloco `Important` no final.

### FAQ

**Por que a saída é sempre em PT-BR?** Posição editorial — essa skill embarca PT-BR como default first-class porque é audiência mal servida. Forke e troque se precisar de saída EN.

**Avalia múltiplas peças?** Não. Uma por invocação. Intencional — o trabalho de persona degrada com batch.

**Por que não salvar saída em arquivo?** Feedback de leitor é conversa, não artefato. Salvar incentiva acumular relatórios que ninguém lê.

---

## License

MIT — see [LICENSE](../../LICENSE).
