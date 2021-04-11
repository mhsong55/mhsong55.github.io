---
title: "Azure에서 Datadog으로 Log streaming하기"
excerpt: "Azure에서 3rd-Party monitoring tool인 Datadog을 사용해보기"
categories:
  - Cloud
tags:
  - Cloud
  - Azure
  - Monitoring
  - Datadog
---

1. Metric과 Log
2. Datadog에서 Azure의 Log를 가져오는 방법
   1. Azure resource의 diagnostic log의 경우
   2. Azure Log analytics workspace에 저장된 Log의 경우

# Metric과 Log

## Metric

## Log

# Datadog에서 Azure의 Log를 가져오는 방법

## Azure resource의 diagnostic log의 경우

- 전제 : Datadog에서 Azure integration을 사용하는 설정을 모두 마쳤다고 전제한다.
- 참고 : [https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20#log-collection](https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20#log-collection)
<br>
![azure-log-streaming-diagnosis](/assets/images/2021-04-08-Azure에서-datadog으로-log-streaming/diagram-azure-log-streaming-diagnosis.png){: .align-center}

Datadog에서 Azure의 Platform log를 확인하기 위해서는 Azure에서 Event Hub와 Function을 사용해 Datadog 쪽으로 log data를 내보내주어야 한다. Datadog에서는 이를 위한 PowerShell script와 template, Azure Functions에서 실행될 Javascript 코드를 제공하고 있다. 이 방법을 사용하면 resource의 진단 설정에서 수집된 log (Azure Monitor log = Azure Log analytics log)도 Datadog 쪽에서 활용할 수 있다.

1. Azure Event hub와 Functions 배포

```PowerShell
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/DataDog/datadog-serverless-functions/master/azure/eventhub_log_forwarder/activity_logs_deploy.ps1", "activity_logs_deploy.ps1")

./activity_logs_deploy.ps1 `
    -ApiKey <api_key> `
    -SubscriptionId <subscription_id> `
    -EventHubNamespace <Unique-EventHub-Namespace> `
    -FunctionAppName <Unique-FunctionAppName> `
    -ResourceGroupLocation <Location> `
    -ResourceGroupName <resourceGroupName>
```

![activityLog-CloudShell](/assets/images/2021-04-08-Azure에서-datadog으로-log-streaming/activityLog-cloudShell.png){: .align-center}

## Azure Log analytics workspace에 저장된 Log의 경우