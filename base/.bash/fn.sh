clearAndroidBinaries() {
	find $HOME/workspace/android -type d -name build -exec rm -rf {} \;
	find $HOME/workspace/android -type f -name "*.apk" -delete
}

zipFolder() {
	zip -r $1 $1
}