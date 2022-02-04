# rhsm

![pdk-validate](https://github.com/ncsa/puppet-rhsm/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-rhsm/workflows/yamllint/badge.svg)

Configure Red Hat Subscription Management (RHSM)

## Usage

To install and configure:

```puppet
include rhsm
```

## Configuration

The following parameters need to be set in hiera:
```yaml
rhsm::activationkey: "RHIS_2019"  # IDEALLY LOOKED UP VIA VAULT
rhsm::enabled: true
rhsm::org: "1234567"              # IDEALLY LOOKED UP VIA VAULT
```

### Proxy Setup

To enable proxy in RHSM the following parameters also need to be set in hiera:
```yaml
rhsm::proxy::hostname: "httpproxy.ncsa.illinois.edu"
rhsm::proxy::port: "3128"
```

## Dependencies

n/a

## Reference

[REFERENCE.md](REFERENCE.md)

