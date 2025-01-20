# Virtual Network Adapters
resource "ibm_is_virtual_network_interface" "management"{
    name                        = "${var.vyos_host_name}-vni-mgmt"
    resource_group     = data.ibm_resource_group.vyos_rg.id
    allow_ip_spoofing           = false
    enable_infrastructure_nat   = true
    primary_ip {
        auto_delete             = false
    address                     = var.vyos_management_ip
    }
    subnet                      = data.ibm_is_subnet.vyos_mgmt.id
}

# Compute node
resource "ibm_is_instance" "vyos" {
    name                      = var.vyos_host_name
    resource_group     = data.ibm_resource_group.vyos_rg.id
    image                     = ibm_is_image.vyos.id
    profile                   = data.ibm_is_instance_profile.vyos.id
    
    primary_network_attachment {
        name = "${var.vyos_host_name}-na-mgmt"
        virtual_network_interface {
            id = ibm_is_virtual_network_interface.management.id
        }
    }
    
    user_data = file("./scripts/user_data.vyos")

    # network_attachments {
    #     name = "example-network-att"
    #     virtual_network_interface {
    #         name = "example-net-vni"
    #         auto_delete = true
    #         enable_infrastructure_nat = true
    #         primary_ip {
    #             auto_delete     = true
    #             address         = "10.240.0.6"
    #         }
    #         subnet = ibm_is_subnet.example.id
    #     }
    # }
    vpc  = data.ibm_is_vpc.vyos.id
    zone = data.ibm_is_subnet.vyos_mgmt.zone
    keys = [data.ibm_is_ssh_key.vyos.id]

    //User can configure timeouts
    timeouts {
        create = "15m"
        update = "15m"
        delete = "15m"
    }
}