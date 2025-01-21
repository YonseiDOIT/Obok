//
//  StatisticsView.swift
//  Obok
//
//  Created by 김민경 on 01/01/25.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.presentationMode) var presentationMode
   
    // 현재 연도 및 월 가져오기
    private var currentYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년"
        return dateFormatter.string(from: Date())
    }
    
    private var currentMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M월"
        return dateFormatter.string(from: Date())
    }
    
    // 받아올 더미 데이터
    private var recordCount: Int = 10
    private var shame: String = "dummy"
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // 상단 네비게이션 영역
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() // 이전 화면으로 돌아가기
                    }) {
                        Image("backbutton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    
                    Spacer()
                    
                    Text("통계")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("calendar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text(currentYear)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                .padding([.top, .horizontal], 24)
                
                // 월 이동
                HStack {
                    Button(action: {
                        // 이전 월로 이동
                    }) {
                        Image("arrowLeft")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }
                    
                    Spacer()
                    
                    Text("\(currentYear) \(currentMonth)")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        // 다음 월로 이동
                    }) {
                        Image("arrowRight")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ZStack{
                            Image("writtenNum")
                                .resizable()
                                .scaledToFit()
                                .padding()
                            
                            Text("오복과 함께한 \(currentMonth)")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black)
                                .padding(.top, 120)
                            
                            HStack(spacing: 4) {
                                Text("✨ \(recordCount)번의 기록 달성 ✨")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.top, 170)
                            }
                        }
                        Spacer()
                        
                        VStack{
                            Image("keyword")
                                .resizable()
                                .scaledToFit()
                                .padding(.leading, 120)
                                .padding(.trailing, 120)
                            
                            Text("분아별 공부의 걸림돌")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.black)
                                .padding(.top, 5)
                            
                            HStack(spacing: 4) {
                                Text("✨ 아쉬웠던 #\(shame) ✨")
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.black)
                                    .padding(.top, -5)
                            }
                        }
                        padding(.bottom, 30)
                        
                        Text("공부를 하면서")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        
                        Text("개인 습관 및 상태")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        Text("나의 주된 문제점은 #\(shame) (이)었어요.")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        
                        Text("학습 내용 및 능력")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        Text("주로 #\(shame) 때문에 힘들었어요.")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        
                        Text("외부 환경 요인")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                        Text("#\(shame) 의 방해를 많이 받았어요.")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.leading, 24)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
