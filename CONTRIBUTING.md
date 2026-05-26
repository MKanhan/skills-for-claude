# Contributing

Issues and PRs are welcome. Keep them small and specific.

## Issues

Open an issue when:
- A skill breaks on your setup (include OS, Claude Code version, exact invocation).
- Documentation is wrong or missing.
- You have a concrete idea for a new skill (with a real use case, not a wishlist).

## Pull requests

1. Fork the repo and create a branch from `main`.
2. Make your change. Keep the scope tight — one skill change per PR.
3. Run the relevant smoke test(s) locally:
   ```bash
   bash tests/spec/smoke.sh
   bash tests/personas/smoke.sh
   bash tests/audit/smoke.sh
   ```
4. If you're adding a new skill, add its smoke test under `tests/<skill>/`.
5. Open the PR with a one-paragraph description: what changed, why.

CI runs all smoke tests on every push. Failures block merge.

## What we will probably not merge

- New skills without smoke tests.
- Skills that hardcode user-specific paths or credentials.
- Bilingual documentation translations that read as machine-translated (PT-BR matters here — Portuguese is a first-class language, not a polish pass).
- Sweeping refactors of skills that already work.

## What we'd love to see

- Bug fixes with a regression test.
- A new skill that solves a specific, recurring problem.
- README improvements that clarify *when* to use a skill, not just *how*.

## License

By contributing, you agree your contribution will be licensed under the MIT License.
