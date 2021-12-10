bucket="mdx-dev-state-storage"
key="go-app/terraform.tfstate"
region="ap-southeast-1"

terraform init \
        -backend-config="bucket=$bucket" \
        -backend-config="key=$key" \
        -backend-config="region=$region" \
        -reconfigure


if [[ "$1" = "apply" ]] || [[ "$1" = "destroy" ]]
then
    terraform $1 -auto-approve
else
    terraform plan
fi
