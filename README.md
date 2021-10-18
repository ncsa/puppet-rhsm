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
rhsm::org: "1234567"
rhsm::activationkey: "RHIS_2019"
```

## Dependencies

n/a

## Reference

[REFERENCE.md](REFERENCE.md)

