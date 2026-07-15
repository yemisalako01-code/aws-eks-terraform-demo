# Prometheus with custom scraping configs
resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  namespace  = "monitoring"
  create_namespace = true
  
  values = [
    """
    prometheus:
      prometheusSpec:
        serviceMonitorSelectorNilUsesHelmValues: false
        additionalScrapeConfigs:
          - job_name: 'custom-app'
            static_configs:
              - targets: ['app-service:8080']
    grafana:
      adminPassword: "SecurePassword123!"
    """
  ]
}