# Copilot instructions (secure-cloud-platform)

## What this repo is
- Platform-first DevSecOps learning simulation (see `README.md` + `PortfolioPlan.md`). Don’t invent components that don’t exist yet.
- **Honesty policy:** this is pre-production practice, not a real prod platform; document intentional omissions and trade-offs in `decisions/decisions.md`.
- Documentation is part of the product: update rationale + learnings alongside code.

## Honesty & evidence
- Don’t claim controls, automation, or deployments exist unless they’re present in the repo (or you add them in the same change).
- Prefer documenting progress with repo artifacts (Terraform/K8s code, workflows, decision records) over screenshots or hand-wavy statements.
- CI is currently WIP (see `.github/workflows/validate.yml`, currently empty); don’t describe linting/scanning gates as implemented unless you add them.

## First files to read before changes
- `README.md` (current phase/scope + tool versions)
- `decisions/decisions.md` (trade-offs; add a new decision when you change direction)
- `security/security.md` (security posture notes)
- `failures.md` (incident template; fill it when you troubleshoot)
- `architecture-overview.md` (high-level architecture; keep it in sync)

## Repo structure (current)
- Terraform lives in `terraform/` split by area: `terraform/vpc/`, `terraform/iam/`, `terraform/compute/` (currently placeholders via `.gitkeep`).
- Kubernetes manifests live in `kubernetes/` (`base/`, `workloads/`, `troubleshooting/`) and are currently placeholders.
- CI workflows are WIP; `.github/workflows/validate.yml` exists but is empty.

## Conventions for adding infra code (important)
- Keep changes minimal and aligned to the existing folder layout; don’t rename/move to an `infra/` tree unless explicitly requested.
- When adding Terraform:
  - Prefer one concern per folder (VPC/IAM/compute); create `main.tf`, `variables.tf`, `outputs.tf` as needed.
  - Generate module docs using `terraform-docs` (pre-commit hook is configured).
- When adding Kubernetes YAML, place reusable baseline resources under `kubernetes/base/` and app-like manifests under `kubernetes/workloads/`.

## Security/ops guardrails (repo-specific)
- Never add secrets, credentials, kubeconfigs, or Terraform state/vars files; `.gitignore` explicitly blocks these.
- Pre-commit is configured for secret scanning (`awslabs/git-secrets`) and Terraform docs (`terraform-docs`). Prefer running it locally.

## Practical local commands
- Run hooks: `pre-commit run -a`
- Format Terraform: `terraform fmt -recursive`
- Work in a module folder: `terraform -chdir=terraform/vpc init` then `terraform -chdir=terraform/vpc plan`
