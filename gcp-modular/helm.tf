# A default (non-aliased) provider configuration for "helm"
provider "helm" {
  kubernetes {
    host                   = (data.external.get_cluster.result != null) ? data.external.get_cluster.result["endpoint"] : ""
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = (data.external.get_cluster.result != null) ? base64decode(data.external.get_cluster.result["ca_certificate"]) : ""
  }
}