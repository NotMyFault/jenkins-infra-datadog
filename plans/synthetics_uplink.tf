resource "datadog_synthetics_test" "uplink_jenkins_io" {
  type = "browser"
  request {
    method = "GET"
    url    = "https://uplink.jenkins.io"
  }
  assertions = [
    {
      type     = "statusCode"
      operator = "is"
      target   = "200"
    }
  ]
  locations = ["aws:eu-central-1"]
  options {
    tick_every = 900
  }
  name    = "uplink.jenkins.io"
  message = "Notify @pagerduty"
  tags = [
    "jenkins.io",
    "production"
  ]

  device_ids = [
    "laptop_large",
    "tablet",
    "mobile_small"

  ]

  status = "live"
}
