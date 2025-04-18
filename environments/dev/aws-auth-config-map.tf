data "aws_caller_identity" "current" {}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  depends_on = [module.eks]

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = module.eks.eks_worker_role_arn
        username = "system:node:{{EC2PrivateDNSName}}"
        groups = [
          "system:bootstrappers",
          "system:nodes"
        ]
      },
      {
        rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.github_actions_terraform_role}"
        username = "terraform"
        groups   = ["system:masters"]
      }
    ])

    mapUsers = yamlencode([
      {
        userarn  = "arn:aws:iam::160885273651:root"
        username = "diana"
        groups   = ["system:masters"]
      }
    ])
  }
}
