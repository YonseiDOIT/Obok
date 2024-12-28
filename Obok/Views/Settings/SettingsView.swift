//
//  SettingsView.swift
//  Obok
//
//  Created by 김민경 on 11/28/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isNotificationOn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                }) {
                    Image("back")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Text("설정")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.leading)
                Spacer()
            }
            
            // 알림 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("alarm")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)

                    Text("알림")
                        .font(.system(size: 15))
                    Spacer()
                    Toggle("", isOn: $isNotificationOn)
                        .labelsHidden()
                }
                Text("매일 저녁 21시, 23시에 상담바 알림을 받아요")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .padding(.leading, 30)
            }
            .padding()
            
            // 과목 관리 섹션
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("setting")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    Text("과목 관리")
                        .font(.system(size: 15))
                    Spacer()
                    Button(action: {
                        print("과목 관리 버튼 클릭")
                    }) {
                        Image("go")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        }
                    }
                    Text("• 국어, 영어, 수학, 역사, 과학, 기술가정, 정보, 자격증")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                    Text("• 숨긴 과목 1개")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(.leading, 30)
                }
                .padding()
                }
            .padding()
            .background(Color.white)
        }
    }

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
