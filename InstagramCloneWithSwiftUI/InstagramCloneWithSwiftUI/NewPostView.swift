//
//  NewPostView.swift
//  InstagramCloneWithSwiftUI
//
//  Created by 김승원 on 7/6/24.
//

import SwiftUI

struct NewPostView: View {
    // MARK: - Properties
    @State var caption = ""
    var body: some View {
        VStack {
            // MARK: - Navigation Bar
            HStack{
                Button {
                    print("DEBUG: 뒤로가기")
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
                
                Spacer()
                
                Text("새 게시물")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                // 텍스트 중앙에 맞추기 위함
                Image(systemName: "chevron.right")
                    .foregroundStyle(.clear)
            }
            .padding(.horizontal)
            
            // MARK: - image View
            Image("image_penguin")
                .resizable()
//                .frame(width: 300, height: 300)
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            // MARK: - TextField
            TextField("문구를 작성하거나 설문을 추가하세요...", text: $caption)
                .padding()

            Spacer()
            
            // MARK: - 사진 공유 버튼
            Button {
                print("DEBUG: 사진 공유")
            } label: {
                Text("공유")
                    .frame(maxWidth: .infinity, maxHeight: 42)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

#Preview {
    NewPostView()
}
