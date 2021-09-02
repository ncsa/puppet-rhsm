# module name
 
One line summary
 
## Dependencies
- [author/module_one](https://forge.puppet.com/author/module_one)
- [other/module_two](https://forge.puppet.com/other/module_two)
 
## Usage
Set the org and activation key to establish a connection to the RHSM for the host.
If connecting to the RHSM requires a proxy, use the ::rhsm::proxy definition to set the proxy.
 
## Reference
 
(replace with output from "List all class parameters" ... below)
 
### class rhsm (
-  String $org,
-  String $activationkey,
### define rhsm::proxy (
-  String $host_port,

See also: [REFERENCE.md](REFERENCE.md)
