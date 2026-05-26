# `/spec` — thin specs for spec-driven sprints

> Scaffold a thin spec file (`specs/NN_slug.md`) in any project, with a bundled template. Encourages writing the spec **before** the code.

---

## English

### What it does

`/spec my_feature` creates the next-numbered spec in the project's `specs/` directory using a bundled template (Goal / Problem / Decision / In scope / Out of scope / Acceptance criteria / Test additions).

The skill detects the project root automatically by walking up from CWD looking for one of: `.git/`, an existing `specs/`, `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, or `Gemfile`. If none is found, it falls back to CWD with a warning. It refuses to run in `$HOME`.

### Install

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/spec ~/.claude/skills/spec
```

Restart Claude Code (or open a new session) and `/spec` is available.

### Usage

```
/spec auth_hardening
```

Output:

```
Created specs/03_auth_hardening.md

Next steps:
  1. Replace `<short title>` in the heading.
  2. Write Goal / Problem / Decision sections.
  3. Reference this spec in your project's CLAUDE.md / ROADMAP.
```

### Why thin specs

A spec that runs longer than ~100 lines tends to collapse into a wishlist. The bundled template enforces the discipline: name the decision, name what's out of scope, name what counts as done. If you can't check an acceptance criterion, it isn't one.

### FAQ

**Why is the template in English?** Lingua franca for the global Claude Code ecosystem. You can fork the skill and translate the bundled template if you prefer another language.

**Can I bring my own template?** Not in v0.1.0. Fork the skill and replace `templates/spec-template.md`.

**Does it work in monorepos?** Yes — the marker scan finds the nearest project root. If you want a different anchor, `cd` into the subproject before invoking.

---

## Português (Brasil)

### O que faz

`/spec my_feature` cria o próximo spec numerado em `specs/` usando um template embarcado (Goal / Problem / Decision / In scope / Out of scope / Acceptance criteria / Test additions).

A skill detecta a raiz do projeto automaticamente caminhando do CWD pra cima procurando um destes marcadores: `.git/`, `specs/` existente, `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, ou `Gemfile`. Se nada for encontrado, usa CWD com aviso. Recusa rodar em `$HOME`.

### Instalar

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/spec ~/.claude/skills/spec
```

Reinicie o Claude Code (ou abra uma nova sessão) e `/spec` fica disponível.

### Usar

```
/spec auth_hardening
```

Saída:

```
Criado specs/03_auth_hardening.md

Próximos passos:
  1. Substitua `<short title>` no heading.
  2. Escreva Goal / Problem / Decision.
  3. Referencie este spec no CLAUDE.md / ROADMAP do projeto.
```

### Por que specs enxutos

Spec longo (>100 linhas) vira wishlist. O template embarcado força a disciplina: nomeie a decisão, nomeie o que está fora de escopo, nomeie o que conta como pronto. Se você não consegue checar um critério de aceitação, ele não é um critério.

### FAQ

**Por que o template está em inglês?** Lingua franca do ecossistema Claude Code. Você pode forkar a skill e traduzir o template se preferir.

**Posso usar meu próprio template?** Não em v0.1.0. Forke a skill e substitua `templates/spec-template.md`.

**Funciona em monorepo?** Sim — o scan de marcadores encontra a raiz mais próxima. Se quiser uma âncora diferente, faça `cd` no subprojeto antes de invocar.

---

## License

MIT — see [LICENSE](../../LICENSE).
