# 개요
Prometheus은 EKS Infra 메트릭 수집 모니터링 툴이다.
Grafana은 수집한 메트릭 지표를 그래프화해주는 툴이다.

prometheus은 쿠버네티스에서 가장 많이 사용하는 오픈소스 모니터링 툴이다.
CNCF 제단이며, kubernetes, docker 컨테이너를 모니터링에 특화되어있다.


# 링크
자세한 내용은 블러그 참조 : https://dongwook35.tistory.com/42


# prometheus 설치
helm install prometheus . -f values.yaml -n monitor


# ingress 설치
kubectl apply -f ingress-grafana-monitoring-alb-internal.yaml
