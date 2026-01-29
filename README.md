# Claude Code Agents

Custom agents for data science workflows in Claude Code.

## Agents

| Agent | Purpose | Access |
|-------|---------|--------|
| **Main-Agent** | Coordinates tasks, delegates to subagents | Full |
| **Master-Planner** | Planning & requirements analysis | Read-only |
| **Reviewer** | Static code analysis | Read-only + bash |
| **Tester** | Runtime validation | Read-only + bash |
| **Logger** | Logging & MLflow instrumentation | Full |

## new-ds-project

One-command data science project setup.

### Usage

```bash
new-ds-project <project-name> [python-version]
```

### Example

```bash
new-ds-project my-ml-project 3.11
cd my-ml-project
mamba activate my-ml-project
jupyter lab
```

### What It Creates

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

### Packages Installed

- **Core**: numpy, pandas, scikit-learn, matplotlib, seaborn
- **Jupyter**: jupyter, jupyterlab
- **Tracking**: MLflow
- **Dev**: pytest, black, flake8, autoflake, ipdb

### Requirements

- [Miniforge/Mamba](https://github.com/conda-forge/miniforge) installed

## Git Hooks

Git hooks are auto-installed with `new-ds-project`. They ensure clean, validated, minimal commits.

### pre-commit (auto-fixes code)

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

### pre-push (validates before push)

| Check | Action |
|-------|--------|
| **Pytest** | Runs tests, blocks if failing |
| **Branch** | Warns when pushing to main/master |

### Install in Existing Project

```bash
cd your-project
/path/to/claude-code-agents/hooks/install-hooks.sh
```

## Installation

```bash
# Clone the repo
git clone https://github.com/clementcmwan/claude-code-agents.git

# Symlink the script to your PATH
ln -sf /path/to/claude-code-agents/new-ds-project ~/bin/new-ds-project
```
