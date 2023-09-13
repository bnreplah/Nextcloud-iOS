brew tap veracode/tap
brew install gen-ir
carthage update --use-xcframeworks --platform iOS
xcodebuild archive -project Nextcloud.xcodeproj -configuration Debug -scheme Nextcloud -destination generic/platform=iOS DEBUG_INFORMATION_FORMAT=dwarf-with-dsym -archivePath Nextcloud.xcarchive CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO ENABLE_BITCODE=NO | tee build_log.txt
gen-ir build_log.txt Nextcloud.xcarchive --project-path Nextcloud.xcodeproj
ls Nextcloud.xcarchive/*
zip -r Nextcloud.zip Nextcloud.xcarchive
