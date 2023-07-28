- create policy

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams",
        "logs:PutLogEvents",
        "logs:PutRetentionPolicy"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}

```

- create iam user aws
- create secret key for iam user
- attach policy
- create ocp secret key/value on openshift-logging ns
- create clusterForwarder

```yaml
apiVersion: 'logging.openshift.io/v1'
kind: ClusterLogForwarder
metadata:
  name: instance
  namespace: openshift-logging
spec:
  outputs:
    - name: cw
      type: cloudwatch
      cloudwatch:
        groupBy: logType
        groupPrefix: openshift-log # prefix log group example: openshift-log.audit
        region: ap-southeast-1
      secret:
        name: cw-secret
  pipelines:
    - name: all-logs
      inputRefs:
        - infrastructure
        - audit
        - application
      outputRefs:
        - cw
```

- delete pod if cluster forwarder CRD not automatically create fluentd of new pod

```sh
oc delete pod --selector logging-infra=collector
```
