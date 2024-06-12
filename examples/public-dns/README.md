# Readme

* When var.deploy_nginx_ingress = false, it will deploy single Pod deployment, and create a cloud load balancer for that deployment.
* It will create a certificate for wandb.gcp.msk.pub, but it will not map the load balancer hostname to the domain name. This has to be done manually.
* The create upcloud certificate resource has to be mapped to the frontend config of the load balancer. The Upcloud Terraform Resources and the annotation config did not work.



