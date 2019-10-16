# CNAB.Quickstarts

## Install from Azure Cloud Shell

CNAB Quickstarts can be installed from Azure Cloud Shell.

To setup your Cloud Shell, run the following command:

`curl https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/client/setup-cloudshell.sh | sh`

This will install Porter and the CNAB Azure Driver, which allows Cloud Shell to install bundles using Azure Container Instances as the driver.

Once setup is complete, you can install Quickstarts by using the following steps:

### 1. Create a new directory for the Quickstart and navigate to it

```
mkdir <quickstart-name>
cd <quickstart-name>
```

### 2. Download the bundle metadata using ORAS

```
oras pull cnabquickstarts.azurecr.io/porter/<quickstart-name>:<quickstart-version>
```

### 3. Set up the default parameters and credentials

```
generate-cnab-param-and-cred-files.sh -f
```

### 4. Run the install command

```
porter install <instance> --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>:<quickstart-version> -d azure --param-file parameters.toml --cred credentials.yaml
```

