#
# Be sure to run `pod lib lint Masiuk2021.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Masiuk2021'
  s.version          = '0.1.0'
  s.summary          = 'Article manager'
	s.author           = { 'Anton Masiuk' => 'anton.masiuk@codeit.pro' }

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	This package that uses CoreData to manage articles.
	Basicaly its an article manager that will serve as interface for the D09.
                       DESC

  s.homepage         = 'https://github.com/Anton-Masiuk/Masiuk2021'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/Anton-Masiuk/Masiuk2021.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.source_files = 'Masiuk2021/Source Files/*'
	s.frameworks = 'CoreData'
	s.swift_versions = '5'
end
