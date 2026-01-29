# Data Science Dev Environment

A complete development environment setup for data science workflows, including Claude Code configuration, project scaffolding, code quality hooks, and terminal setup.

## Quick Start

```bash
# 1. Clone to home directory
git clone https://github.com/clementcmwan/claude-code-agents.git ~/claude-code-agents

# 2. Run install script
cd ~/claude-code-agents
./install.sh

# 3. (Optional) Install terminal setup
./tmux_setup/install.sh
```

This creates symlinks so everything works globally:

| What | Location | Effect |
|------|----------|--------|
| `new-ds-project` | ~/bin/ | Create DS projects from anywhere |
| Global rules | ~/.claude/CLAUDE.md | Claude follows rules in all projects |
| Agents | ~/.claude/agents/ | Agents available in all projects |

### Prerequisites

- [Miniforge/Mamba](https://github.com/conda-forge/miniforge)
- (Optional) GitHub CLI: `brew install gh && gh auth login`
- (Optional) Nerd Font for terminal icons

---

## What's Included

### 1. Claude Code Agents

Custom agents for data science workflows:

| Agent | Purpose | Access |
|-------|---------|--------|
| **Main-Agent** | Coordinates tasks, delegates to subagents | Full |
| **Master-Planner** | Planning & requirements analysis | Read-only |
| **Reviewer** | Static code analysis | Read-only + bash |
| **Tester** | Runtime validation | Read-only + bash |
| **Logger** | Logging & MLflow instrumentation | Full |

### 2. Global Claude Rules

Behavioral rules that apply across all projects (`claude_global_rules/CLAUDE.md`):

| Rule | Description |
|------|-------------|
| **Think First** | Ask when uncertain, present options |
| **Simplicity** | No extra features, minimal code |
| **Surgical** | Only change what's needed, match style |
| **Code Quality** | Type hints, logging, f-strings |
| **Git Commit** | Always ask permission before committing |
| **Git Push** | Always summarize and ask permission before pushing |
| **Safety** | Confirm before deleting/overwriting |

### 3. Project Scaffolding (new-ds-project)

One-command data science project setup:

```bash
new-ds-project my-ml-project 3.11
cd my-ml-project
mamba activate my-ml-project
jupyter lab
```

Creates:
```
project/
├── data/{raw,processed,external}/
├── notebooks/exploratory/
├── src/{data,features,models,visualization}/
├── models/
├── logs/
├── reports/{figures,tables}/
├── tests/
├── config/
├── environment.yml
├── requirements.txt
├── .gitignore
└── README.md
```

Packages installed:
- **Core**: numpy, pandas, scikit-learn, matplotlib, seaborn
- **Jupyter**: jupyter, jupyterlab
- **Tracking**: MLflow
- **Dev**: pytest, black, flake8, autoflake, ipdb

### 4. Git Hooks

Auto-installed with `new-ds-project`. Ensures clean, validated, minimal commits.

**pre-commit (auto-fixes code):**

| Check | Action |
|-------|--------|
| **Black** | Auto-formats Python code |
| **Autoflake** | Removes unused imports/variables |
| **Diff size** | Warns if >500 lines changed |
| **Debug statements** | Blocks `breakpoint()`, `pdb`, `ipdb` |
| **Print statements** | Warns (suggests logging) |
| **Secrets** | Blocks hardcoded passwords, API keys |
| **Large files** | Blocks files >5MB |
| **Python syntax** | Validates .py files |
| **Flake8** | Warns on remaining lint issues |

**pre-push (validates before push):**

| Check | Action |
|-------|--------|
| **Pytest** | Runs tests, blocks if failing |
| **Branch** | Warns when pushing to main/master |

Install in existing project:
```bash
~/claude-code-agents/hooks/install-hooks.sh
```

### 5. Terminal Setup (tmux)

Replicate the terminal environment:

- **tmux** - Terminal multiplexer with custom keybindings
- **powerlevel10k** - Fast zsh theme with icons
- **zsh-autosuggestions** - Fish-like suggestions
- **zsh-syntax-highlighting** - Command highlighting
- **eza** - Better `ls` with icons
- **zoxide** - Smarter `cd`

Install:
```bash
./tmux_setup/install.sh
```

**Tmux Keybindings** (Prefix = `Ctrl+b`):

| Key | Action |
|-----|--------|
| `Prefix + \|` | Split horizontal |
| `Prefix + -` | Split vertical |
| `Prefix + j/k/i/l` | Navigate panes |
| `Prefix + r` | Reload config |
