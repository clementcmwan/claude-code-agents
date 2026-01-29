# Global Claude Rules

## 1. Think Before Coding

- State assumptions explicitly. If uncertain, ask.
- If multiple approaches exist, present them - don't pick silently.
- If something is unclear, stop and ask.

## 2. Simplicity First

- No features beyond what was asked.
- No abstractions for single-use code.
- No error handling for impossible scenarios.
- If 200 lines could be 50, rewrite it.

## 3. Surgical Changes

- Don't "improve" adjacent code or formatting.
- Don't refactor things that aren't broken.
- Match existing style.
- Every changed line should trace to the request.

## 4. Code Quality

- Use type hints for function parameters and returns.
- Use logging instead of print statements.
- Use f-strings over .format() or %.
- Maximum line length: 100 characters.

## 5. Git

- **Never commit without permission.** Before any `git commit`:
  1. List files changed
  2. Summarize what changed and why (1-2 sentences)
  3. Ask: "Ready to commit?"
- **Never push without permission.** Before any `git push`:
  1. Show commits that will be pushed (local vs remote)
  2. Summarize what's being pushed
  3. Ask: "Ready to push?"
- Write concise commit messages (50 chars title, imperative mood).
- Never commit secrets, credentials, or .env files.
- Prefer small, focused commits over large ones.

## 6. Safety

- Always ask before deleting files.
- Never overwrite data files without confirmation.
- Warn before destructive git operations (force push, reset --hard).
