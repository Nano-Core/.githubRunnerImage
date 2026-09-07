# Nano GitHub Runner Image
[![Build Image](https://github.com/Nano-Core/.githubRunnerImage/actions/workflows/build-image.yml/badge.svg)](https://github.com/Nano-Core/.githubRunnerImage/actions/workflows/build-image.yml)
![Latest Image](https://img.shields.io/badge/ghcr-latest-blue)
![GitHub Release Date](https://img.shields.io/github/release-date-pre/Nano-Core/.githubRunnerImage)
![GitHub License](https://img.shields.io/github/license/Nano-Core/.githubRunnerImage)

> _Custom GitHub Actions runner for Nano deployments._

***

## Table of Contents
* **[Summary](#summary)**
* **[Included Tools](#included-tools)**
* **[Usage](#usage)**

## Summary
Image for use with **[Nano.Azure.Kubernetes.GitHubRunner](https://github.com/Nano-Core/Nano.Azure.Kubernetes/tree/master/Nano.Azure.Kubernetes.GitHubRunner#nanoazurekubernetesgithubrunner)**.

This repository contains a custom GitHub Actions runner image used for deploying Nano applications and Kubernetes components. It is based on the upstream image `myoung34/github-runner:ubuntu-noble` 
and extends it with additional tooling required for Nano deployment and infrastructure workflows. This approach ensures compatibility with GitHub Actions runner behavior while allowing additional 
tooling to be included as needed.

> 📖 Learn more about the underlying **[GitHub Actions runner base image](https://github.com/myoung34/docker-github-actions-runner)** used for this runner.

## Included Tools
The image includes the following additional preinstalled tools compared to the base image:

| Tool                         | Command          | Description                                  |
| ---------------------------- | ---------------- | -------------------------------------------- |
| Azure CLI                    | `az`             | Azure management CLI                         |
| Kubernetes CLI               | `kubectl`        | Kubernetes cluster management tool           |
| Helm                         | `helm`           | Kubernetes package manager                   |
| .NET 10 SDK                  | `dotnet`         | .NET development SDK and runtime             |
| EF Core Tools 10.x           | `dotnet-ef`      | Entity Framework Core migrations tool        |
| MySQL client                 | `mysql`          | MySQL database CLI                           |
| PostgreSQL client            | `psql`           | PostgreSQL database CLI                      |
| SQL Server tools             | `sqlcmd`         | SQL Server command-line tools                |
| PowerShell SqlServer Module  | `Invoke-Sqlcmd`  | PowerShell module for querying SQL Server    |

> ⚠️ EF Core Tools are installed to a fixed path (`/opt/ef-tools/<version>/dotnet-ef`), not added to `PATH`, so workflows invoke it via the full path.

## Usage
This image is intended to be used as a self-hosted GitHub Actions runner in Azure Container Apps environments for Nano infrastructure and deployment pipelines. It supports deploying Nano applications, 
managing Kubernetes workloads, and handling database and infrastructure operations.
