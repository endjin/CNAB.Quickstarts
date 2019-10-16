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
PORTER_VERSION="${PORTER_VERSION:-latest}"

echo "Installing porter (${PORTER_URL}/${PORTER_VERSION}/porter-linux-amd64) to ${TOOLHOME}"
curl "${PORTER_URL}/${PORTER_VERSION}/porter-linux-amd64" -fLo "${TOOLHOME}/porter"
chmod +x "${TOOLHOME}/porter"
cp "${TOOLHOME}/porter" "${TOOLHOME}/porter-runtime"
echo Installed "Porter: $("${TOOLHOME}/porter" version)"

# Install CNAB Azure Driver

CNAB_AZURE_DRIVER_VERSION="${CNAB_AZURE_DRIVER_VERSION:-v.0.0.3}"
CNAB_AZURE_DRIVER_REPO="${CNAB_AZURE_DRIVER_REPO:-simongdavies/cnab-azure-driver}"

echo "Installing cnab-azure-driver (https://github.com/${CNAB_AZURE_DRIVER_REPO}/releases/download/${CNAB_AZURE_DRIVER_VERSION}/cnab-azure-linux-amd64) to ${TOOLHOME}"
curl "https://github.com/${CNAB_AZURE_DRIVER_REPO}/releases/download/${CNAB_AZURE_DRIVER_VERSION}/cnab-azure-linux-amd64" -fLo "${TOOLHOME}/cnab-azure-driver"
chmod +x "${TOOLHOME}/cnab-azure-driver"
echo "Installed cnab-azure-driver"

# Install ORAS

ORAS_VERSION="${ORAS_VERSION:-0.7.0}"
ORAS_REPO="${ORAS_REPO:-deislabs/oras}"
ORAS_DOWNLOAD_DIR=/tmp

echo "Installing oras (https://github.com/${ORAS_REPO}/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz) to ${TOOLHOME}"
curl https://github.com/${ORAS_REPO}/releases/download/v${ORAS_VERSION}/oras_${ORAS_VERSION}_linux_amd64.tar.gz -fLo "${ORAS_DOWNLOAD_DIR}/oras_${ORAS_VERSION}_linux_amd64.tar.gz"
tar -zxf "${ORAS_DOWNLOAD_DIR}/oras_${ORAS_VERSION}_linux_amd64.tar.gz" -C "${TOOLHOME}"
chmod +x "${TOOLHOME}/oras"
echo Installed "Oras: $("${TOOLHOME}/oras" version)"

# Download script for generating credential and parameter files

CNAB_QUICKSTARTS_REPO="${CNAB_QUICKSTARTS_REPO:-endjin/CNAB.Quickstarts}"
CNAB_QUICKSTARTS_REPO_BRANCH="${CNAB_QUICKSTARTS_REPO_BRANCH:-master}"

echo "Downloading Script to generate credential and parameter files (https://raw.githubusercontent.com/${CNAB_QUICKSTARTS_REPO}/${CNAB_QUICKSTARTS_REPO_BRANCH}/client/generate-cnab-param-and-cred-files.sh) to ${TOOLHOME}"
curl "https://raw.githubusercontent.com/${CNAB_QUICKSTARTS_REPO}/${CNAB_QUICKSTARTS_REPO_BRANCH}/client/generate-cnab-param-and-cred-files.sh" -fLo "${TOOLHOME}/generate-cnab-param-and-cred-files.sh"
chmod +x "${TOOLHOME}/generate-cnab-param-and-cred-files.sh"
echo "Downloaded Script"


echo "DONE"