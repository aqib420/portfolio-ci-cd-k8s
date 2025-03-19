# portfolio-ci-cd-k8s
Description
This project automates the deployment of a Flask-based portfolio website using a modern DevOps toolchain. It leverages Docker for containerization, Helm for Kubernetes templating, and GitHub Actions for CI/CD. The application is deployed across both development and production clusters using dynamic tagging strategies, ensuring streamlined workflows and continuous delivery.

Key features:

Dockerized Flask portfolio application
Helm charts for Kubernetes deployments
GitHub Actions workflows for CI (linting, testing) and CD (automatic deployments to dev/prod)
Multi-environment support (Dev & Prod)
Image retagging and promotion to production via Git tags
