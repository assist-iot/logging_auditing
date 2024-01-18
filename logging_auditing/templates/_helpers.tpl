{{/*
Expand the name of the chart.
*/}}
{{- define "enabler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "enabler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "enabler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "enabler.serviceAccountName" -}}
{{- if .Values.rbac.serviceAccount.create -}}
    {{ default (include "enabler.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.rbac.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Name of the component caorderer.
*/}}
{{- define "caorderer.name" -}}
{{- printf "%s-caorderer" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component caorderer name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "caorderer.fullname" -}}
{{- printf "%s-caorderer" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component caorderer labels
*/}}
{{- define "caorderer.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "caorderer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component caorderer selector labels
*/}}
{{- define "caorderer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: caorderer
isMainInterface: "no"
tier: {{ .Values.caorderer.tier }}
{{- end }}

{{/*
Name of the component caorg1.
*/}}
{{- define "caorg1.name" -}}
{{- printf "%s-caorg1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component caorg1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "caorg1.fullname" -}}
{{- printf "%s-caorg1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component caorg1 labels
*/}}
{{- define "caorg1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "caorg1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component caorg1 selector labels
*/}}
{{- define "caorg1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: caorg1
isMainInterface: "no"
tier: {{ .Values.caorg1.tier }}
{{- end }}

{{/*
Name of the component caorg2.
*/}}
{{- define "caorg2.name" -}}
{{- printf "%s-caorg2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component caorg2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "caorg2.fullname" -}}
{{- printf "%s-caorg2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component caorg2 labels
*/}}
{{- define "caorg2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "caorg2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component caorg2 selector labels
*/}}
{{- define "caorg2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: caorg2
isMainInterface: "no"
tier: {{ .Values.caorg2.tier }}
{{- end }}

{{/*
Name of the component orderer.
*/}}
{{- define "orderer.name" -}}
{{- printf "%s-orderer" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component orderer name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orderer.fullname" -}}
{{- printf "%s-orderer" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component orderer labels
*/}}
{{- define "orderer.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "orderer.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component orderer selector labels
*/}}
{{- define "orderer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: orderer
isMainInterface: "no"
tier: {{ .Values.orderer.tier }}
{{- end }}

{{/*
Name of the component orderer2.
*/}}
{{- define "orderer2.name" -}}
{{- printf "%s-orderer2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component orderer2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orderer2.fullname" -}}
{{- printf "%s-orderer2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component orderer2 labels
*/}}
{{- define "orderer2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "orderer2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component orderer2 selector labels
*/}}
{{- define "orderer2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: orderer2
isMainInterface: "no"
tier: {{ .Values.orderer2.tier }}
{{- end }}

{{/*
Name of the component orderer3.
*/}}
{{- define "orderer3.name" -}}
{{- printf "%s-orderer3" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component orderer3 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "orderer3.fullname" -}}
{{- printf "%s-orderer3" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component orderer3 labels
*/}}
{{- define "orderer3.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "orderer3.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component orderer3 selector labels
*/}}
{{- define "orderer3.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: orderer3
isMainInterface: "no"
tier: {{ .Values.orderer3.tier }}
{{- end }}

{{/*
Name of the component peer0org1.
*/}}
{{- define "peer0org1.name" -}}
{{- printf "%s-peer0org1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component peer0org1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "peer0org1.fullname" -}}
{{- printf "%s-peer0org1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component peer0org1 labels
*/}}
{{- define "peer0org1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "peer0org1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component peer0org1 selector labels
*/}}
{{- define "peer0org1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: peer0org1
isMainInterface: "no"
tier: {{ .Values.peer0org1.tier }}
{{- end }}

{{/*
Name of the component clipeer0org1.
*/}}
{{- define "clipeer0org1.name" -}}
{{- printf "%s-clipeer0org1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component clipeer0org1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clipeer0org1.fullname" -}}
{{- printf "%s-clipeer0org1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for clipeer0org1 headless service.
*/}}
{{- define "clipeer0org1.svc.headless" -}}
{{- printf "%s-headless" (include "clipeer0org1.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component clipeer0org1 labels
*/}}
{{- define "clipeer0org1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "clipeer0org1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component clipeer0org1 selector labels
*/}}
{{- define "clipeer0org1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: clipeer0org1
isMainInterface: "no"
tier: {{ .Values.clipeer0org1.tier }}
{{- end }}

{{/*
Name of the component peer0org2.
*/}}
{{- define "peer0org2.name" -}}
{{- printf "%s-peer0org2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component peer0org2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "peer0org2.fullname" -}}
{{- printf "%s-peer0org2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component peer0org2 labels
*/}}
{{- define "peer0org2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "peer0org2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component peer0org2 selector labels
*/}}
{{- define "peer0org2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: peer0org2
isMainInterface: "no"
tier: {{ .Values.peer0org2.tier }}
{{- end }}

{{/*
Name of the component clipeer0org2.
*/}}
{{- define "clipeer0org2.name" -}}
{{- printf "%s-clipeer0org2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component clipeer0org2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clipeer0org2.fullname" -}}
{{- printf "%s-clipeer0org2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the default FQDN for clipeer0org2 headless service.
*/}}
{{- define "clipeer0org2.svc.headless" -}}
{{- printf "%s-headless" (include "clipeer0org2.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component clipeer0org2 labels
*/}}
{{- define "clipeer0org2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "clipeer0org2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component clipeer0org2 selector labels
*/}}
{{- define "clipeer0org2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: clipeer0org2
isMainInterface: "no"
tier: {{ .Values.clipeer0org2.tier }}
{{- end }}


{{/*
Name of the component couchdb.
*/}}
{{- define "couchdb.name" -}}
{{- printf "%s-couchdb" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component couchdb name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "couchdb.fullname" -}}
{{- printf "%s-couchdb" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component couchdb labels
*/}}
{{- define "couchdb.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "couchdb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component couchdb selector labels
*/}}
{{- define "couchdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: couchdb
isMainInterface: "no"
tier: {{ .Values.couchdb.tier }}
{{- end }}


{{/*
Name of the job createcerts.
*/}}
{{- define "createcerts.name" -}}
{{- printf "%s-job-createcerts" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified job createcerts name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "createcerts.fullname" -}}
{{- printf "%s-job-createcerts" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
job createcerts labels
*/}}
{{- define "createcerts.labels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: createcerts
isMainInterface: "no"
tier: internal
helm.sh/chart: {{ include "enabler.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Name of the job artifacts.
*/}}
{{- define "artifacts.name" -}}
{{- printf "%s-job-artifacts" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified job artifacts name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "artifacts.fullname" -}}
{{- printf "%s-job-artifacts" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
job artifacts labels
*/}}
{{- define "artifacts.labels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: artifacts
isMainInterface: "no"
tier: internal
helm.sh/chart: {{ include "enabler.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Name of the component loggingbasicorg1.
*/}}
{{- define "loggingbasicorg1.name" -}}
{{- printf "%s-loggingbasicorg1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component loggingbasicorg1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "loggingbasicorg1.fullname" -}}
{{- printf "%s-loggingbasicorg1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component loggingbasicorg1 labels
*/}}
{{- define "loggingbasicorg1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "loggingbasicorg1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component loggingbasicorg1 selector labels
*/}}
{{- define "loggingbasicorg1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: loggingbasicorg1
isMainInterface: "no"
tier: {{ .Values.loggingbasicorg1.tier }}
{{- end }}

{{/*
Name of the component loggingbasicorg2.
*/}}
{{- define "loggingbasicorg2.name" -}}
{{- printf "%s-loggingbasicorg2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component loggingbasicorg2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "loggingbasicorg2.fullname" -}}
{{- printf "%s-loggingbasicorg2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component loggingbasicorg2 labels
*/}}
{{- define "loggingbasicorg2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "loggingbasicorg2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component loggingbasicorg2 selector labels
*/}}
{{- define "loggingbasicorg2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: loggingbasicorg2
isMainInterface: "no"
tier: {{ .Values.loggingbasicorg2.tier }}
{{- end }}

{{/*
Name of the component flbasicorg1.
*/}}
{{- define "flbasicorg1.name" -}}
{{- printf "%s-flbasicorg1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component flbasicorg1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "flbasicorg1.fullname" -}}
{{- printf "%s-flbasicorg1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component flbasicorg1 labels
*/}}
{{- define "flbasicorg1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "flbasicorg1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component flbasicorg1 selector labels
*/}}
{{- define "flbasicorg1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: flbasicorg1
isMainInterface: "no"
tier: {{ .Values.flbasicorg1.tier }}
{{- end }}

{{/*
Name of the component flbasicorg2.
*/}}
{{- define "flbasicorg2.name" -}}
{{- printf "%s-flbasicorg2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component flbasicorg2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "flbasicorg2.fullname" -}}
{{- printf "%s-flbasicorg2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component flbasicorg2 labels
*/}}
{{- define "flbasicorg2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "flbasicorg2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component flbasicorg2 selector labels
*/}}
{{- define "flbasicorg2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: flbasicorg2
isMainInterface: "no"
tier: {{ .Values.flbasicorg2.tier }}
{{- end }}


{{/*
Name of the component brokerbasicorg1.
*/}}
{{- define "brokerbasicorg1.name" -}}
{{- printf "%s-brokerbasicorg1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component brokerbasicorg1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "brokerbasicorg1.fullname" -}}
{{- printf "%s-brokerbasicorg1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component brokerbasicorg1 labels
*/}}
{{- define "brokerbasicorg1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "brokerbasicorg1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component brokerbasicorg1 selector labels
*/}}
{{- define "brokerbasicorg1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: brokerbasicorg1
isMainInterface: "no"
tier: {{ .Values.brokerbasicorg1.tier }}
{{- end }}

{{/*
Name of the component brokerbasicorg2.
*/}}
{{- define "brokerbasicorg2.name" -}}
{{- printf "%s-brokerbasicorg2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component brokerbasicorg2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "brokerbasicorg2.fullname" -}}
{{- printf "%s-brokerbasicorg2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component brokerbasicorg2 labels
*/}}
{{- define "brokerbasicorg2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "brokerbasicorg2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component brokerbasicorg2 selector labels
*/}}
{{- define "brokerbasicorg2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: brokerbasicorg2
isMainInterface: "no"
tier: {{ .Values.brokerbasicorg2.tier }}
{{- end }}

{{/*
Name of the component kvbasicorg1.
*/}}
{{- define "kvbasicorg1.name" -}}
{{- printf "%s-kvbasicorg1" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component kvbasicorg1 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kvbasicorg1.fullname" -}}
{{- printf "%s-kvbasicorg1" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component kvbasicorg1 labels
*/}}
{{- define "kvbasicorg1.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "kvbasicorg1.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component kvbasicorg1 selector labels
*/}}
{{- define "kvbasicorg1.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: kvbasicorg1
isMainInterface: "no"
tier: {{ .Values.kvbasicorg1.tier }}
{{- end }}

{{/*
Name of the component kvbasicorg2.
*/}}
{{- define "kvbasicorg2.name" -}}
{{- printf "%s-kvbasicorg2" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component kvbasicorg2 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kvbasicorg2.fullname" -}}
{{- printf "%s-kvbasicorg2" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component kvbasicorg2 labels
*/}}
{{- define "kvbasicorg2.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "kvbasicorg2.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component kvbasicorg2 selector labels
*/}}
{{- define "kvbasicorg2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: kvbasicorg2
isMainInterface: "no"
tier: {{ .Values.kvbasicorg2.tier }}
{{- end }}


{{/*
Name of the component api.
*/}}
{{- define "api.name" -}}
{{- printf "%s-api" (include "enabler.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component api name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "api.fullname" -}}
{{- printf "%s-api" (include "enabler.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Component api labels
*/}}
{{- define "api.labels" -}}
helm.sh/chart: {{ include "enabler.chart" . }}
{{ include "api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component api selector labels
*/}}
{{- define "api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "enabler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
enabler: {{ .Chart.Name }}
app.kubernetes.io/component: api
isMainInterface: "yes"
tier: {{ .Values.api.tier }}
{{- end }}