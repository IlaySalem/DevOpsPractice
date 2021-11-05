### test_terraform
# Оглавление
#### [Инструкция по установке](#instruction)
#### [Вывод 'terraform plan'](#plan)
#### [Вывод 'terraform apply'](#apply)
#### [Развернутая VM](#screen_VM)
#### [Приветствие nginx](#screen_nginx)

<a name = "instruction"></a>
## Инструкция по установке
* Настройка
    * Регитсрация в AWS и улата в казну в ~~1 USD~~, пробуют списать 2 USD.
    * Скачать AWS CLI  и Terraform, установить как полагается для ОС.
    * Создать нового пользователя в AWS консоли на сайте и предоставить ему права админа.
    * Авторизовать в AWS CLI через команду 'aws configure'. Ввести данные ключей и формат вывода и регион.
* Написать код на HCL
* Запустить 'terraform init' в рабочей директории
* Запустить 'terraform plan' в рабочей директории 
* Если все ок апустить 'terraform apply'
* По окончанию работы запустить 'terraform destroy'.

<a name = "plan"></a>
## Вывод команды 'terraform plan'
<details>
  <summary> Развернуть </summary>
    '''

	tls_private_key.pk: Refreshing state... [id=b91de410ed2097e4b57ce7bae30f9e07b3c3b613]
	aws_key_pair.kp: Refreshing state... [id=myKey_2]
	aws_security_group.webserver: Refreshing state... [id=sg-0748dfe99f769f3e1]
	aws_instance.first_vm: Refreshing state... [id=i-08f69c763348f694a]

	Note: Objects have changed outside of Terraform

	Terraform detected the following changes made outside of Terraform since the last "terraform apply":

	  # aws_security_group.webserver has been changed
	  ~ resource "aws_security_group" "webserver" {
			id                     = "sg-0748dfe99f769f3e1"
			name                   = "WebServer Security Group"
		  + tags                   = {}
			# (8 unchanged attributes hidden)
		}

	Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes,
	the following plan may include actions to undo or respond to these changes.

	───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

	Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
	following symbols:
	-/+ destroy and then create replacement

	Terraform will perform the following actions:

	  # aws_instance.first_vm must be replaced
	-/+ resource "aws_instance" "first_vm" {
		  ~ arn                                  = "arn:aws:ec2:eu-west-3:460328319400:instance/i-08f69c763348f694a" -> (known after apply)
		  ~ associate_public_ip_address          = true -> (known after apply)
		  ~ availability_zone                    = "eu-west-3b" -> (known after apply)
		  ~ cpu_core_count                       = 1 -> (known after apply)
		  ~ cpu_threads_per_core                 = 1 -> (known after apply)
		  ~ disable_api_termination              = false -> (known after apply)
		  ~ ebs_optimized                        = false -> (known after apply)
		  - hibernation                          = false -> null
		  + host_id                              = (known after apply)
		  ~ id                                   = "i-08f69c763348f694a" -> (known after apply)
		  ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
		  ~ instance_state                       = "running" -> (known after apply)
		  ~ ipv6_address_count                   = 0 -> (known after apply)
		  ~ ipv6_addresses                       = [] -> (known after apply)
		  ~ monitoring                           = false -> (known after apply)
		  + outpost_arn                          = (known after apply)
		  + password_data                        = (known after apply)
		  + placement_group                      = (known after apply)
		  + placement_partition_number           = (known after apply)
		  ~ primary_network_interface_id         = "eni-0bd14d1d7f12c558a" -> (known after apply)
		  ~ private_dns                          = "ip-172-31-22-38.eu-west-3.compute.internal" -> (known after apply)
		  ~ private_ip                           = "172.31.22.38" -> (known after apply)
		  ~ public_dns                           = "ec2-13-37-231-184.eu-west-3.compute.amazonaws.com" -> (known after apply)
		  ~ public_ip                            = "13.37.231.184" -> (known after apply)
		  ~ secondary_private_ips                = [] -> (known after apply)
		  ~ security_groups                      = [
			  - "default",
			] -> (known after apply)
		  ~ subnet_id                            = "subnet-0de2357cff36bd408" -> (known after apply)
			tags                                 = {
				"Name" = "HelloWorld"
			}
		  ~ tenancy                              = "default" -> (known after apply)
		  ~ user_data                            = "418bfe5a7850f6011cef82a35bf79ad7f0e6d24b" -> "3c014c8a617b48220b93ec9e5de10ca7ff2a82f6" # forces replacement
		  + user_data_base64                     = (known after apply)
		  ~ vpc_security_group_ids               = [
			  + "sg-0748dfe99f769f3e1",
			  - "sg-0b0ec784309b0d1ed",
			]
			# (6 unchanged attributes hidden)

		  ~ capacity_reservation_specification {
			  ~ capacity_reservation_preference = "open" -> (known after apply)

			  + capacity_reservation_target {
				  + capacity_reservation_id = (known after apply)
				}
			}

		  - credit_specification {
			  - cpu_credits = "standard" -> null
			}

		  + ebs_block_device {
			  + delete_on_termination = (known after apply)
			  + device_name           = (known after apply)
			  + encrypted             = (known after apply)
			  + iops                  = (known after apply)
			  + kms_key_id            = (known after apply)
			  + snapshot_id           = (known after apply)
			  + tags                  = (known after apply)
			  + throughput            = (known after apply)
			  + volume_id             = (known after apply)
			  + volume_size           = (known after apply)
			  + volume_type           = (known after apply)
			}

		  ~ enclave_options {
			  ~ enabled = false -> (known after apply)
			}

		  + ephemeral_block_device {
			  + device_name  = (known after apply)
			  + no_device    = (known after apply)
			  + virtual_name = (known after apply)
			}

		  ~ metadata_options {
			  ~ http_endpoint               = "enabled" -> (known after apply)
			  ~ http_put_response_hop_limit = 1 -> (known after apply)
			  ~ http_tokens                 = "optional" -> (known after apply)
			}

		  + network_interface {
			  + delete_on_termination = (known after apply)
			  + device_index          = (known after apply)
			  + network_interface_id  = (known after apply)
			}

		  ~ root_block_device {
			  ~ delete_on_termination = true -> (known after apply)
			  ~ device_name           = "/dev/sda1" -> (known after apply)
			  ~ encrypted             = false -> (known after apply)
			  ~ iops                  = 100 -> (known after apply)
			  + kms_key_id            = (known after apply)
			  ~ tags                  = {} -> (known after apply)
			  ~ throughput            = 0 -> (known after apply)
			  ~ volume_id             = "vol-0f230af356d07cfc8" -> (known after apply)
			  ~ volume_size           = 8 -> (known after apply)
			  ~ volume_type           = "gp2" -> (known after apply)
			}
		}

	Plan: 1 to add, 0 to change, 1 to destroy.

	───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

	Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
	you run "terraform apply" now.
    '''
  </details>
  
