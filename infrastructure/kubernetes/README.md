# Kubernetes

Application namespace:

```text
asyncflow
```

## Workloads

- frontend — React/Nginx
- backend — FastAPI
- worker — SQS consumer
- asyncflow-db-migration — Alembic Job

## Services

Frontend and backend use internal ClusterIP services. The backend exposes port 80 to target port 8000.

## Ingress

The AWS Load Balancer Controller reconciles the Kubernetes Ingress into an AWS Application Load Balancer.

## Configuration

ConfigMaps contain non-secret configuration. External Secrets supplies sensitive values from AWS Secrets Manager.

## Verification

```bash
kubectl get nodes
kubectl get pods -n asyncflow
kubectl get svc -n asyncflow
kubectl get ingress -n asyncflow
kubectl get job -n asyncflow
kubectl get hpa -n asyncflow
```
