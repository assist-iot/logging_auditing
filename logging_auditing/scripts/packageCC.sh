# Store all input parameters in an array
# chaincodeNames=("$@")

# Create the ConfigMap YAML file
cd templates/configmaps
cat <<EOF > hlfchaincode.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: hlfchaincode
  namespace: default
data:
binaryData:
EOF

cd ../../

read -p "Please define the release name of your enabler: " releaseName

echo -e "Release name of your enabler: $releaseName \nPlease use the same name on your helm install command"

# chaincodeNames=("loggingbasic" "brokerbasic" "kvbasic" "flbasic")
chaincodeNames=("loggingbasic")

# ORG1
for chaincodeName in "${chaincodeNames[@]}" 
do
    
    MYPWD=${PWD}
    echo "My present working directory: $MYPWD"
    
    cd $MYPWD/chaincode/$chaincodeName/packaging/org1
    
    substring="${chaincodeName%basic}"

    echo '{
    "address": "'$releaseName'-dlt'$substring'-'$chaincodeName'org1:7052",
    "dial_timeout": "10s",
    "tls_required": false,
    "client_auth_required": false,
    "client_key": "-----BEGIN EC PRIVATE KEY----- ... -----END EC PRIVATE KEY-----",
    "client_cert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----",
    "root_cert": "-----BEGIN CERTIFICATE---- ... -----END CERTIFICATE-----"
}' > connection.json

    echo "Package chaincode $chaincodeName for Org1"
    tar cfz code.tar.gz connection.json
    
    #Package previous step & metadata.json for org1
    tar cfz ${chaincodeName}1.tgz code.tar.gz metadata.json

    #Remove tar from step Package connection.json for org1
    rm code.tar.gz

    # Append the .tgz file to the hlfchaincode.yaml
    echo " ${chaincodeName}1.tgz: |" >> $MYPWD/templates/configmaps/hlfchaincode.yaml
    echo "   $(base64 -w 0 ${chaincodeName}1.tgz)" >> $MYPWD/templates/configmaps/hlfchaincode.yaml

    cd ../../../../
    
done

# ORG2
for chaincodeName in "${chaincodeNames[@]}" 
do
    
    MYPWD=${PWD}
    echo "My present working directory: $MYPWD"

    cd $MYPWD/chaincode/$chaincodeName/packaging/org2

    substring="${chaincodeName%basic}"

    echo '{
    "address": "'$releaseName'-dlt'$substring'-'$chaincodeName'org2:7052",
    "dial_timeout": "10s",
    "tls_required": false,
    "client_auth_required": false,
    "client_key": "-----BEGIN EC PRIVATE KEY----- ... -----END EC PRIVATE KEY-----",
    "client_cert": "-----BEGIN CERTIFICATE----- ... -----END CERTIFICATE-----",
    "root_cert": "-----BEGIN CERTIFICATE---- ... -----END CERTIFICATE-----"
}' > connection.json

    echo "Package chaincode $chaincodeName for Org2"
    tar cfz code.tar.gz connection.json
    
    #Package previous step & metadata.json for org2
    tar cfz ${chaincodeName}2.tgz code.tar.gz metadata.json

    #Remove tar from step Package connection.json for org2
    rm code.tar.gz
    
    # Append the .tgz file to the hlfchaincode.yaml
    echo " ${chaincodeName}2.tgz: |" >> $MYPWD/templates/configmaps/hlfchaincode.yaml
    echo "   $(base64 -w 0 ${chaincodeName}2.tgz)" >> $MYPWD/templates/configmaps/hlfchaincode.yaml

    cd ../../../../
    
done

# Create a temporary directory to store the input files
# tempDir=$(mktemp -d)
# echo $tempDir

# rm -rf $tempDir   
