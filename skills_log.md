# skills_log

Decisions + debug history for the skills project. Append-only.

> Registro de decisões. O texto integral das entradas anteriores a 2026-09-05 está no `git log` deste arquivo.

---

## D-01 — Fase 1 é só OSS, sem monetização, com teto de 3 skills

**Porquê:** o objetivo é validar market-fit via GitHub stars/issues/PRs, não receita (meta <40h de operador). Escopo apertado evita a Fase 1 virar maratona de polimento — a 4ª skill marginal teria sinal quase zero. Fase 2 só avança com sinal de demanda mensurável em 30 dias.

## D-02 — Lançamento via repo público no GitHub, não post no Substack

**Porquê:** repo é artefato durável e pesquisável — stars/issues são sinal externamente legível. Post de blog decai com a taxa de abertura do email.
**Descartado:** anunciar só via ensaio no Substack.

## D-03 — Risco de a Anthropic lançar marketplace oficial no meio da Fase 1

**Porquê:** mitigação decidida de saída — o repo OSS mantém valor de portfólio independente disso; se a monetização da Fase 2 for adiante, pivota pra consultoria em vez de tier pago via Stripe.

## D-04 — `/retrofit` e `/propose` ficam fora do repo público, mesmo sendo de alto valor

**Porquê:** acoplados demais às convenções editoriais do operador, ao Notion e ao `signals.db` — portar dominaria o orçamento do projeto e diluiria a mensagem de curadoria.
**Descartado:** incluir as duas mesmo com o acoplamento.

## D-05 — Detecção de projeto generalizada para marker-scan no root, no lugar do gate de `~/Documents/`

**Porquê:** a skill `/spec` original era acoplada ao filesystem pessoal do operador; portabilidade externa exige descoberta agnóstica de path.

## D-06 — Lente BR do `/personas` fica opinativa, não lavada pra genérica

**Porquê:** o README expõe o enquadramento de audiência + guia de customização em vez de esconder o viés boutique BR — é o diferencial editorial do projeto.

## D-07 — `outputs/` (rascunhos de anúncio) ficou gitignored, revertendo o plano original da Spec 04

**Porquê:** rascunho editorial privado do operador não deveria ir parar num repo público só porque a spec original mandava `outputs/posts/` versionado. Reversível removendo do `.gitignore` se o operador quiser.
**Descartado:** seguir a spec original e versionar os rascunhos.

---

### Template — Day-30 measurement gate

When v0.1.0 is 30 days old (≈ 2026-06-25 assuming push on launch day), run `bash tools/measure.sh` and paste the output below this template. The script emits the heading + signals table + branch checkboxes; operator fills the DM count and ticks one branch. See `specs/05_measurement_gate.md` for thresholds.

```
## YYYY-MM-DD — Day-30 measurement gate
(replaced by tools/measure.sh output)
```
