# iOS 버전을 설정합니다.
platform :ios, '13.0'

target 'Obok' do
  # Dynamic Frameworks 사용 설정
  use_frameworks!

  # 프로젝트에서 사용할 CocoaPods 의존성 추가
  pod 'KakaoSDKCommon'
  pod 'KakaoSDKAuth'
  pod 'KakaoSDKUser'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'GoogleSignIn'

  target 'ObokTests' do
    inherit! :search_paths
    # 테스트용 Pods 추가
  end

  target 'ObokUITests' do
    inherit! :search_paths
    # UI 테스트용 Pods 추가
  end
end
