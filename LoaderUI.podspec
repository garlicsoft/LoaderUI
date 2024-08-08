Pod::Spec.new do |s|
  s.name        = "LoaderUI"
  s.version     = "1.0.0"
  s.summary     = "LoaderUI"
  s.homepage    = "https://github.com/garlicsoft/LoaderUI"
  s.license     = { :type => "MIT" }
  s.authors     = { "lingoer" => "lingoerer@gmail.com", "tangplin" => "tangplin@gmail.com" }

  s.requires_arc = true
  s.swift_version = "5.0"
  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "9.0"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "9.0"
  s.visionos.deployment_target = '1.0'
  s.source   = { :git => "https://github.com/garlicsoft/LoaderUI.git", :tag => s.version }
  s.source_files = "Sources/*.swift"
end
