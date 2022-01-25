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
rhsm::activationkey: "RHIS_2019"
rhsm::enabled: true
rhsm::org: "1234567"
```

## Proxy Setup

This class also includes a defined type `rhsm::proxy` to optionally configure RHSM with a proxy.

## Dependencies

n/a

## Reference

[REFERENCE.md](REFERENCE.md)

