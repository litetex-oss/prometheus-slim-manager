#!/bin/bash

rm -rf .github
git commit -a -m "Deleted .github folder"

rm -f plugins/plugin_*
git commit -a -m "Deleted all plugins"

(cd discovery && find . -maxdepth 1 ! -name . ! -name .. ! -name file ! -name http ! -name refresh ! -name targetgroup -type d -exec rm -rf "{}" \;)
git commit -a -m "Deleted not needed discovery modules"

rm -f config/config_test.go
git commit -a -m "Delete config_test.go"

rm -f discovery/metrics_k8s_client.go
git commit -a -m "Delete metrics_k8s_client.go"

rm -f util/logging/dedupe_test.go
git commit -a -m "Delete dedupe_test.go"

git apply ../remove-k8s-integration.patch
git commit -a -m "Removed k8s integration"

rm -rf storage/remote/azuread
git commit -a -m "Remove AzureAD remote storage code"
rm -rf storage/remote/googleiam
git commit -a -m "Remove GoogleIAM remote storage code"

git apply ../remove-proprietary-code.patch
git commit -a -m "Removed propiertary code"

