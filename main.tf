// https://www.ipify.org/
// Current ip address
//data "external" "ip_addr" {
//  program = ["bash" , "-c", "curl --url 'https://api.ipify.org?format=json' | jq '.'"]
//}

data "http" "example" {
  url = "https://api.ipify.org?format=json"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}
output "ip" {
    value = lookup(jsondecode(data.http.example.body), "ip", "")
}
