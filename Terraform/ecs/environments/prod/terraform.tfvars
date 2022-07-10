env = ""
region = ""

#######
### NETWORK 
######
vpc_name = ""
vpc_cidr_block = ""
vpc_enable_dns_support = true
vpc_enable_dns_hostnames = true

subnets = {
    "example":  {
        cidr_block = "",
        availability_zone = "", 
        public_ip = true
    },
}

igw_name = ""

#######
### Security Group
######
security_group_name = ""
security_group_configs = {
    "ingress": { 
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    },
    "egress": { 
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    },
}


#######
### Auto Scaling
######
autoscaling_group_name = ""
autoscaling_group_configs = {
    desired_capacity = 0
    min_size = 0
    max_size = 0
    health_check_grace_period = 0
    health_check_type = ""
    strategy = ""
    min_healthy_percentage = 0
    image_id = ""
    instance_type = ""
}


#######
### Cluster
######

cluster_name = ""
cluster_group_provider_configs = {
    managed_termination_protection = ""
    status = ""
    target_capacity = 0
}

#######
### LoadBalancer
######

loadbalancer_name = ""
loadbalancer_configs = {
    internal = true
    load_balancer_type = ""
    enable_deletion_protection = false
    loadbalancer_type = ""
}

loadbalancer_target_group_config = {
    target_group_name = ""
    port =  ""
    protocol = ""
    target_type = ""
}

loadbalancer_listener_config = {
    port = ""
    protocol = ""
    type = ""
}