# ECS Infraestrutura

## Introdução

Exemplo em Terraform para provisonamento de um cluster ECS (EC2) com Network Load Balancer.

## Passo a Passo

### 1 - VPC

VPC tem como objetivo criar uma rede virtual para os nossos recursos na AWS. Iremos alocar um endereço para roteamento CIDR de número "172.31.0.0/16".

#### Materias de Apoio

1. AWS VPC - <https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/what-is-amazon-vpc.html>
2. Terraform VPC - <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc>

### 2 - Subnets

Subnets tem como objetivo criar intervalos de enderços IP em uma VPC. Iremos alocar duas subnets para conexão com internet e outras duas subnets para não conexão com a internet. Cada subnet está vinculada a uma zona de disponibilida (Availability Zone) e terá um intervalo de endereço IP.

Para encontrar o intervalo correto de endereços IPs, utilize a calculadora de IPs disponibilizada no item 4 em "Materias de Apoio".Utilize o intervalo de entenderço alocado na VPC como base. Coloque o intervalo de mascaras de 16 até 18 e será retornado quatro intervalos de IPs. Você pode fazer isso para qualquer endereço IP.

* 172.31.0.0/18
* 172.31.64.0/18
* 172.31.128.0/18
* 172.31.192.0/18"

#### Materias de Apoio

1. AWS Subnets - <https://docs.aws.amazon.com/vpc/latest/userguide/configure-subnets.html>
2. Terraform Subnets - <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet>
3. Lista de Zonas de Disponibilidades na AWS - <https://howto.lintel.in/list-of-aws-regions-and-availability-zones/>
4. Calculadora de IPs - <https://jodies.de/ipcalc>

### 3 - IGW - Internet Gateway

Internet Gateway permite disponibilizar acesso a internet a uma VPC, tendo duas finalidades: fornecer um roteamento as Route Tables da VPC e executar a NAT (Network Address Translation) para instâncias desginadas com endereços IPv4 públicos.

#### Materias de Apoio

1. AWS Internet Gateway - <https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/VPC_Internet_Gateway.html>
2. Terraform Internet Gateway - <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway>

### 4 - NAT - Network Address Translation

#### Materias de Apoio

1. AWS Elastic IP - <https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html>
2. Terraform Elasti IP - <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip>
3. AWS NAT - <https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/vpc-nat-gateway.html>
4. Terraform NAT - <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway>

### 5 - Route Tables

### 6 - NLB - Network Load Balancer

### 7 - Security Group

### 8 - Auto Scaling IAM

### 9 - Auto Scaling Group

### 10 - Cluster
