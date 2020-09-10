
platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!
workspace 'KodeTest'

def networking
  pod 'Alamofire', '~> 5.0.0'
end

def rx
  pod 'RxSwift', '~> 5.1.0'
  pod 'RxCocoa', '~> 5.1.0'
end

## Liverpool App

target 'Liverpool' do
  project 'App/Liverpool/Liverpool'
  
  rx
  networking
  pod 'Nuke'
  
end

## UseCases

target 'CoreUseCases' do
  project 'Domain/UseCases/CoreUseCases/CoreUseCases'
  
  rx
  
end

## Gateways

target 'CoreDataSource' do
  project 'Data/Gateways/CoreDataSource/CoreDataSource'
  
  rx
  
end

## ShareCore

target 'ShareCore' do
  project 'Data/Core/ShareCore/ShareCore'
  
  rx
  networking
  
  target 'ShareCoreTests' do
    inherit! :complete
  end
end

## NetworkCore

target 'NetworkCore' do
  project 'Data/Core/NetworkCore/NetworkCore'
  
  rx
  networking
  
end

## Utils

target 'Utils' do
  project 'Common/Utils/Utils'
  
  rx
  
end

## Components

target 'Components' do
  project 'UI/Components/Components'
  
  pod 'Nuke'
end