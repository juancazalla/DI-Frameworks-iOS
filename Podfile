project 'DI&Frameworks.xcodeproj'

platform :ios, '9.0'
use_frameworks!

def domainPods
  pod 'BrightFutures'
  pod 'Alamofire'
end

def dataPods
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'BrightFutures'
end

target 'DI&Frameworks' do
  pod 'Swinject'
  pod 'BrightFutures'

  domainPods
  dataPods
  
  target 'DI&FrameworksTests' do
    pod 'KIF', '~> 3.0', :configurations => ['Debug']
    pod 'Nimble', '~> 4.0.0'
  end

  target 'DI&FrameworksUITests' do

  end
end

target 'Domain' do
  domainPods
  
  target 'DomainTests' do

  end
end

target 'Data' do
  dataPods

  target 'DataTests' do
  
  end
end
