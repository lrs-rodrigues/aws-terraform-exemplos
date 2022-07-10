env = "dev"
region = "us-east-1"

#######
### NETWORK 
######
vpc_name = "ecs-vpc-dev"
vpc_cidr_block = "172.31.0.0/16"
vpc_enable_dns_support = true
vpc_enable_dns_hostnames = true

subnets = {
    "public-us-east-1a":  {
        cidr_block = "172.31.128.0/18",
        availability_zone = "us-east-1a", 
        public_ip = true
    },
    "public-us-east-1b":  {
        cidr_block = "172.31.192.0/18", 
        availability_zone = "us-east-1b", 
        public_ip = true
    },
    "private-us-east-1a": {
        cidr_block = "172.31.0.0/18",   
        availability_zone = "us-east-1a",
        public_ip = false
    },
    "private-us-east-1b": {
        cidr_block = "172.31.64.0/18",  
        availability_zone = "us-east-1b", 
        public_ip = false
    },
}

igw_name = "ecs-igw-dev"

#######
### Security Group
######
security_group_name = "ecs-security-group-dev"
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
autoscaling_group_name = "ecs-autoscaling-group-dev"
autoscaling_group_configs = {
    desired_capacity = 2
    min_size = 1
    max_size = 3
    health_check_grace_period = 300
    health_check_type = "EC2"
    strategy = "Rolling"
    min_healthy_percentage = 50
    image_id = "ami-0cff7528ff583bf9a"
    instance_type = "t2.micro"
}


#######
### Cluster
######

cluster_name = "esc-cluster-dev"
cluster_group_provider_configs = {
    managed_termination_protection = "DISABLED"
    status = "ENABLED"
    target_capacity = 100
}

#######
### LoadBalancer
######

loadbalancer_name = "esc-loadbalancer-dev"
loadbalancer_configs = {
    internal = true
    load_balancer_type = "network"
    enable_deletion_protection = false
    loadbalancer_type = "VPCLink"
}

loadbalancer_target_group_config = {
    target_group_name = "ecs-nlb-tg-dev"
    port =  "443"
    protocol = "TCP"
    target_type = "instance"
}

loadbalancer_listener_config = {
    port = "443"
    protocol = "TCP"
    type = "forward"
}