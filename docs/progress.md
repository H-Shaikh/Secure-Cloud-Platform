# Project Progress Log

This document tracks the incremental progress of the Secure Cloud Platform project.
It exists to record **learning progression**, not final design decisions.

---

## Phase 1 — Core Infrastructure (Week 1)

Status: Phase 1 - Core Infrastructure (Week 1)

Scope: Learning simulation built alongside KodeKloud DevOps Engineer path

### Goals

- Stand up basic AWS VPC
- Understand networking fundamentals and trade-offs

### Completed

- VPC with 2 public subnets across 2 AZs
- Internet Gateway for outbound access
- Decision documented: No NAT Gateway (cost vs scope)

### Evidence

![Week 1 VPC Created](../assets/week1-evidence.png)

### Tooling

- Terraform ~> 1.6
- AWS Provider ~> 5.0
- Instance type: t3.micro

---

## Next Phase

- IAM role for EC2
- First instance launch

---

## Last updated: 28/12/2025_
