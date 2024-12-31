# GCP DevOps Project

This project demonstrates a DevOps pipeline using Google Cloud Platform (GCP) to build, push, and deploy a containerized application to Google Kubernetes Engine (GKE).

## Overview

The pipeline automates the following steps:
1. **Build a Docker image** for the application.
2. **Push the image** to Google Container Registry (GCR).
3. **Deploy the image** to a GKE cluster.

The deployment includes creating a Kubernetes Deployment and exposing it via a LoadBalancer Service.

## Prerequisites

Before running the pipeline, ensure the following:
- A GCP project with GKE, GCR, and Cloud Build APIs enabled.
- A GKE cluster named `gcp-devops-project` in the `us-central1-c` zone.
- Proper IAM permissions to manage Cloud Build and GKE.
- Docker installed locally for testing (optional).

## Files

### 1. `cloudbuild.yaml`

Defines the Cloud Build pipeline for the project:

```yaml
steps:
  # Build the container image
- name: "gcr.io/cloud-builders/docker"
  args: ["build", "-t", "gcr.io/$PROJECT_ID/gcpdevops", "."]
  # Push container image
- name: "gcr.io/cloud-builders/docker"
  args: ["push", "gcr.io/$PROJECT_ID/gcpdevops"]
  # Deploy container image to GKE
- name: "gcr.io/cloud-builders/gke-deploy"
  args:
  - run
  - --filename=gke.yaml
  - --image=gcr.io/$PROJECT_ID/gcpdevops
  - --location=us-central1-c
  - --cluster=gcp-devops-project
  - --namespace=gcp-devops-prod
