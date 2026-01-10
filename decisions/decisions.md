# Architecture & Design Decisions

This document records **intentional architectural and security decisions** made during the design of the Secure Cloud Platform project.

The goal is to make trade-offs explicit and auditable, not to claim perfection.
Decisions are revisited as scope evolves.

---

## Design Constraints

The following constraints were intentionally applied to control scope, cost, and learning focus:

| Constraint | Rationale |
| ---------- | ----------- |
| Single AWS region | Prioritize depth of understanding over multi-region complexity |
| Limited service surface | Focus on core infrastructure fundamentals before adding managed services |
| Cost-sensitive design | Avoid unnecessary services that do not contribute to learning outcomes |
| Manual-first approach | Understand failure modes before introducing automation |
| Security-first defaults | Prevent credential leaks and reduce blast radius by design |

These constraints are **deliberate**, not accidental limitations.

---

## Decision 1: Public Subnets Only (Phase 1)

### Context

Initial infrastructure focuses on networking fundamentals and basic resource provisioning.

### Decision

Phase 1 uses **public subnets only**, with no private subnets or NAT Gateway.

### Rationale

- No private workloads in early phases
- NAT Gateway cost is disproportionate to current scope
- Public subnets simplify troubleshooting and visibility
- Learning focus is on VPC fundamentals, not traffic optimization

### Trade-offs Accepted

- Reduced isolation compared to private subnet design
- Increased exposure risk (mitigated by security groups and limited access)

### Revisit Criteria

This decision will be revisited when:

- Private workloads are introduced
- Outbound-only access is required
- Cost trade-offs are justified by scope

---

## Decision 2: No NAT Gateway in Early Phases

### Context

A NAT Gateway was considered for private subnet egress.

### Decision

NAT Gateway is **intentionally excluded** in early phases.

### Rationale

- Ongoing cost without corresponding learning value
- No workloads require private outbound access yet
- Simplifies architecture during foundational learning

### Trade-offs Accepted

- Private subnet patterns are deferred
- Some real-world architectures are not yet modeled

### Revisit Criteria

Introduce NAT Gateway when:

- Private subnets are added
- Security boundaries require outbound-only traffic
- Cost-benefit aligns with project scope

---

## Decision 3: Infrastructure as Code with Terraform

### Context

Infrastructure can be provisioned manually or via code.

### Decision

All infrastructure is defined using **Terraform**.

### Rationale

- Enables repeatability and version control
- Encourages declarative thinking
- Aligns with industry-standard practices
- Simplifies teardown and rebuild during learning

### Trade-offs Accepted

- Initial learning curve
- Slower early progress compared to console-driven setup

---

## Decision 4: Minimal Automation in Early Phases

### Context

CI/CD and automation can obscure underlying system behavior.

### Decision

Automation is intentionally **minimal** in early phases.

### Rationale

- Manual execution builds intuition for failure modes
- Reduces abstraction during foundational learning
- Prevents blind trust in pipelines

### Trade-offs Accepted

- Slower iteration speed
- More manual steps initially

### Revisit Criteria

Automation will increase when:

- Core workflows are well understood
- Failure handling has been documented
- CI adds clarity rather than hiding complexity

---

## Decision 5: Security Guardrails Over Manual Discipline

### Context

Human error is inevitable, especially in solo projects.

### Decision

Security is enforced via **guardrails**, not personal discipline.

### Implementations

- GitHub secret scanning and push protection enabled
- Strict `.gitignore` rules
- No credentials committed to version control
- Example config files used instead of real secrets

### Rationale

- Prevents accidental leaks
- Mirrors real-world DevSecOps practices
- Reduces reliance on memory and caution

---

## Decision Review Policy

- Decisions are documented when they affect **security, cost, or architecture**
- Revisions are allowed and encouraged
- Superseded decisions are updated, not erased

This document represents **current intent**, not final state.
