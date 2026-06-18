# Brain Tasks Application Deployment

## Project Overview

This project demonstrates a complete CI/CD pipeline for deploying the Brain Tasks application using Docker, Amazon ECR, Amazon EKS, AWS CodeBuild, AWS CodePipeline, Kubernetes, and CloudWatch.

The application was containerized, pushed to Amazon ECR, deployed to Amazon EKS, and automated through AWS CodePipeline.

---

# Architecture

GitHub Repository

↓

AWS CodePipeline

↓

AWS CodeBuild

↓

Amazon ECR

↓

Amazon EKS

↓

Kubernetes Service (LoadBalancer)

↓

Brain Tasks Application

---

# Technologies Used

* AWS EC2
* Docker
* Amazon ECR
* Amazon EKS
* Kubernetes
* AWS CodeBuild
* AWS CodePipeline
* Amazon CloudWatch
* GitHub

---

# AWS Environment

### AWS Account ID

053849129210

### AWS Region

us-east-1

### EKS Cluster

guvi-eks-cluster

### ECR Repository

brain-tasks-app

---

# Source Code Repository

GitHub Repository:

https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPOSITORY

---

# Docker Implementation

## Build Docker Image

```bash
docker build -t brain-tasks-app .
```

## Run Docker Container

```bash
docker run -d --name brain-app -p 3000:80 brain-tasks-app
```

## Verify Container

```bash
docker ps
```

---

# Amazon ECR

## Login to ECR

```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 053849129210.dkr.ecr.us-east-1.amazonaws.com
```

## Tag Image

```bash
docker tag brain-tasks-app:latest 053849129210.dkr.ecr.us-east-1.amazonaws.com/brain-tasks-app:latest
```

## Push Image

```bash
docker push 053849129210.dkr.ecr.us-east-1.amazonaws.com/brain-tasks-app:latest
```

---

# Amazon EKS

## Create Cluster

```bash
eksctl create cluster \
--name guvi-eks-cluster \
--region us-east-1 \
--nodegroup-name workers \
--nodes 2
```

## Verify Cluster

```bash
kubectl get nodes
```

Expected Output:

Two worker nodes in Ready state.

---

# Kubernetes Deployment

## Deployment Manifest

deployment.yaml

## Service Manifest

service.yaml

## Deploy Application

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Verify Pods

```bash
kubectl get pods
```

## Verify Deployment

```bash
kubectl get deployment
```

## Verify Service

```bash
kubectl get svc
```

---

# CI/CD Pipeline

## Source Stage

GitHub Repository

## Build Stage

AWS CodeBuild

Actions Performed:

* Docker Image Build
* Docker Image Tagging
* Docker Image Push to ECR
* Kubernetes Manifest Packaging

## Deploy Stage

Amazon EKS

Actions Performed:

* Kubernetes Authentication
* Deployment Update
* Service Validation

---

# Buildspec Configuration

The buildspec.yml performs:

1. Login to ECR
2. Build Docker Image
3. Tag Docker Image
4. Push Image to ECR
5. Publish deployment.yaml
6. Publish service.yaml

---

# Monitoring

Amazon CloudWatch Logs were enabled for:

* CodeBuild Logs
* CodePipeline Logs
* Deployment Logs

CloudWatch was used to monitor build and deployment activities.

---

# Application Access

## Load Balancer Name

a6f49483f767f4e87ab1f000e6acf273

## Load Balancer DNS

a6f49483f767f4e87ab1f000e6acf273-1355024068.us-east-1.elb.amazonaws.com

## Application URL

http://a6f49483f767f4e87ab1f000e6acf273-1355024068.us-east-1.elb.amazonaws.com

---

# Kubernetes Verification

Commands Used:

```bash
kubectl get nodes
kubectl get pods
kubectl get deployment
kubectl get svc
```

Results:

* Nodes Status: Ready
* Pods Status: Running
* Deployment Status: Available
* Service Type: LoadBalancer
* Application Accessible Through Load Balancer

---

# Pipeline Verification

CodePipeline Stages:

✓ Source

✓ Build

✓ Deploy

All stages completed successfully.

---

# Screenshots

Please see in the screenshots folder

---

# Conclusion

The Brain Tasks application was successfully containerized, stored in Amazon ECR, deployed to Amazon EKS, and automated using AWS CodePipeline and AWS CodeBuild. The application is accessible through a Kubernetes LoadBalancer and the entire deployment lifecycle is fully automated.

ARN::

a6f49483f767f4e87ab1f000e6acf273-1355024068.us-east-1.elb.amazonaws.com
