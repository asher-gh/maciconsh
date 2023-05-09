#!/bin/bash

icon_name='MyIcon'
# verbose='false'
# file=''

print_usage() {
  printf "Usage: ./icon.sh [-n <icon_name>] <source_image.png> \n"
}

if [ -z  "$1" ]; then
  print_usage
  exit 1
fi


while getopts 'n:' flag; do
  case "${flag}" in
    n) icon_name="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done

iconset="output/${icon_name}.iconset"

mkdir -p "${iconset}"
sips -z 16 16    "${@: -1}"  --out "${iconset}/icon_16x16.png"
sips -z 32 32    "${@: -1}"  --out "${iconset}/icon_16x16@2x.png"
sips -z 32 32    "${@: -1}"  --out "${iconset}/icon_32x32.png"
sips -z 64 64    "${@: -1}"  --out "${iconset}/icon_32x32@2x.png"
sips -z 128 128  "${@: -1}"  --out "${iconset}/icon_128x128.png"
sips -z 256 256  "${@: -1}"  --out "${iconset}/icon_128x128@2x.png"
sips -z 256 256  "${@: -1}"  --out "${iconset}/icon_256x256.png"
sips -z 512 512  "${@: -1}"  --out "${iconset}/icon_256x256@2x.png"
sips -z 512 512  "${@: -1}"  --out "${iconset}/icon_512x512.png"
cp "${@: -1}" "${iconset}/icon_512x512@2x.png"
iconutil -c icns "${iconset}"
rm -R "${iconset}"
