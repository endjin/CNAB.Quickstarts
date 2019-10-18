# CNAB.Quickstarts

## Install from Azure Cloud Shell

CNAB Quickstarts can be installed from Azure Cloud Shell.

To setup your Cloud Shell, run the following command:

`curl https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/client/setup-cloudshell.sh | sh`

This will install Porter and the CNAB Azure Driver, which allows Cloud Shell to install bundles using Azure Container Instances as the driver.

Once setup is complete, you can install Quickstarts by using the following steps:

### 1. View bundle credentials/parameters

```
porter explain --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>/bundle:<quickstart-version>
```

### 2. Set up credentials, if required

```
porter credentials generate --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>/bundle:<quickstart-version>
```

This will output the path to the credentials file generated.

### 3. Run the install command

```
porter install --tag cnabquickstarts.azurecr.io/porter/<quickstart-name>:<quickstart-version> --cred <path-to-creds-file> -d azure --param <param1>=<param1value> --param <param2>=<param2value> ...
```

