# Kubernetes CronJob object

A [**CronJob**](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) creates Jobs on a repeating schedule.

## Command line examples

```bash
# create a CronJob
kubectl create cronjob my-cron --image=busybox --schedule="*/5 * * * *" -- echo hello

# update a CronJob
kubectl edit cronjob/my-cron

# update a CronJob with a specific IDE
KUBE_EDITOR="nano" kubectl edit cronjob/my-cron

# delete a CronJob
kubectl delete cronjob my-cron
```

## Manifest examples

- Run busybox container that will wait for 3 seconds, every 2 minutes

```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: sleepy
spec:
  schedule: "*/2 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: resting
              image: busybox
              command: ["/bin/sleep"]
              args: ["3"]
          restartPolicy: Never
```
