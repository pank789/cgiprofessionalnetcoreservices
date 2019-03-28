#!/usr/bin/env sh

set -x

dotnet restore

echo "Restore Completed Successfully ... for Build Id ${BUILD_ID}"

dotnet build

echo "Dot net build completed ... for  build id ${BUILD_ID}"
set +x

