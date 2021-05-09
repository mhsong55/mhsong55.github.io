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

# Application Gateway란?

<div class="notice--info" markdown="1">
**[MS Docs]** [Application Gateway란?](https://docs.microsoft.com/ko-kr/azure/application-gateway/overview)
</div>

- [https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-faq](https://docs.microsoft.com/ko-kr/azure/application-gateway/application-gateway-faq)



Azure에서 제공하는 Layer 7 load balancer로 Web application에 대한 Traffic을 관리할 수 있도록 하는 Web Traffic Load Balancer resource이다. AWS에서는 유사한 기능을 하는 resource를 Application Load Balancer(ALB)라고 부른다. 

기존의 Laod balancing 장치는 Transport layer (OSI layer 4 - TCP & UDP)에서 작동하고 원본 IP 주소와 Port를 기반으로 대상 IP 주소와 Port에 Traffic을 Routing하지만 Application gateway는 Packet의 내용을 확인하고 그 내용에 따라 Traffic을 특정 서버에 분배하는 과정을 추가로 거친다. 때문에 L4 load balancing 외에도 URI 경로 또는 Host Header와 같은 HTTP 추가 특성 (URI, Cookie 등)을 기반으로 Routing 결정을 내릴 수 있다.

예를 들어, URL을 기반으로 Traffic routing이 가능하다. `/images` 가 request의 URL에 포함되어 있는 경우 image에 대해 구성된 Server (pool)의 특정 집합으로 traffic을 routing하거나, `/videos`가 URL에 포함된 경우 해당 traffic은 비디오에 최적화된 다른 Pool로 routing이 가능하다.

또한 HTTP Request의 Cookie 값에 따라 특정 Server에 Traffic을 분산하는 등 Client의 요청을 보다 세분화해 Server에 전달하거나 Azure WAF를 붙여서 비정상적인 Traffic을 Filtering 하는 것도 가능하다.

현재 지원하는 L7 protocol 은 HTTP, HTTPS, WebSocket, HTTP/2 이며 L4 부하 분산 알고리즘은 Round-Robin 알고리즘을 사용한다.

# 구성요소

![AppGW-Component-02](/assets/images/2021-02-26-Application-Gateway/AppGW-Component.png){: .align-center}

## Listener

연결 요청을 확인하는 Logical entity이다. Protocol, Port, Hostname, IP address가 Listener의 구성과 일치하는 Request를 수락한다. Internet 구간의 통신에서 사용하는 인증서를 저장한다.

## Routing Rule

Routing 방법을 결정하는 구성 요소로 Listener, Backend Pool, Backend http configuration을 binding한다. Binding된 Listener로 들어오는 request를 Backend pool로 routing하거나 redirection하도록 설정할 수 있다.

## HTTP Configuration

HTTP Configuration은 Backend와의 통신 방식, 인증서 등을 저장하는 Object이다. HTTP Configuration에서 지정할 수 있는 설정은 아래와 같다.

- **Cookie 기반 선호도**

  Host Header의 Cookie 값을 사용해 사용자 Session을 동일한 Server에 유지

- **Hostname 재정의**

  Packet의 Host Header를 rewriting 할지에 대한 설정

- **Backend 경로 재정의**

  특정 경로(URL)에 대한 요청이 다른 경로로 routing 될 수 있도록 URL의 경로를 재정의 
  
- **사용자 지정 Probe**

  Backend의 상태를 체크하는 사용자 지정 Probe를 mapping

## Health Probe

Backend의 상태를 확인하기 위해 정기적으로 backend와 통신하는 Component이다. L4 Load Balancer에도 존재하는 Component이며 backend와 Health Probe가 통신이 안되는 `unhealthy` 상태인 경우에는 해당 backend server에 문제가 생긴 것이므로 이런 경우 해당 backend는 Application gateway의 backend pool에서 자동으로 제외하고 나머지 backend에만 traffic을 routing한다. HTTP Configuration과 mapping된다.

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