# Runtime Profile Boundaries

A public skills guide and a private runtime profile serve different purposes.
Keep them separate.

## Active Runtime

The active runtime is machine-local. It can contain real config, installed
skills, approval state, memories, sessions, logs, and project-specific helpers.

Do not publish it wholesale.

## Public Skills Guide

This repository should contain:

- reusable skill concepts
- safe examples
- templates
- vetting rules
- installation guidance
- public-safe operating patterns

It should not contain live runtime state.

## Public Runtime Snapshot

A public runtime snapshot can be useful as a reference, but it should stay
sanitized and minimal. It should point to this guide for long-form skill usage
guidance instead of absorbing every local detail.

## Promotion Rules

Promote material only when all are true:

- it is reusable outside the private machine
- it has no secrets, credentials, memory, logs, session history, or live state
- it has no private project details
- it has a clear public destination
- it has been reviewed manually

Do not promote:

- raw config files
- approval rules with real paths or tokens
- memory snapshots
- session logs
- telemetry and local databases
- broker state or company state
- private database helper skills
