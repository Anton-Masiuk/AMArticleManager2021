Pod::Spec.new do |s|
  s.name             = 'Masiuk2021'
  s.version          = '0.1.0'
  s.summary          = 'Article manager'
	s.author           = { 'Anton Masiuk' => 'anton.masiuk@codeit.pro' }
  s.homepage         = 'https://github.com/Anton-Masiuk/Masiuk2021'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/Anton-Masiuk/Masiuk2021.git', :tag => s.version.to_s }
	
  s.ios.deployment_target = '12.0'
  s.source_files = 'Source/*.swift'
	s.resources = 'Source/Article.xcdatamodeld'
	s.frameworks = 'CoreData'
	s.swift_versions = '5'
end
