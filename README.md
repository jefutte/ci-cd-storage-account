# ci-cd-storage-account

# Usage

## Connect Github to your Azure environment
https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Cwindows#use-the-azure-login-action-with-a-service-principal-secret

az ad sp create-for-rbac --name "Github-Deploy" --role Owner --scopes /subscriptions/b0fbba52-a0ae-4b41-85f0-11258598956e --sdk-auth