echo Tilføj C:\Users\%username%\.dotnet\tools\dotnet-lambda.exe til undtagelsesliste, ellers ryger den i karantæne af (Trend Micro Security)
@echo off
aws cloudformation validate-template --template-body file://template.yaml
dotnet lambda package-ci --template template.yaml --output-template packaged.yaml --region eu-central-1 --configuration Release --framework netcoreapp3.1 --s3-bucket %2 --msbuild-parameters "/p:PublishReadyToRun=true /p:RuntimeIdentifier=win-x64 --self-contained false"
aws cloudformation package --template-file packaged.yaml --output-template-file packaged.yaml --s3-bucket %2
aws s3 cp --only-show-errors packaged.yaml s3://%2/packaged.yaml
aws cloudformation deploy --template-file packaged.yaml --stack-name %1 --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND
aws cloudformation describe-stacks --stack-name %1