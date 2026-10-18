# skills — Atelier Skills

## Venture

<!-- prosa: tese, oferta, modelo de receita, mercado, domínio/canais -->

```venture
icp: "OSS — devs e entusiastas de agentes de código; sem comprador (aquisição e credibilidade, não receita)"
```

Catálogo curado de skills portáveis do Claude Code, empacotadas para uso externo. A Fase 1 entregou um repo GitHub open-source com 3 skills polidas, extraídas do fluxo diário do operador (PT-BR + EN). A Fase 2 (condicionada a sinais de demanda) embrulharia skills premium adicionais atrás de um tier pago.

Posicionamento editorial: PT-BR como diferencial. O ecossistema de skills em inglês é competitivo; o de PT-BR está vazio. A credibilidade de domínio do operador (ensaios EN no Substack + kanhan.com.br PT-BR + Bartleby + paper9) ancora a curadoria.

### Escopo

**Fase 1 (entregue)**: 3 skills extraídas e polidas para uso externo; README bilíngue + instruções de instalação + licença MIT; um canal — repo GitHub público em `github.com/MKanhan/skills-for-claude`; posts de anúncio (ensaio EN no Substack + PT-BR no kanhan.com.br + cross-post no LinkedIn).

**Fase 2 (condicional, não disparada)**: 2 skills premium adicionais, landing page `kanhan.com.br/skills`, tier pago R$ 49/mês ou R$ 399 vitalício via Stripe (a definir). Gatilho: ≥50 stars em 30 dias OU ≥5 issues/PRs externos OU ≥3 DMs pedindo "mais skills como essa". Encerramento: <10 stars + 0 issues + 0 DMs no dia 30, sem menção no LinkedIn/Substack. Explicitamente condicionada para só seguir com sinal independente da atenção de Bartleby/paper9. Ver Now/Next para onde o sinal de fato caiu.

## Stack

- As skills são arquivos de texto puro (`SKILL.md` + scripts auxiliares opcionais).
- Testes: smoke checks em bash por skill (verificam o frontmatter YAML, campos obrigatórios, nenhum caminho específico do kanhan vazado).
- Sem runtime — as skills são consumidas pelo Claude Code via instalação em `~/.claude/skills/`.
- Distribuição: git clone + symlink (sem gerenciador de pacotes).

## Estrutura

```
skills/
├── CLAUDE.md          ← este arquivo (operacional)
├── skills_log.md      ← decisões + histórico de debug
├── specs/             ← thin specs (NN_slug.md)
│   └── 00_bootstrap.md
├── README.md          ← voltado ao público (para o GitHub)
├── LICENSE             ← MIT
├── .gitignore
└── skills/            ← as 3 skills polidas
    ├── spec/
    ├── personas/
    └── audit/
```

## Convenções

- **Idioma**: o idioma interno da skill segue a fonte (as skills existentes do operador são mistas PT-BR/EN). README e meta-docs são bilíngues.
- **Gate de portabilidade**: uma skill é portável quando zero referências ao filesystem do operador (`~/Documents/`, `Infra/data/signals.db`, data sources do Notion, etc.) restam.
- **Sem segredos**: sem `.env`, sem API keys, sem cookies de LinkedIn.
- **Testes como guardas**: um smoke test por skill verifica que ela carrega + roda com entradas mock.
- **Marca**: o nome do repo público é `skills-for-claude` (decidido 2026-05-22). "Atelier Skills" é o nome interno/de trabalho; a marca de Fase 2 para um tier pago fica adiada.

## Now / Next

**Fase 1 completa e pública.** Todos os 5 sprints feitos (bootstrap → `/spec` → `/personas` → `/audit` → lançamento público → mecanismo de gate-de-medição). O repo `github.com/MKanhan/skills-for-claude` está público e pushado (confirmado no GitHub: criado 2026-05-26, último push 2026-09-05), taggeado `sprint-01-spec`, `sprint-02-personas`, `sprint-03-audit`, `sprint-05-measure`, `v0.1.0`. As 3 skills (`/spec`, `/personas`, `/audit`) saem com READMEs bilíngues + smoke tests; CI verde no push/PR.

**Gate de medição: sinal checado, nunca formalmente fechado.** O dia 30 (~2026-06-25) passou sem `tools/measure.sh` rodar — o template de Dia-30 no `skills_log.md` segue um placeholder vazio. Checado direto contra o GitHub agora (2026-09-06, 3+ meses pós-lançamento): **0 stars, 0 issues, 0 PRs** — bate o limiar de encerramento no lado numérico. Se houve alguma menção no LinkedIn/Substack é não-verificado, e incerto de todo jeito dada a lacuna abaixo. A decisão de ramo (encerrar / estender / disparar a Fase 2) é do operador, não tomada aqui.

**Lote de anúncio: falta 1 de 4 drafts.** `outputs/posts/` tem o post PT-BR do kanhan.com.br e os dois posts de LinkedIn (EN + PT-BR), mas nenhum `en/skills-for-claude-launch.md` — o draft do ensaio EN no Substack para o qual o handoff de lançamento original apontava não está no diretório. Vale confirmar com o operador se foi escrito, publicado direto ou perdido, antes de tratar o lote de anúncio como completo ou tirar conclusões do sinal 0/0/0 acima.

**Fase 2**: não disparada — adiada, ver Escopo acima para as condições.

## Handoff

Último trabalho de verdade: sprints 00–05 da Fase 1, todos fechados 2026-05-26. Desde então, só duas passadas de arrumação (manifest da venture adicionado 2026-07-31; log destilado a 7 decisões 2026-09-05) — nenhum código de produto tocado.

**Próxima sessão, se retomar**: (1) resolver o draft EN faltante do Substack; (2) decidir o ramo de medição da Fase 1 dado o sinal 0/0/0 acima — `tools/measure.sh` (gh CLI + jq) está pronto para rodar e emite um registro pronto-pra-colar para o `skills_log.md`; (3) só se a Fase 2 disparar, decidir marca + preço do tier pago.

## Referências

- Convenção do workspace: `~/Documents/CLAUDE.md`
- Template de spec: `~/Documents/infra/docs/spec-template.md`
- Portfólio (derivado, semanal): `~/Documents/portfolio.md`
- Projetos open-source adjacentes: `~/Documents/software/prose-loop/`, `~/Documents/software/archlint/`
