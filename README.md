# Nano GitHub Runner Image
[![Build Image](https://github.com/Nano-Core/.githubRunnerImage/actions/workflows/build-image.yml/badge.svg)](https://github.com/Nano-Core/.githubRunnerImage/actions/workflows/build-image.yml)
![Latest Image](https://img.shields.io/badge/ghcr-latest-blue)
![GitHub Release Date](https://img.shields.io/github/release-date-pre/Nano-Core/.githubRunnerImage)
![GitHub License](https://img.shields.io/github/license/Nano-Core/.githubRunnerImage)

> _Custom GitHub Actions runner for Nano deployments._

***

Image for use with **[Nano.Azure.Kubernetes.GitHubRunner](https://github.com/Nano-Core/Nano.Azure.Kubernetes/tree/master/Nano.Azure.Kubernetes.GitHubRunner#nanoazurekubernetesgithubrunner)**.

This repository contains a custom GitHub Actions runner image used for deploying Nano applications and Kubernetes components. It is based on the upstream image `myoung34/github-runner:ubuntu-noble` 
and extends it with additional tooling required for Nano deployment and infrastructure workflows. This approach ensures compatibility with GitHub Actions runner behavior while allowing additional 
tooling to be included as needed.

> 📖 Learn more about the underlying **[GitHub Actions runner base image](https://github.com/myoung34/docker-github-actions-runner)** used for this runner.

The image includes the following additional preinstalled tools compared to the base image:

| Tool               | Command   | Description                        |
| ------------------ | --------- | ---------------------------------- |
| Azure CLI          | `az`      | Azure management CLI               |
| Kubernetes CLI     | `kubectl` | Kubernetes cluster management tool |
| MySQL client       | `mysql`   | MySQL database CLI                 |
| SQL Server tools   | `sqlcmd`  | SQL Server command-line tools      |
| PostgreSQL client  | `psql`    | PostgreSQL database CLI            |
| .NET 10 SDK        | `dotnet`  | .NET development SDK and runtime   |
| EF Core Tools 10.x | `dotnet`  | Entity Framework Tools             |
| Docker Tools       | `docker`  | Docker Tools                       |

This image is intended to be used as a self-hosted GitHub Actions runner in Azure Container Apps environments for Nano infrastructure and deployment pipelines. It supports deploying Nano applications, 
managing Kubernetes workloads, and handling database and infrastructure operations.
