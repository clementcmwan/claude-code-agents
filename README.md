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
- **Dev**: pytest, black, flake8, ipdb

### Requirements

- [Miniforge/Mamba](https://github.com/conda-forge/miniforge) installed

## Installation

```bash
# Clone the repo
git clone https://github.com/clementcmwan/claude-code-agents.git

# Symlink the script to your PATH
ln -sf /path/to/claude-code-agents/new-ds-project ~/bin/new-ds-project
```
