# Splunk2Tailscale
Making [Splunk Enterprise](https://www.splunk.com/en_us/products/splunk-enterprise.html) accessible through [Tailscale](https://tailscale.com/).

### Use case
Working collaboratively on a one-off investigation with several log files? This setup allows you to quickly spin up a disposable Splunk Enterprise server, where you can upload log files to Splunk and share the instance to a member on your [Tailnet](https://tailscale.com/kb/1136/tailnet/).

### Prerequisites
- Debian-Based Linux Distribution (script tested primarly on Kali Linux and Amazon Linux).
- Tailscale [Auth Key](https://tailscale.com/kb/1085/auth-keys/)
- Optional: Tailscale account of the second user, if [sharing with external party](https://tailscale.com/kb/1084/sharing/).

### Usage
Coming soon...

### Notes
The setup utilises Splunk Enterprise free tier, which comes with [restrictions and limitations](https://docs.splunk.com/Documentation/Splunk/9.0.3/Admin/MoreaboutSplunkFree). Instructions for installing licenses is available through [this link](https://docs.splunk.com/Documentation/Splunk/9.0.3/Installation/Installalicense). Depending on your use case, you can also request a [developer license](https://dev.splunk.com/enterprise/dev_license).
