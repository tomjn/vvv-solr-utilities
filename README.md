# VVV Solr Utilities

Utility to install Solr (and Java) as part of provisioning in [VVV](https://github.com/varying-vagrant-vagrants/vvv/).


## How To Use

Extend your `vvv-custom.yml` like this:

```yml
utilities:
  solr:
    - java9
    - solr71

utility-sources:
  solr: https://github.com/ocean90/vvv-solr-utilities.git
```

For more see the [official VVV documentation on utilities](https://varyingvagrantvagrants.org/docs/en-US/utilities/).

## Supported Versions

**Java**

* `java8`
* `java9`

**Solr**

* `solr66`
* `solr71`
