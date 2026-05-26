# `/audit` — codebase health report

> Read-only audit: dead code, stale docs, drifted memory. Reports issues; never modifies code. Useful before a refactor or release.

---

## English

### What it does

`/audit` scans the current project for:

1. **Dead code** — unused imports, unreferenced functions, orphan files.
2. **Docs drift** — claims in `CLAUDE.md` / `README.md` that no longer match the code.
3. **Test surface** — test files referencing removed code paths or fixtures.
4. **Memory drift** (opt-in, `--memory <path>`) — stale entries in Claude's persistent memory.

Output is a markdown report. By default it goes to stdout. The skill never modifies code, never commits, never deletes files — it only reports. You decide what to fix.

### Install

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/audit ~/.claude/skills/audit
```

Restart Claude Code (or open a new session) and `/audit` is available.

### Usage

```
/audit                           # report to stdout
/audit --out audit-2026-05.md    # report to file
/audit --memory ~/.claude/memory # include memory drift section
/audit --deep                    # deeper semantic analysis (slower)
```

Combine flags as needed:

```
/audit --memory ~/.claude/memory --out audit.md --deep
```

### When to run it

- **Before a refactor** — know what dead code is sitting in your way before you start moving things.
- **Before a release** — catch docs claims that no longer hold.
- **After a long lull** — when you come back to a project after weeks away, the audit surfaces what changed underneath you.
- **NOT on every commit** — this isn't a linter. Heuristic, sometimes noisy.

### FAQ

**Why not auto-fix?** Dead-code heuristics have false positives. A function referenced only by a test fixture, a dynamic dispatch, an entry point invoked by external tooling — all look "unused" to a static scan. The report names paths; you decide.

**Why is memory check opt-in?** Most users don't run Claude with persistent memory. Defaulting to scan would error or scan the wrong path.

**What does `--deep` actually do?** Routes to a more powerful model for semantic analysis (logic errors, architectural drift). Slower and more expensive; only use when you suspect non-obvious problems.

---

## Português (Brasil)

### O que faz

`/audit` escaneia o projeto atual procurando:

1. **Código morto** — imports não usados, funções não referenciadas, arquivos órfãos.
2. **Drift de docs** — afirmações no `CLAUDE.md` / `README.md` que não batem mais com o código.
3. **Superfície de testes** — testes referenciando código removido ou fixtures inexistentes.
4. **Drift de memória** (opt-in, `--memory <path>`) — entradas stale na memória persistente do Claude.

Saída em markdown. Default vai pro stdout. A skill nunca modifica código, nunca commita, nunca deleta — só reporta. Você decide o que corrigir.

### Instalar

```bash
git clone https://github.com/MKanhan/skills-for-claude.git ~/skills-for-claude
ln -s ~/skills-for-claude/skills/audit ~/.claude/skills/audit
```

Reinicie o Claude Code e `/audit` fica disponível.

### Usar

```
/audit                           # report pro stdout
/audit --out audit-2026-05.md    # report pra arquivo
/audit --memory ~/.claude/memory # inclui seção de drift de memória
/audit --deep                    # análise semântica profunda (mais lenta)
```

### Quando rodar

- **Antes de um refactor** — saber que código morto está no caminho antes de começar a mexer.
- **Antes de release** — pegar afirmações no doc que não valem mais.
- **Depois de um hiato longo** — quando volta a um projeto após semanas, o audit surfaceia o que mudou sob você.
- **NÃO em todo commit** — não é linter. Heurístico, às vezes ruidoso.

### FAQ

**Por que não auto-fix?** Heurísticas de código morto têm falsos positivos. Função referenciada só por fixture de teste, dispatch dinâmico, entry point invocado por ferramenta externa — tudo isso parece "não usado" pra scan estático. O report nomeia caminhos; você decide.

**Por que memory check é opt-in?** A maioria não roda Claude com memória persistente. Default scan erraria ou escanearia path errado.

**O que `--deep` faz?** Roteia pra modelo mais poderoso pra análise semântica (erros de lógica, drift arquitetural). Mais lento e caro; só use quando suspeita de problema não-óbvio.

---

## License

MIT — see [LICENSE](../../LICENSE).
