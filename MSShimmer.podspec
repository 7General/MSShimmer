
Pod::Spec.new do |s|
  s.name             = 'MSShimmer'
  s.version          = '1.0.131'
  s.summary          = 'A short description of MSShimmer.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://gitee.com/whuizhou/msshimmer.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huizhou.wang' => 'zzw@163.com' }
  s.source           = { :git => 'https://gitee.com/whuizhou/msshimmer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'

  s.source_files = 'MSShimmer/Classes/**/*.*'
end
