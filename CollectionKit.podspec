Pod::Spec.new do |spec|
  spec.name          = 'CollectionKit'
  spec.version       = '1.0.0'
  spec.license       = { :type => 'BSD' }
  spec.homepage      = 'https://github.com/GeneralD/CollectionKit'
  spec.authors       = { 'Yumenosuke Kokata' => 'yumejustice@gmail.com' }
  spec.summary       = 'Collection of Collection Extensions.'
  spec.source        = { :git => 'https://github.com/GeneralD/CollectionKit.git', :tag => '1.0.0' }
  spec.module_name   = 'CollectionKit'
  spec.swift_version = '5.1'

  spec.ios.deployment_target  = '9.0'
  spec.osx.deployment_target  = '10.10'

  spec.source_files       = 'CollectionKit/Sources/**/*.swift'
end
