//
//  DiaryCreateView4.swift
//  Obok
//
//  Created by 김민경 on 12/27/24.
//

import SwiftUI

struct DiaryCreateView4: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 4
    private let totalPages = 5
    @State private var explain2: String = ""
    private let maxTextLength = 150
    @State private var selectedTags: [String] = []

    let categories: [String: [String]] = [
        "개인 습관 및 상태": ["#수면 부족", "#미루기", "#집중력 부족", "#체력 부족", "#스트레스", "#무기력", "#부담"],
        "학습 내용 및 능력": ["#이해 안 됨", "#개념 부족", "#응용력 부족", "#암기 어려움", "#풀이 어려움"],
        "외부 환경 요인": ["#소음", "#공간 부족", "#전자기기", "#게임", "#인간관계"]
    ]

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                // 상단 네비게이션 영역
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
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
                        .fill(CustomColor.colors.first!)
                        .frame(width: CGFloat(currentPage) / CGFloat(totalPages) * (UIScreen.main.bounds.width - 48), height: 10)
                }
                .padding(.horizontal, 24)
                .padding(.top, 11)

                Spacer().frame(height: 40)

                VStack(alignment: .leading) {
                    HStack {
                        Text("공부하면서 아쉬웠던 점은...")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        Text("\(explain2.count) / \(maxTextLength)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }

                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .frame(height: 160)

                        TextEditor(text: $explain2)
                            .onChange(of: explain2) { newValue in
                                if newValue.count > maxTextLength {
                                    explain2 = String(newValue.prefix(maxTextLength))
                                }
                            }
                            .padding(.all, 10)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .background(Color.clear)
                            .frame(maxWidth: .infinity, maxHeight: 140)
                            .clipped()
                    }
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
                
                    Text("이런 이유 때문에 아쉬웠어요.")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 18)
                        .padding(.bottom, 8)
                
                ScrollView{
                    // "해당 없음" 태그
                    VStack(alignment: .leading) {
                        LazyVGrid(columns: [GridItem(.flexible())], spacing: 12) {
                            Button(action: {
                                if selectedTags.contains("#해당없음") {
                                    selectedTags.removeAll()
                                } else {
                                    selectedTags = ["#해당없음"]
                                }
                            }) {
                                Text("#해당없음")
                                    .font(.system(size: 14))
                                    .foregroundColor(selectedTags.contains("#해당없음") ? CustomColor.colors.first! : .black)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(selectedTags.contains("#해당없음") ? CustomColor.colors.first! : Color.gray.opacity(0.2))
                                    )
                            }
                        }
                        .padding(.horizontal, 18)
                        .padding(.bottom, 20)
                    }
                    
                    // 태그 선택 영역
                    VStack(alignment: .leading) {
                        ForEach(categories.keys.sorted(), id: \.self) { category in
                            Text(category)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 20)
                                .padding(.bottom, -2)
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                ForEach(categories[category]!, id: \.self) { tag in
                                    Button(action: {
                                        if selectedTags.contains(tag) {
                                            selectedTags.removeAll { $0 == tag }
                                        } else {
                                            selectedTags.removeAll { $0 == "#해당없음" }
                                            selectedTags.append(tag)
                                        }
                                    }) {
                                        Text(tag)
                                            .font(.system(size: 14))
                                            .foregroundColor(selectedTags.contains(tag) ? CustomColor.colors.first! : .black)
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
                            .padding(.bottom, 10)
                        }
                    }
                }
                // 다음으로 버튼
                NavigationLink(destination: DiaryCreateView5()) {
                    Text("다음으로")
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

struct DiaryCreateView4_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCreateView4()
    }
}
