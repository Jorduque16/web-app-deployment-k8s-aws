# Web Application Deployment K8S with AWS

## Introduction
This project demonstrates the deployment of a scalable and highly available web application using Kubernetes and AWS. 
The project covers setting up an EKS cluster, deploying the application with best practices for configuration, secrets 
management, and horizontal scaling. It also includes integration with AWS services like RDS for database management and
Route 53 for DNS configuration.

## Table of Contents

1. [Requirements](#requirements)
2. [Installation and Configuration](#installation-and-configuration)
3. [Deployment and Execution](#deployment-and-execution)
4. [Technical Details](#technical-details)
5. [Usage and Testing](#usage-and-testing)
6. [Monitoring and Maintenance](#monitoring-and-maintenance)
7. [Contributing](#contributing)

## Requirements
- AWS account
- AWS CLI
- kubectl
- eksctl
- Docker

## Installation and Configuration

### 1. Configure AWS CLI

WIP

### 2. Installation and Configuration

WIP

### 3. Deployment and Execution

WIP

### 4. Technical Details

Architecture
The project uses the following components:

- Kubernetes: Manages the deployment and scaling of the application.
- AWS EKS: Provides a managed Kubernetes service.
- AWS RDS: Manages the database.
- AWS Route 53: Manages DNS for the custom domain.
- AWS ALB: Acts as the ingress controller.

Kubernetes Components
- Pods: Smallest deployable units.
- Deployments: Ensure the desired state of pods.
- Services: Expose the application to external traffic.
- Ingress: Manage external access to services.

AWS Services
- Amazon EKS: For the Kubernetes cluster.
- Amazon RDS: For database management.
- Amazon Route 53: For DNS configuration.
- AWS ALB: For load balancing.

### 5. Usage and Testing
WIP
### 6. Monitoring and Maintenance

Monitoring
- Prometheus: Set up Prometheus to collect metrics.
- Grafana: Visualize metrics using Grafana dashboards.

Maintenance
- Scaling: Use Horizontal Pod Autoscaler to manage scaling.
- Updates: Apply rolling updates to deploy new versions without downtime.

### 7. Contributing

How to Contribute
Feel free to submit pull requests or open issues if you find bugs or want to contribute to the project.

Fork the repository
Create a new branch (git checkout -b feature-branch)
Commit your changes (git commit -m 'Add new feature')
Push to the branch (git push origin feature-branch)
Open a Pull Request

