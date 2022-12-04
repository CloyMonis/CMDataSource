Pod::Spec.new do |s|
    
  s.name             = 'CMDataSource'
  s.version          = '1.0.1'
  s.summary          = 'CMDataSource provides Persistent storage and gets Marvel Data'
  s.description      = 'CMDataSource provides Persistent storage using Core Data and gets Marvel Data'
  s.homepage         = 'https://github.com/CloyMonis/CMDataSource'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cloy Monis' => 'cloymonis1991@gmail.com' }
  s.source           = { :git => 'https://github.com/CloyMonis/CMDataSource.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'
  s.swift_version = '5'
  s.source_files = 'CMDataSource/Classes/**/*'
  s.resources = "CMDataSource/Assets/Marvel.xcdatamodeld"
  
end

