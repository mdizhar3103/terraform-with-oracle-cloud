# create a virtual environment to install oci-cli
python3 -m venv oracle-cli

# activate the virtual environment
source oracle-cli/bin/activate

# install the oci-cli in virtual environment
pip install oci-cli

# checking the version
oci --version

# help from oci
oci --help

# Configuring OCI after installation:
oci setup config
    # Enter the directory path to store credentials or leave it as default
    # Enter a user OCID - copy and paste from dashboard user profile
    # Enter a tenancy OCID - click on profile icon and click tenancy, copy and paste the ID
    # Enter region- enter region id
    # Enter yes to generate key pair

# Now go to the credentials directory path and open public pem file and copy the contents
# Go to dashboard and click on logged in username and add API key
# Using Oracle CLI: https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.5.0/oci_cli_docs/
