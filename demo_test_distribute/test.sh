IPANAME="jinkens-myapp"
fastlane gym --export_method ad-hoc --output_name ${IPANAME}
curl -F "file=@${IPANAME}.ipa" -F "uKey=0d1f5d29f21914a2348adfe9ed0a550d" -F "_api_key=0a482f099adc4941b525600c64df181a" https://qiniu-storage.pgyer.com/apiv1/app/upload
