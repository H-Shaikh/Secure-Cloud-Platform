# Secure Cloud-Native Platform (Learning Simulation)

**Status:** Phase 1 — Core Infrastructure (Week 1)  
**Scope:** Learning simulation built alongside KodeKloud DevOps Engineer path  
**Honesty Policy:** This is pre-production practice, not a prod system. See [`decisions.md`](decisions.md) for intentional omissions.

---

## What This Repo Is

A **single, focused system** demonstrating incremental DevOps learning from Linux fundamentals to Kubernetes basics. Built to be **completed *before* CKA prep** — no scope creep, no resume-driven fluff.

**Key principle:** Every file proves a decision, not just tool usage.

---

## Repo Map

| File | What Recruiters Skim For |
| ------ | -------------------------- |
| [`architecture.md`](architecture.md) | How you think about constraints |
| [`decisions.md`](decisions.md) | Trade-off reasoning (senior signal) |
| [`failures.md`](failures.md) | Real debugging experience |
| [`security.md`](security.md) | Hygiene & blast-radius awareness |
| [`lessons-learned.md`](lessons-learned.md) | Growth trajectory |

---

## Phase 1 Progress (Week 1)

**Goal:** Stand up basic AWS VPC & understand why.

- ✅ VPC with 2 public subnets (2 AZs)
- ✅ Internet Gateway for outbound
- ✅ Documented: Why no NAT Gateway (cost, scope)

**Current infra:** `terraform/vpc/` (see `architecture.md` for diagram)

**Next (Week 2):** IAM role for EC2 + first instance launch

---

## How to Read This Project

**If you're a recruiter/hiring manager:**  
Start with [`decisions.md`](decisions.md) → [`failures.md`](failures.md). This shows engineering judgment, not tutorial copying.

**If you're a peer learner:**  
Follow the commit history. Each phase maps to KodeKloud modules. Clone, break, fix.

---

## Constraints & Scope (Important)

| Constraint | Reason |
| ---------- | ------ |
| **Single AWS region** | Learning depth > multi-cloud breadth |
| **Public subnets only (Phase 1)** | Cost control; private subnets added in Phase 3 |
| **No autoscaling** | Focus on manual troubleshooting first |
| **No CI/CD until Phase 4** | Understand manual steps before automation |

See [`decisions.md`](decisions.md) for full trade-off log.

---

## Tool Versions (Reproducibility)

- Terraform: `~&gt; 1.6`
- AWS Provider: `~&gt; 5.0`
- Instance type: `t3.micro` (Free Tier)

---

## Week 1 Evidence

### Update cadence

Update this section weekly with evidence.

![Week 1 VPC Created](./assets/week1-evidence.png)

---

## License

MIT — Free to learn from, not to copy-paste as your own.

---

- **Last Updated:** 28/12/2025 (Week 1)
- **Next Review Date:** End of Phase 1 (Week 4)
