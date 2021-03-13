---
title: "[Azure] Application Gateway"
excerpt: "Azure에서 제공하는 L7 Load Balancer Resource"
categories:
  - Azure
tags:
  - Cloud
  - Network
  - Azure
---

<br>
![application-gateway-logo](/assets/images/2021-02-26-Application-Gateway/application-gateway-title-image.png){: .align-center}
<br>

# Application Gateway

- [https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-faq](https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-faq)

Layer 7 load balancer이며 AWS에서는 Application Load Balancer(ALB)라고 부른다. L7 protocol 중 웹 트래픽 (HTTP, HTTPS, WebSocket, HTTP/2)를 지원하며 부하 분산 알고리즘으로는 round robin을 지원한다.

## Application layer (L7) load balancing

- [https://velog.io/@makeitcloud/란-L4-load-balancer-vs-L7-load-balancer-란](https://velog.io/@makeitcloud/란-L4-load-balancer-vs-L7-load-balancer-란)
- [https://www.nginx.com/resources/glossary/layer-7-load-balancing/](https://www.nginx.com/resources/glossary/layer-7-load-balancing/)

Application Layer (L7)에서 부하를 분산한다. 따라서 L3의 IP, L4의 Port 정보 뿐만 아니라 HTTP data (URI, Cookie, HTTP Header 등)을 기반으로 routing할 수 있다. 이는 Packet의 내용을 확인하고 그 내용에 따라 로드를 특정 서버에 분배하는 것이 가능함을 의미한다. 예를 들어, URI나 HTTP Header의 Cookie 값에 따라 특정 서버에 traffic을 분산하는 등 Client의 요청을 보다 세분화해서 서버에 전달하거나 특정 패턴을 가진 바이러스 탐지, DoS/DDoS 등의 비정상적인 트래픽을 필터링할 수 있다. Azure에서는 WAF 정책을 구성해 적용할 수 있게 되어 있다.

## Application Gateway 구성 요소

- [https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-components](https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-components)


## Application Gateway 작동 원리

- [https://docs.microsoft.com/ko-kr/azure/application-gateway/how-application-gateway-works](https://docs.microsoft.com/ko-kr/azure/application-gateway/how-application-gateway-works)

## SKU

- [https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-autoscaling-zone-redundant](https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-autoscaling-zone-redundant)

![Application-Gateway-SKU](/assets/images/2021-02-26-Application-Gateway/Application-Gateway-sku.png){: .align-center}