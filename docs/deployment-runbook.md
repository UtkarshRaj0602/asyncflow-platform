# Deployment Runbook

## Infrastructure

```bash
cd infrastructure/terraform
terraform init
terraform fmt -recursive
terraform validate
terraform plan -var-file=environments/stage/terraform.tfvars
terraform apply -var-file=environments/stage/terraform.tfvars
```

## Application

Preferred deployment path: GitHub Actions.

The workflow builds/pushes images, configures EKS, applies manifests, runs the migration Job, updates deployments to the Git SHA and verifies rollout.

## Verification

```bash
kubectl get nodes
kubectl get pods -n asyncflow
kubectl get svc -n asyncflow
kubectl get ingress -n asyncflow
kubectl get hpa -n asyncflow
kubectl get job -n asyncflow
```

## API

```bash
kubectl exec -n asyncflow deploy/backend --   python -c "import urllib.request; print(urllib.request.urlopen('http://localhost:8000/jobs').read().decode())"
```

Submit a UI job and verify `202`, then `COMPLETED`.
