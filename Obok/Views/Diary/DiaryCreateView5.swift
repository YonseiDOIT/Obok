//
//  DiaryCreateView5.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryCreateView5: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 5
    private let totalPages = 5
    @State private var explain3: String = ""
    private let maxTextLength = 150 // 글자 수 제한
    @State private var selectedTags: [String] = [] // 선택된 태그를 저장 (복수 선택)

    let dissTags = ["#구체적인 계획","#작은 목표부터", "#자신감 키우기", "#긍정적인 생각", "#미루지 않기", "#스트레칭", "#휴대폰 줄이기", "# 일찍 자기"] // 태그 목록
    
    // 태그 열
        private let gridColumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
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

                    Text("학습일기 작성하기")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()

                    Text("\(currentPage) / \(totalPages)")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
                .padding([.top, .horizontal], 24)

                // 학습일기 작성하기 상단 바
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 10)

                    RoundedRectangle(cornerRadius: 8)
                        .fill(CustomColor.colors.first!) // 진행중인 부분 색상
                        .frame(width: CGFloat(currentPage) / CGFloat(totalPages) * (UIScreen.main.bounds.width - 48), height: 10)
                }
                .padding(.horizontal, 24)
                .padding(.top, 11)

                Spacer().frame(height: 50)
                
                // 공부 내용 작성 영역
                VStack(alignment: .leading) {
                    HStack {

                    Text("다짐: 내일은 이렇게 시도해볼게요!")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    // 글자 수 제한 표시
                        Spacer()
                        Text("\(explain3.count) / \(maxTextLength)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .frame(height: 160)

                        TextEditor(text: $explain3)
                            .onChange(of: explain3) { newValue in
                                if newValue.count > maxTextLength {
                                    explain3 = String(newValue.prefix(maxTextLength))
                                }
                            }
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 10))
                            .font(.system(size: 15, weight: .regular))
                            .lineSpacing(12) // 160%보다 작게
//                            .lineSpacing(24) // 15px * 160% = 24px
                            .foregroundColor(.black)
                            .background(Color.clear)
                            .frame(maxWidth: .infinity, maxHeight: 140) // 텍스트 크기 제한
                            .clipped() // 텍스트가 박스 밖으로 넘어가지 않도록 자르기
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 10)

                // 태그 선택 영역
                VStack(alignment: .leading) {
                    // 모든 태그 버튼 표시
                    LazyVGrid(columns: gridColumns, spacing: 12) {
                        ForEach(dissTags, id: \.self) { tag in
                            Button(action: {
                                if selectedTags.contains(tag) {
                                    selectedTags.removeAll { $0 == tag }
                                } else {
                                    selectedTags.append(tag)
                                }
                            }) {
                                Text(tag)
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedTags.contains(tag) ? CustomColor.colors.first! : Color.gray.opacity(0.2))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 220)
                }
                
                VStack() {
                    Text("Tip!")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .stroke(Color.black)
                        )
                        .padding(.leading, -125)
                    
                    Text("다짐은 구체적일수록 좋아요!")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.leading, -65)
                        .padding(.bottom, 1)

                    Text("SNS를 너무 많이 해서 고민이라면,\n‘SNS 10분만 줄여봐야겠다’처럼 적어보세요!")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
                .padding(.top, -120)

                // 등록하기 버튼
                NavigationLink(destination: DiaryCreateFinish()) {
                    Text("등록하기")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .background(Color.black)
                        .cornerRadius(10)
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct DiaryCreateView5_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView5()
    }
}
