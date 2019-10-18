#!/bin/bash
set -e 

# Set up tools

TOOLHOME="${HOME}/bin/cnabquickstarts"

# set up local folder for programs and update path

if [ ! -d  "${TOOLHOME}" ]; then 
    mkdir -p "${TOOLHOME}"  
    if [ -f "${HOME}/.bashrc" ]; then
        echo "" >> "${HOME}/.bashrc"
        echo "#START UPDATING PATH FOR CNAB QUICKSTARTS" >> "${HOME}/.bashrc"
        echo  export PATH="${TOOLHOME}:\$PATH" >> "${HOME}/.bashrc"
        echo "#FINISH UPDATING PATH FOR CNAB QUICKSTARTS" >> "${HOME}/.bashrc"
        echo ".bashrc updated to include ${TOOLHOME} in PATH "
    else 
        echo "Update your PATH to include ${TOOLHOME}"
    fi
    export PATH="${TOOLHOME}:${PATH}"
fi

# Install Porter
 
PORTER_URL="${PORTER_URL:-https://cdn.deislabs.io/porter}"
PORTER_VERSION="${PORTER_VERSION:-v0.17.1-beta.1}"

echo "Installing porter (${PORTER_URL}/${PORTER_VERSION}/porter-linux-amd64) to ${TOOLHOME}"
curl "${PORTER_URL}/${PORTER_VERSION}/porter-linux-amd64" -fLo "${TOOLHOME}/porter"
chmod +x "${TOOLHOME}/porter"
cp "${TOOLHOME}/porter" "${TOOLHOME}/porter-runtime"
echo Installed "Porter: $("${TOOLHOME}/porter" version)"

# Install CNAB Azure Driver

CNAB_AZURE_DRIVER_VERSION="${CNAB_AZURE_DRIVER_VERSION:-v.0.0.3}"
CNAB_AZURE_DRIVER_REPO="${CNAB_AZURE_DRIVER_REPO:-simongdavies/cnab-azure-driver}"

echo "Installing cnab-azure driver (https://github.com/${CNAB_AZURE_DRIVER_REPO}/releases/download/${CNAB_AZURE_DRIVER_VERSION}/cnab-azure-linux-amd64) to ${TOOLHOME}"
curl "https://github.com/${CNAB_AZURE_DRIVER_REPO}/releases/download/${CNAB_AZURE_DRIVER_VERSION}/cnab-azure-linux-amd64" -fLo "${TOOLHOME}/cnab-azure"
chmod +x "${TOOLHOME}/cnab-azure"
echo "Installed cnab-azure driver"


echo "DONE"