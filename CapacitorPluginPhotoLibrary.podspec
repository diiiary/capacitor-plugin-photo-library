
  Pod::Spec.new do |s|
    s.name = 'CapacitorPluginPhotoLibrary'
    s.version = '0.0.1'
    s.summary = 'Get photos from device photos'
    s.license = 'MIT'
    s.homepage = 'https://github.com/diiiary/capacitor-plugin-photo-library.git'
    s.author = 'diiiary.com'
    s.source = { :git => 'https://github.com/diiiary/capacitor-plugin-photo-library.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end