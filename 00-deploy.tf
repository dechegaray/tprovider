provider "shipa" {
  host = "https://target.shipa.cloud:8081"
  token = var.shipa_token
}

resource "shipa_framework" "tf-framework" {
  framework {
    name = var.framework_name
    provisioner = "kubernetes"
    resources {
      general {
        setup {
          public = false
          default = false
        }
        security {
          disable_scan = true
        }
        router = "istio"
        app_quota {
          limit = "5"
        }
        access {
          append = ["shipa-team"]
        }
        plan {
          name = "shipa-plan"
        }
        container_policy {
          // allowed_hosts = ["docker.io/shipasoftware", "docker.io/shiparepo"]
          allowed_hosts = []
        }
      }
    }
  }
}

resource "shipa_cluster" "tf-cluster" {
  depends_on = [shipa_framework.tf-framework]
  cluster {
    name = var.cluster_name
    endpoint {
      addresses = [var.cluster_ip]
      ca_cert = var.cluster_cacert
      token = var.cluster_token
    }
    resources {
      frameworks {
        name = [var.framework_name]
      }
      ingress_controllers {
        type = "istio"
        service_type = "istio"
        ingress_ip = var.ingress_ip
      }
    }
  }
}

resource "shipa_app" "tf-app" {
  depends_on = [shipa_cluster.tf-cluster]
  app {
    name = var.app_name
    teamowner = "shipa-team"
    framework = var.framework_name
  }
}

resource "shipa_app_deploy" "tf-app-deploy" {
  depends_on = [shipa_app.tf-app]
  app = shipa_app.tf-app.app[0].name
  deploy {
    // image = var.app_image
    image = format("docker.io/shipasoftware/:%s", var.app_image)
  }
}