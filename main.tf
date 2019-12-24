// https://www.ipify.org/
// Current ip address
data "external" "ip_addr" {
  program = ["bash" , "-c", "curl 'https://api.ipify.org?format=json' | jq '.'"]
}

output "ip" {
    value = data.external.ip_addr.result["ip"]
}
