//
//  DiaryRowView.swift
//  Obok
//
//  Created by 김민경 on 11/26/24.
//

import SwiftUI

struct DiaryRowView: View {
    let diary: Diary // Models/Diary.swift에서 정의된 Diary 사용

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(diary.title)
                .font(.headline)
                .foregroundColor(.black)

            Text("7. 공부한 내용 : \(diary.content)")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .padding(.leading, 10)

            HStack {
                Text("마음")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                
                Text("분량")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                Spacer()
                
                Text("이해도")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)

            HStack {
                Text("#열심히")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.blue)
                Spacer()
                
            
                Text("\(diary.understandingLevel) 페이지")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.orange)
                Spacer()
                
                Text("\(diary.understandingLevel * 10)%")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.red)

            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 8)
    }
}
