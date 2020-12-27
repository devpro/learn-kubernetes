# Kubernetes Job object

A [**Job**](https://kubernetes.io/docs/concepts/workloads/controllers/job/) creates one or more Pods and ensures that a specified number of them successfully terminate. As pods successfully complete, the Job tracks the successful completions. When a specified number of successful completions is reached, the task (ie, Job) is complete. Deleting a Job will clean up the Pods it created.