<a name = "apply"></a>
## Вывод команды 'terraform apply'
<details>
   <summary> Развернуть </summary>
   '''
      
	tls_private_key.pk: Refreshing state... [id=b91de410ed2097e4b57ce7bae30f9e07b3c3b613]
	aws_key_pair.kp: Refreshing state... [id=myKey_2]
	aws_security_group.webserver: Refreshing state... [id=sg-0748dfe99f769f3e1]
	aws_instance.first_vm: Refreshing state... [id=i-08f69c763348f694a]

	Note: Objects have changed outside of Terraform

	Terraform detected the following changes made outside of Terraform since the last "terraform apply":

	  # aws_security_group.webserver has been changed
	  ~ resource "aws_security_group" "webserver" {
			id                     = "sg-0748dfe99f769f3e1"
			name                   = "WebServer Security Group"
		  + tags                   = {}
			# (8 unchanged attributes hidden)
		}

	Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes,
	the following plan may include actions to undo or respond to these changes.

	───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

	Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the
	following symbols:
	-/+ destroy and then create replacement

	Terraform will perform the following actions:

	  # aws_instance.first_vm must be replaced
	-/+ resource "aws_instance" "first_vm" {
		  ~ arn                                  = "arn:aws:ec2:eu-west-3:460328319400:instance/i-08f69c763348f694a" -> (known after apply)
		  ~ associate_public_ip_address          = true -> (known after apply)
		  ~ availability_zone                    = "eu-west-3b" -> (known after apply)
		  ~ cpu_core_count                       = 1 -> (known after apply)
		  ~ cpu_threads_per_core                 = 1 -> (known after apply)
		  ~ disable_api_termination              = false -> (known after apply)
		  ~ ebs_optimized                        = false -> (known after apply)
		  - hibernation                          = false -> null
		  + host_id                              = (known after apply)
		  ~ id                                   = "i-08f69c763348f694a" -> (known after apply)
		  ~ instance_initiated_shutdown_behavior = "stop" -> (known after apply)
		  ~ instance_state                       = "running" -> (known after apply)
		  ~ ipv6_address_count                   = 0 -> (known after apply)
		  ~ ipv6_addresses                       = [] -> (known after apply)
		  ~ monitoring                           = false -> (known after apply)
		  + outpost_arn                          = (known after apply)
		  + password_data                        = (known after apply)
		  + placement_group                      = (known after apply)
		  + placement_partition_number           = (known after apply)
		  ~ primary_network_interface_id         = "eni-0bd14d1d7f12c558a" -> (known after apply)
		  ~ private_dns                          = "ip-172-31-22-38.eu-west-3.compute.internal" -> (known after apply)
		  ~ private_ip                           = "172.31.22.38" -> (known after apply)
		  ~ public_dns                           = "ec2-13-37-231-184.eu-west-3.compute.amazonaws.com" -> (known after apply)
		  ~ public_ip                            = "13.37.231.184" -> (known after apply)
		  ~ secondary_private_ips                = [] -> (known after apply)
		  ~ security_groups                      = [
			  - "default",
			] -> (known after apply)
		  ~ subnet_id                            = "subnet-0de2357cff36bd408" -> (known after apply)
			tags                                 = {
				"Name" = "HelloWorld"
			}
		  ~ tenancy                              = "default" -> (known after apply)
		  ~ user_data                            = "418bfe5a7850f6011cef82a35bf79ad7f0e6d24b" -> "3c014c8a617b48220b93ec9e5de10ca7ff2a82f6" # forces replacement
		  + user_data_base64                     = (known after apply)
		  ~ vpc_security_group_ids               = [
			  + "sg-0748dfe99f769f3e1",
			  - "sg-0b0ec784309b0d1ed",
			]
			# (6 unchanged attributes hidden)

		  ~ capacity_reservation_specification {
			  ~ capacity_reservation_preference = "open" -> (known after apply)

			  + capacity_reservation_target {
				  + capacity_reservation_id = (known after apply)
				}
			}

		  - credit_specification {
			  - cpu_credits = "standard" -> null
			}

		  + ebs_block_device {
			  + delete_on_termination = (known after apply)
			  + device_name           = (known after apply)
			  + encrypted             = (known after apply)
			  + iops                  = (known after apply)
			  + kms_key_id            = (known after apply)
			  + snapshot_id           = (known after apply)
			  + tags                  = (known after apply)
			  + throughput            = (known after apply)
			  + volume_id             = (known after apply)
			  + volume_size           = (known after apply)
			  + volume_type           = (known after apply)
			}

		  ~ enclave_options {
			  ~ enabled = false -> (known after apply)
			}

		  + ephemeral_block_device {
			  + device_name  = (known after apply)
			  + no_device    = (known after apply)
			  + virtual_name = (known after apply)
			}

		  ~ metadata_options {
			  ~ http_endpoint               = "enabled" -> (known after apply)
			  ~ http_put_response_hop_limit = 1 -> (known after apply)
			  ~ http_tokens                 = "optional" -> (known after apply)
			}

		  + network_interface {
			  + delete_on_termination = (known after apply)
			  + device_index          = (known after apply)
			  + network_interface_id  = (known after apply)
			}

		  ~ root_block_device {
			  ~ delete_on_termination = true -> (known after apply)
			  ~ device_name           = "/dev/sda1" -> (known after apply)
			  ~ encrypted             = false -> (known after apply)
			  ~ iops                  = 100 -> (known after apply)
			  + kms_key_id            = (known after apply)
			  ~ tags                  = {} -> (known after apply)
			  ~ throughput            = 0 -> (known after apply)
			  ~ volume_id             = "vol-0f230af356d07cfc8" -> (known after apply)
			  ~ volume_size           = 8 -> (known after apply)
			  ~ volume_type           = "gp2" -> (known after apply)
			}
		}

	Plan: 1 to add, 0 to change, 1 to destroy.

	Do you want to perform these actions?
	  Terraform will perform the actions described above.
	  Only 'yes' will be accepted to approve.

	  Enter a value: yes

	aws_instance.first_vm: Destroying... [id=i-08f69c763348f694a]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 10s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 20s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 30s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 40s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 50s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m0s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m10s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m20s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m30s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m40s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 1m50s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 2m0s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 2m10s elapsed]
	aws_instance.first_vm: Still destroying... [id=i-08f69c763348f694a, 2m20s elapsed]
	aws_instance.first_vm: Destruction complete after 2m24s
	aws_instance.first_vm: Creating...
	aws_instance.first_vm: Still creating... [10s elapsed]
	aws_instance.first_vm: Still creating... [20s elapsed]
	aws_instance.first_vm: Creation complete after 24s [id=i-0d44f06f04747ed98]

	Apply complete! Resources: 1 added, 0 changed, 1 destroyed.
   '''
</details>

<a name = "screen_VM"></a>
## Развернутая VM
<details>
   <summary> Развернуть </summary>
   ![](https://github.com/IlaySalem/DevOpsPractice/blob/main/resources/img/instances.png)
</details>

<a name = "screen_nginx"></a>
## Welcome-страница nginx
<details>
   <summary> Развернуть </summary>
   ![]](https://github.com/IlaySalem/DevOpsPractice/blob/main/resources/img/nginx.png)
</details>
   
