# Incident Runbook

## API unavailable

```bash
kubectl get pods -n asyncflow
kubectl get svc -n asyncflow
kubectl get ingress -n asyncflow
kubectl logs -n asyncflow deploy/backend --tail=100
```

## Worker not processing

```bash
kubectl get pods -n asyncflow
kubectl logs -n asyncflow deploy/worker --tail=100
kubectl get configmap worker-config -n asyncflow -o yaml
```

Verify SQS permissions and queue configuration.

## ImagePullBackOff

```bash
kubectl describe pod <pod> -n asyncflow
```

Check image name/tag, ECR account/region and pull permissions. Prefer commit SHA tags.

## Migration failure

```bash
kubectl describe job asyncflow-db-migration -n asyncflow
kubectl logs job/asyncflow-db-migration -n asyncflow
```

Check image, database endpoint, credentials, network access and Alembic revision chain.

## Redis

```bash
kubectl exec -n asyncflow deploy/worker --   python -c "import os,redis; r=redis.Redis(host=os.environ['REDIS_HOST'],port=int(os.environ.get('REDIS_PORT',6379)),socket_connect_timeout=5); print(r.ping())"
```

## General rule

Capture logs/events first, diagnose second, change third.
