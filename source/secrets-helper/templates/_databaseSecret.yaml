{{- define "secrets-helper.databaseSecret.tpl" -}}

{{ if .Values.dbSecretName }}
# Connection info for AWS-hosted DB from AWS Secrets Manager
apiVersion: 'kubernetes-client.io/v1'
kind: ExternalSecret
metadata:
  name: {{ include "service.fullname" . }}
  labels:
{{ include "service.labels" . | indent 4 }}
spec:
  backendType: secretsManager
  # optional: specify role to assume when retrieving the data
  #roleArn: arn:aws:iam::123456789012:role/test-role
  dataFrom:
    - {{ .Values.dbSecretName }}
{{ else }}
# Connection info for kubernetes-hosted Postgres DB
apiVersion: v1
kind: Secret
metadata:
  name: {{ include "service.fullname" . }}
  labels:
{{ include "service.labels" . | indent 4 }}
type: Opaque
stringData:
  host: '{{ .Release.Name }}-aggregation-db'
  username: '{{ index .Values "aggregation-db" "postgresqlUsername" }}'
  password: '{{ index .Values "aggregation-db" "postgresqlPassword" }}'
  port: '{{ index .Values "aggregation-db" "service.port" }}'
  engine: 'postgres'
  dbname: '{{ index .Values "aggregation-db" "postgresqlDatabase" }}'
{{- end }}


{{- end -}}
{{- define "secrets-helper.databaseSecret" -}}
{{- include "secrets-helper.util.merge" (append . "secrets-helper.databaseSecrets.tpl") -}}
{{- end -}}