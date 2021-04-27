# This is a Helm Chart for Mosquitto.

1. You can generate the K8s YAML manifests via:
```
helm install --dry-run --debug -f values-example-consenses.yaml mosquitto . > k8s-mosquitto.yaml
```

2. Clean up the resulting `k8s-mosquitto.yaml` as it contains additional text.

3. Use the k8s2adt tool to generate the Micado manifest.


