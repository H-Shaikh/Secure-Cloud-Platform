# Security Model & Guardrails

This document describes how security is approached in the Secure Cloud Platform project.

The focus is on **preventing common failures by design**, not relying on manual discipline or after-the-fact fixes.

---

## Security Philosophy

This project follows a simple principle:

> Credentials and sensitive data should never reach version control.

Security controls are implemented as **guardrails**, assuming human error is inevitable.

---

## Credential Handling Model

### Guiding Rule

If it authenticates access to a system, it is **never committed to Git**.

### Local-Only Credentials

The following credentials exist **only on the local machine or ephemeral lab environments**:

- AWS CLI credentials (`~/.aws/credentials`, `~/.aws/config`)
- Kubernetes kubeconfig (`~/.kube/config`)
- SSH private keys
- Environment variable files (`.env`)

These files are explicitly excluded from version control.

---

## Repository-Level Guardrails

The following GitHub security features are enabled by default:

- Secret scanning
- Push protection for detected secrets
- Dependency vulnerability alerts
- Automated security updates (where applicable)

These controls prevent accidental credential exposure **before code reaches the remote repository**.

---

## Git Hygiene Controls

### `.gitignore`

A strict `.gitignore` policy is enforced to exclude:

- Cloud credentials
- SSH private keys
- Kubernetes configuration files
- Environment variable files
- Local virtual environments and OS artifacts

Example patterns include:

- `.aws/`
- `.kube/`
- `.env`
- `*.pem`
- `.venv/`

---

### Pre-Commit Controls

Pre-commit hooks are used where applicable to:

- Prevent accidental commits of sensitive files
- Enforce basic formatting and consistency
- Reduce low-signal mistakes before push

---

## SSH Key Management

- SSH keys are generated locally per project
- Only **public keys** are uploaded to remote systems
- Private keys are never shared, committed, or reused across projects

Key reuse is intentionally avoided to reduce blast radius.

---

## Infrastructure Security Scope

### AWS Access

- Root account usage is avoided
- IAM users and roles follow least-privilege principles
- Permissions are scoped to learning requirements only
- Long-lived credentials are avoided where possible

### Network Exposure

- Early phases use public subnets by design (documented in decisions)
- Exposure is limited using security groups and restricted access
- Expanded isolation is planned for later phases

---

## Kubernetes Security Boundaries

- Kubernetes manifests are committed without embedded secrets
- Cluster access credentials are never stored in the repository
- Configuration focuses on structure, not live access

---

## Screenshots & Logs Policy

Screenshots and logs are reviewed before inclusion to ensure they do not expose:

- Tokens or credentials
- Account identifiers
- Sensitive IP addresses
- Internal system metadata

When in doubt, **documentation is preferred over screenshots**.

---

## Incident Response (Learning Context)

If a credential is ever exposed:

1. The credential is immediately rotated or invalidated
2. The commit is removed or amended
3. Guardrails are reviewed and strengthened
4. The incident is documented as a learning outcome

Mistakes are treated as system design feedback, not personal failure.

---

## Scope & Disclaimer

This project is maintained for **learning and portfolio purposes**.

- No production systems are actively running
- Infrastructure is not continuously exposed
- Security practices are demonstrated through design and documentation

---

## Static Code Analysis

- GitHub CodeQL is enabled for application code
- Used to detect common security vulnerabilities and unsafe patterns
- Findings are reviewed and addressed or documented when applicable

---

## Summary

Security in this project is achieved through:

- Prevention-first design
- Explicit exclusion of secrets
- Automated repository guardrails
- Minimal, auditable access patterns

The goal is not perfect security, but **predictable and explainable security behavior**.
